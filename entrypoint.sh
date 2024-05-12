#!/bin/sh

echo "Running DeeplTranslateTool with arguments $*"
printf '%d args:' "$#"
printf " '%s'" "$@"
printf '\n'

git clone https://github.com/kazda01/deepl-translate-tool.git
cd deepl-translate-tool
ls -l
cd DeepLTranslateTool

echo "API Key: $1"
echo "Adapter: $2"
echo "Source Language: $3"
echo "Languages: $4"
echo "Input File: $5"
echo "Path: $6"
echo "No Cache: $7"
echo "Verbose: $8"

dotnet run -- translate --api-key $1 --adapter $2 --source-language $3 --languages $4 --input-file $5 --path $6 --no-cache $7 --verbose $8