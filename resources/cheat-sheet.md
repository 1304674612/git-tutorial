# Git 速查表

## 基础配置

```bash
# 设置用户名和邮箱
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# 查看配置
git config --list
git config user.name

# 设置默认编辑器
git config --global core.editor "code --wait"
```

## 仓库操作

```bash
# 初始化新仓库
git init

# 克隆仓库
git clone <url>
git clone <url> <directory>

# 查看仓库状态
git status
git status -s  # 简洁格式
```

## 文件操作

### 添加文件
```bash
git add <file>          # 添加指定文件
git add .               # 添加所有文件
git add *.txt           # 添加所有 .txt 文件
git add -A              # 添加所有文件（包括删除的）
git add -u              # 只添加已跟踪的文件
```

### 提交更改
```bash
git commit -m "提交信息"    # 提交暂存的文件
git commit -am "提交信息"   # 添加并提交已跟踪的文件
git commit --amend         # 修改最后一次提交
```

### 查看差异
```bash
git diff                   # 工作区与暂存区的差异
git diff --cached          # 暂存区与最后提交的差异
git diff HEAD              # 工作区与最后提交的差异
git diff <commit1> <commit2>  # 两次提交间的差异
```

## 历史查看

```bash
git log                    # 查看提交历史
git log --oneline          # 简洁格式
git log --graph            # 图形化显示
git log --stat             # 显示统计信息
git log -p                 # 显示差异
git log -n 5               # 显示最近 5 次提交
git log --author="name"    # 查看指定作者的提交
git log --grep="keyword"   # 搜索提交信息
git log <file>             # 查看文件的提交历史

git show <commit>          # 显示提交详情
git blame <file>           # 查看文件每行的修改者
```

## 撤销操作

### 撤销工作区修改
```bash
git checkout -- <file>    # 撤销文件修改
git checkout -- .         # 撤销所有修改
git restore <file>         # 新版本命令
```

### 撤销暂存
```bash
git reset HEAD <file>      # 撤销文件暂存
git reset HEAD             # 撤销所有暂存
git restore --staged <file>  # 新版本命令
```

### 撤销提交
```bash
git reset --soft HEAD~1    # 撤销提交，保留暂存和工作区
git reset HEAD~1           # 撤销提交和暂存，保留工作区
git reset --hard HEAD~1    # 撤销提交、暂存和工作区（危险）
git revert <commit>        # 创建新提交来撤销指定提交
```

## 分支操作

```bash
# 查看分支
git branch                 # 查看本地分支
git branch -r              # 查看远程分支
git branch -a              # 查看所有分支

# 创建分支
git branch <branch-name>   # 创建分支
git checkout -b <branch>   # 创建并切换分支
git switch -c <branch>     # 新版本命令

# 切换分支
git checkout <branch>      # 切换分支
git switch <branch>        # 新版本命令

# 合并分支
git merge <branch>         # 合并指定分支到当前分支
git merge --no-ff <branch> # 禁用快进合并

# 删除分支
git branch -d <branch>     # 删除已合并的分支
git branch -D <branch>     # 强制删除分支
```

## 远程仓库

```bash
# 查看远程仓库
git remote                 # 查看远程仓库
git remote -v              # 查看远程仓库 URL
git remote show <remote>   # 查看远程仓库详情

# 添加远程仓库
git remote add <name> <url>

# 获取远程更新
git fetch <remote>         # 获取远程更新
git pull <remote> <branch> # 获取并合并
git pull                   # 获取并合并当前分支

# 推送到远程
git push <remote> <branch> # 推送分支
git push                   # 推送当前分支
git push -u origin <branch>  # 推送并设置上游分支
```

## 标签操作

```bash
# 查看标签
git tag                    # 查看所有标签
git tag -l "v1.*"          # 查看匹配的标签

# 创建标签
git tag <tag-name>         # 创建轻量标签
git tag -a <tag> -m "message"  # 创建附注标签

# 推送标签
git push origin <tag>      # 推送指定标签
git push origin --tags     # 推送所有标签

# 删除标签
git tag -d <tag>           # 删除本地标签
git push origin :refs/tags/<tag>  # 删除远程标签
```

## 存储操作

```bash
git stash                  # 存储当前工作
git stash push -m "message"  # 带消息存储
git stash list             # 查看存储列表
git stash show             # 查看最新存储的差异
git stash pop              # 应用并删除最新存储
git stash apply            # 应用存储但不删除
git stash drop             # 删除最新存储
git stash clear            # 清除所有存储
```

## 文件管理

```bash
# 重命名/移动文件
git mv <old> <new>

# 删除文件
git rm <file>              # 删除文件并暂存删除操作
git rm --cached <file>     # 从 Git 中删除但保留本地文件

# 忽略文件
echo "*.log" >> .gitignore
git add .gitignore
```

## 搜索和检查

```bash
git grep "search-term"     # 在工作目录中搜索
git grep "term" <commit>   # 在指定提交中搜索
git log --grep="bug"       # 在提交消息中搜索
git log -S "function_name" # 搜索代码变更
```

## 常用组合命令

```bash
# 查看最近的提交
git log --oneline -10

# 查看分支图
git log --graph --oneline --all

# 查看文件的提交历史
git log --follow <file>

# 查看两个分支的差异
git diff branch1..branch2

# 统计代码行数
git log --stat

# 查看谁修改了这行代码
git blame <file>
```

## 别名设置

```bash
# 设置常用别名
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.unstage 'reset HEAD --'
git config --global alias.last 'log -1 HEAD'
git config --global alias.visual '!gitk'
```

## 帮助命令

```bash
git help <command>         # 查看命令帮助
git <command> --help       # 查看命令帮助
git help -a                # 查看所有可用命令
```

---

**提示**: 在命令前加 `git` 是必需的。大多数命令都有更多选项，使用 `git help <command>` 查看详细文档。