#!/bin/sh

echo "Running DeeplTranslateTool with arguments $*"
printf '%d args:' "$#"
printf " '%s'" "$@"
printf '\n'

# Extract input parameters
API_KEY=$1
ADAPTER=$2
SOURCE_LANGUAGE=$3
LANGUAGES=$4
INPUT_FILE=$5
PATH=$6
NO_CACHE=$7

# Use the input parameters as needed
echo "API Key: $API_KEY"
echo "Adapter: $ADAPTER"
echo "Source Language: $SOURCE_LANGUAGE"
echo "Languages: $LANGUAGES"
echo "Input File: $INPUT_FILE"
echo "Path: $PATH"
echo "No Cache: $NO_CACHE"

git clone https://github.com/kazda01/deepl-translate-tool.git

dotnet run --project deepl-translate-tool/DeeplTranslateTool