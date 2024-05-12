const core = require('@actions/core');
const exec = require('@actions/exec');
const fs = require('fs');
const path = require('path');
const https = require('https');

async function downloadFile(url, targetPath) {
  return new Promise((resolve, reject) => {
    const file = fs.createWriteStream(targetPath);
    https.get(url, (response) => {
      response.pipe(file);
      file.on('finish', () => {
        file.close(resolve);
      });
    }).on('error', (error) => {
      fs.unlink(targetPath, () => {
        reject(error);
      });
    });
  });
}

async function run() {
  try {
    // Get inputs from workflow
    const apiKey = core.getInput('api-key');
    const adapter = core.getInput('adapter');
    const sourceLanguage = core.getInput('source-language');
    const languages = core.getInput('languages');
    const inputFile = core.getInput('input-file');
    const path = core.getInput('path');
    const noCache = core.getInput('no-cache');
    const verbose = core.getInput('verbose');

    // Download DeepLTranslateTool binary
    const toolUrl = 'https://github.com/kazda01/deepl-translate-tool/releases/latest/download/DeepLTranslateTool';
    const toolPath = path.join(__dirname, 'DeepLTranslateTool');
    await downloadFile(toolUrl, toolPath);
    fs.chmodSync(toolPath, '755'); // Make the binary executable

    // Execute DeepLTranslateTool binary with arguments
    await exec.exec(toolPath, [
      'translate',
      '--api-key', apiKey,
      '--adapter', adapter,
      '--source-language', sourceLanguage,
      '--languages', languages,
      '--input-file', inputFile,
      '--path', path,
      '--no-cache', noCache,
      '--verbose', verbose
    ]);

  } catch (error) {
    core.setFailed(error.message);
  }
}

run();
