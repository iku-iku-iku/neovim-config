# NeoVim 从入门到放弃

## 安装

先安装 `neovim`

```shell
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo ln -s $(pwd)/nvim.appimage /usr/bin/nvim
```

首先备份一下原有的配置文件

```shell
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

然后下载 `starter template`

```shell
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
```

## 配置

输入 `:LazyExtras` 勾选以下扩展（按x可以勾选）:

- lang.clangd
- lang.cmake
- lang.markdown
- lang.python
- lang.rust
- coding.copilot

这里可能需要安装一些额外的东西：

```shell
sudo apt install clangd cmake
npm install -g markdownlint-cli
# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
```

## 概念

- lazyvim 中每个打开的文件都是一个buffer

## 快捷键

建议看一下[tips](https://www.lazyvim.org/configuration/tips)

### 好用的默认快捷键

- 以下每个给出的快捷键都是按照常用程度从高到低进行排列
- 使用感叹号来强调重要程度，越多感叹号越常用

[所有的默认快捷键配置](https://www.lazyvim.org/keymaps)

#### 工作流

基本工作流

|key|desc|
|---|---|
|`<leader><space>`|全局查找文件!!!!|
|`<leader>/`|全局搜索文件内容!!!!|
|`<leader>,`|在打开的buffer中切换!!!!|
|`<C-/>`|toggle 终端!!!|
|`<leader>` + \`|切换到上一个buffer|

全局工作流

|key|desc|
|---|---|
|`<leader>qq`|退出当前会话|
|`<leader>ql`|恢复上次会话|

buffer 工作流

|key|desc|
|---|---|
|`<leader>bo`|删除除了当前buffer外的所有buffer|
|`<leader>bd`|删除当前buffer|
|`<leader>sh`|搜索help|

window 工作流

|key|desc|
|---|---|
|`<leader>` + '-'|水平分割窗口|
|`<leader>` + '|'|垂直分割窗口|
|`<leader>wd`|删除当前窗口|
|`C-hjkl`|在窗口间切换，方向就是hjkl对应的方向|
|`<leader>e`|toggle 文件树|
|`<leader>be`|toggle 打开的文件组成的文件树|

#### 编码

|key|desc|
|---|---|
|`gc`|注释|

### 自己配置的快捷键

在 `lua/config/keymaps.lua` 中配置自定义快捷键，可以参考此仓库的配置
