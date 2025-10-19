# Git 基础

## 什么是 Git？

Git 是一个分布式版本控制系统，用于跟踪文件的变化并协调多人在这些文件上的工作。它是由 Linux 内核的创造者 Linus Torvalds 在 2005 年开发的。

## 核心概念

### 仓库 (Repository)
仓库是包含项目文件和完整历史记录的目录。Git 仓库包含：
- 工作目录：实际的项目文件
- 暂存区：准备提交的文件
- Git 目录：存储所有版本信息

### 三个工作区域

1. **工作目录 (Working Directory)**
   - 项目的一个版本的提取
   - 从 Git 目录的压缩数据库中提取出来的文件

2. **暂存区 (Staging Area)**
   - 一个文件，保存了下次将提交的文件列表信息
   - 也被称为"索引"

3. **Git 目录 (Git Directory)**
   - Git 的仓库目录
   - 存储项目的元数据和对象数据库

## 安装 Git

### macOS
```bash
# 使用 Homebrew
brew install git

# 使用 Xcode Command Line Tools
xcode-select --install
```

### Linux (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install git
```

### Windows
下载并安装 [Git for Windows](https://git-scm.com/download/win)

## 配置 Git

安装 Git 后，需要配置用户信息：

```bash
# 设置用户名
git config --global user.name "Your Name"

# 设置邮箱
git config --global user.email "your.email@example.com"

# 查看配置
git config --list
```

## 创建第一个仓库

### 初始化新仓库
```bash
# 在当前目录初始化
git init

# 在新目录初始化
git init my-project
cd my-project
```

### 克隆现有仓库
```bash
git clone https://github.com/user/repo.git
```

## Git 的基本工作流程

1. **修改文件** - 在工作目录中编辑文件
2. **暂存文件** - 使用 `git add` 将修改的文件添加到暂存区
3. **提交文件** - 使用 `git commit` 将暂存区的文件提交到 Git 目录

```bash
# 编辑文件
echo "Hello Git!" > hello.txt

# 添加到暂存区
git add hello.txt

# 提交到仓库
git commit -m "Add hello.txt file"
```

## 文件状态

Git 中的文件有四种状态：

1. **未跟踪 (Untracked)** - 新文件，Git 还不知道它的存在
2. **已修改 (Modified)** - 文件已修改但还没有保存到数据库中
3. **已暂存 (Staged)** - 已修改的文件放在了暂存区域
4. **已提交 (Committed)** - 文件已经安全地保存在本地数据库中

## 检查状态和历史

```bash
# 查看仓库状态
git status

# 查看提交历史
git log

# 查看简洁的历史
git log --oneline

# 查看文件差异
git diff
```

## 下一步

现在您已经了解了 Git 的基础概念，可以继续学习：
- [基本操作](02-basic-operations.md) - 详细学习 add、commit、log 等命令
- [分支管理](03-branching.md) - 学习如何使用分支