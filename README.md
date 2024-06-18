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

##### 基本工作流

| key               | desc                     |
| ----------------- | ------------------------ |
| <C-s>             | 保存文件!!!!             |
| `<leader><space>` | 全局查找文件!!!!         |
| `<leader>/`       | 全局搜索文件内容!!!!     |
| `<leader>,`       | 在打开的buffer中切换!!!! |
| `<C-\>`           | toggle 终端!!!           |
| `n<C-\>`          | 打开第n个终端!!!         |
| `<leader>` + \`   | 切换到上一个buffer       |

以下是一些自定义的：

| key             | desc                     |
| --------------- | ------------------------ |
| <C-w>           | 全局搜索关闭所在的词!!!! |
| `<leader> + tf` | 打开/关闭 format on save |

> terminal 中的快捷键
>
> `<esc>`: 从 terminal 模式进入 termial 模式
>
> `i`: 从 normal 模式进入 terminal 模式

##### 全局工作流

| key          | desc         |
| ------------ | ------------ |
| `<leader>qq` | 退出当前会话 |
| `<leader>ql` | 恢复上次会话 |

##### buffer 工作流

| key          | desc                             |
| ------------ | -------------------------------- |
| `<leader>bp` | pin住当前窗口!!                  |
| `<leader>bP` | 关闭没有pin住的窗口!!            |
| `<leader>bo` | 删除除了当前buffer外的所有buffer |
| `<leader>bd` | 删除当前buffer                   |

##### window 工作流

| key               | desc                                     |
| ----------------- | ---------------------------------------- |
| `C-hjkl`          | 在窗口间切换，方向就是hjkl对应的方向!!!! |
| `<leader>e`       | toggle 文件树!!!                         |
| `<leader>` + '-'  | 水平分割窗口                             |
| `<leader>` + '\|' | 垂直分割窗口                             |
| `<leader>wd`      | 删除当前窗口                             |
| `<leader>be`      | toggle 打开的文件组成的文件树            |

##### git 工作流

| key          | desc                               |
| ------------ | ---------------------------------- |
| `<leader>gg` | 打开lazygit(打开后按?可以查看用法) |

基本用法：

- a：git add .
- c: git commit -m
- p: git pull
- P: git push
- q: quit

#### debug

> 不推荐用nvim调试

| key          | desc       |
| ------------ | ---------- |
| `<leader>du` | 打开调试UI |
| `<leader>db` | 打断点     |
| `<leader>da` | 运行       |

#### 编码

| key  | desc                                     |
| ---- | ---------------------------------------- |
| `gc` | 注释                                     |
| `gs` | surrounding相关，具体用法which-key会给出 |

#### 其他好用的快捷键

| key          | desc           |
| ------------ | -------------- |
| `<leader>sk` | 搜索keymaps!!! |
| `<leader>sh` | 搜索help       |

### 自己配置的快捷键

在 `lua/config/keymaps.lua` 中配置自定义快捷键，可以参考此仓库的配置

## 更酷炫一些

neovide 目前还有一些bug，大多数时候用nvim，但是neovide真的酷炫啊！

```shell
wget https://github.com/neovide/neovide/releases/latest/download/neovide.AppImage
chmod u+x neovide.AppImage
sudo mv neoivde.AppImage /usr/bin/neovide
```
