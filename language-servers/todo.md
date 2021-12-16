# How to get all the language servers

## Python

pip install -r requirements.txt to get all the python lsp stuff

## lua

- Execute `~/.config/nvim/bundle/nlua.nvim/scripts/download_sumneko.lua via`
  - `:luafile %` after loading it in nvim.

```console
cd ~/.cache/nvim/nlua/sumneko_lua/lua-language-server/bin
mkdir Linux
cp * Linux/
```

## zig

Download the zig language server from github and unpack it in ~/bin/

## markdownlint (for null-ls)

```console
sudo npm install -g markdownlint-cli
```
