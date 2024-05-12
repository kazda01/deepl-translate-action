#!/bin/sh

echo "Running DeeplTranslateTool with arguments $*"
printf '%d args:' "$#"
printf " '%s'" "$@"
printf '\n'

git clone https://github.com/kazda01/deepl-translate-tool.git
ls
cd deepl-translate-tool
ls
cd DeeplTranslateTool
ls

dotnet run --