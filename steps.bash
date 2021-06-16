#!/bin/bash

### Environment Checking
if ! command -v ag &> /dev/null
then
    echo "Silver Grep not found"
    # exit 1
fi

echo "Node.js Version: $(node -v)"
echo "NPM: $(npm -v)"
echo "Yarn: $(yarn -v)"

echo "Workspace: ${1:-workspace}"
mkdir -p ${1:-workspace}
cd $_
pwd -P

yarn init -y
yarn add --dev truffle typechain @typechain/truffle-v5
npx truffle init
npx truffle create contract Example

cat <<EOF
node_modules/
build/
EOF > .gitignore
