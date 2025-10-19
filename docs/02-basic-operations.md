# Git 基本操作

## 文件操作命令

### 添加文件到暂存区

```bash
# 添加单个文件
git add filename.txt

# 添加多个文件
git add file1.txt file2.txt

# 添加所有修改的文件
git add .

# 添加所有 .txt 文件
git add *.txt

# 交互式添加
git add -i
```

### 提交更改

```bash
# 提交暂存区的文件
git commit -m "提交信息"

# 添加并提交（跳过暂存区）
git commit -am "提交信息"

# 修改最后一次提交
git commit --amend -m "新的提交信息"
```

## 查看信息

### 查看状态
```bash
# 查看工作区状态
git status

# 简洁输出
git status -s
```

### 查看历史
```bash
# 查看提交历史
git log

# 简洁格式
git log --oneline

# 图形化显示
git log --graph

# 查看最近 n 次提交
git log -n 5

# 查看指定文件的历史
git log filename.txt
```

### 查看差异
```bash
# 查看工作区与暂存区的差异
git diff

# 查看暂存区与最后提交的差异
git diff --cached

# 查看两次提交之间的差异
git diff commit1 commit2

# 查看指定文件的差异
git diff filename.txt
```

## 撤销操作

### 撤销暂存
```bash
# 撤销指定文件的暂存
git reset HEAD filename.txt

# 撤销所有暂存的文件
git reset HEAD
```

### 撤销修改
```bash
# 撤销工作区的修改（危险操作）
git checkout -- filename.txt

# 撤销所有工作区修改
git checkout -- .
```

### 撤销提交
```bash
# 撤销最后一次提交，保留修改
git reset --soft HEAD~1

# 撤销最后一次提交，撤销暂存
git reset HEAD~1

# 撤销最后一次提交，完全删除修改（危险）
git reset --hard HEAD~1
```

## 文件操作

### 删除文件
```bash
# 删除文件并暂存删除操作
git rm filename.txt

# 只从 Git 中删除，保留本地文件
git rm --cached filename.txt
```

### 移动/重命名文件
```bash
# 重命名文件
git mv oldname.txt newname.txt

# 移动文件
git mv file.txt subdirectory/
```

## .gitignore 文件

创建 `.gitignore` 文件来忽略不需要跟踪的文件：

```gitignore
# 忽略所有 .log 文件
*.log

# 忽略临时文件
tmp/
temp/

# 忽略编译生成的文件
*.o
*.exe

# 忽略 IDE 配置文件
.vscode/
.idea/

# 但不忽略这个特定文件
!important.log
```

## 实用技巧

### 查看文件内容
```bash
# 查看指定提交中的文件内容
git show commit_hash:filename.txt

# 查看指定版本的文件
git show HEAD~2:README.md
```

### 文件追踪
```bash
# 查看文件的修改历史
git log -p filename.txt

# 查看文件的每一行是谁修改的
git blame filename.txt
```

### 搜索
```bash
# 在提交历史中搜索
git log --grep="bug fix"

# 在代码中搜索
git grep "function_name"
```

## 练习

1. 创建一个新文件，添加一些内容
2. 将文件添加到暂存区
3. 提交文件
4. 修改文件内容
5. 查看修改差异
6. 提交修改
7. 查看提交历史

## 下一步

- [分支管理](03-branching.md) - 学习创建和管理分支
- [远程仓库](04-remote-repos.md) - 学习与远程仓库协作