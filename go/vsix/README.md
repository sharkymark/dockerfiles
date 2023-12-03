README.txt

# Amazon CodeWhisperer

The [AWS Toolkit for VS Code extension](https://marketplace.visualstudio.com/items?itemName=AmazonWebServices.aws-toolkit-vscode) is required to run Amazon CodeWhisperer

You also need a free Build ID or your organization's AWS Start page

# GitHub Copilot chat VS Code Extension

2023-11-22

### Installation error

In the latest releases of Copilot chat, the extension throw an error when installing it in `code-server`:

```sh
Installing extensions...
Extension 'GitHub.copilot.vsix' was successfully installed.
Installing extensions...
Error: Unable to install extension 'github.copilot-chat' as it is not compatible with VS Code '1.84.2'
```

### Solution 1

Version `0.11.x` of Github-copilot-chat is pre-release and is only compatible with pre-release of VS Code (`1.85^`).  For now it is recommended to install a non pre-release version of chat.  0.10.2 seems to be the latest and is compatible with code-server `4.19.0`.

 You can download that version here: https://marketplace.visualstudio.com/_apis/public/gallery/publishers/GitHub/vsextensions/copilot-chat/0.10.2/vspackage

### Solution 2

1. You can edit `package.json` in the `extension` directory of an unzipped Github-copilot-chat `vsix` and lower the vscode engine below the error message version.

```json
"engines":{"vscode":"^1.84.0"
```
2. Re-zip the vsix by `cd` into the unzipped extension directory and run:

```sh
zip -r GitHub.copilot-chat.vsix .
```

### Add the `vsix`

1. Either add the `vsix` to a container image
1. Or manually upload it to the location where `code-server` is running
1. Then install the extension by uploading it in the UI
1. Or installing it from the CLI with 

```sh
code-server --install-extension /coder/vsix/GitHub.copilot-chat.vsix
```
