#!/bin/sh

echo "Running DeeplTranslateTool with arguments $*"
printf '%d args:' "$#"
printf " '%s'" "$@"
printf '\n'

git clone https://github.com/kazda01/deepl-translate-tool.git
cd deepl-translate-tool
ls -l
cd DeepLTranslateTool

dotnet run --