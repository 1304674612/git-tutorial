# Git 基础练习

## 练习 1: 创建和初始化仓库

### 目标
学习如何创建新的 Git 仓库并进行基本配置。

### 步骤
1. 创建一个新的项目目录
2. 初始化 Git 仓库
3. 配置用户信息
4. 创建第一个文件并提交

### 详细指令

```bash
# 1. 创建项目目录
mkdir my-first-repo
cd my-first-repo

# 2. 初始化 Git 仓库
git init

# 3. 配置用户信息（如果还没有配置）
git config user.name "Your Name"
git config user.email "your.email@example.com"

# 4. 创建第一个文件
echo "# 我的第一个 Git 项目" > README.md

# 5. 查看状态
git status

# 6. 添加文件到暂存区
git add README.md

# 7. 提交文件
git commit -m "Initial commit: Add README"

# 8. 查看提交历史
git log
```

### 验证
- 使用 `git status` 应该显示 "working tree clean"
- 使用 `git log` 应该显示一次提交记录

---

## 练习 2: 文件修改和提交

### 目标
学习如何修改文件、查看差异和提交更改。

### 步骤
1. 修改现有文件
2. 查看修改差异
3. 添加并提交更改
4. 创建新文件并提交

### 详细指令

```bash
# 1. 修改 README.md 文件
echo "
## 项目描述
这是我学习 Git 的第一个项目。

## 功能
- 学习 Git 基础操作
- 练习文件版本控制
" >> README.md

# 2. 查看修改
git status
git diff

# 3. 添加并提交修改
git add README.md
git commit -m "Update README with project description"

# 4. 创建新文件
echo "print('Hello, Git!')" > hello.py

# 5. 添加新文件
git add hello.py
git commit -m "Add hello.py script"

# 6. 查看历史
git log --oneline
```

### 验证
- 应该有 3 次提交记录
- 工作目录应该是干净的

---

## 练习 3: 撤销操作

### 目标
学习如何撤销不同阶段的修改。

### 步骤
1. 修改文件但不添加到暂存区，然后撤销
2. 修改文件并添加到暂存区，然后撤销暂存
3. 提交后修改最后一次提交信息

### 详细指令

```bash
# 1. 修改文件
echo "# 这是一个错误的修改" >> README.md

# 查看修改
git diff

# 撤销工作区修改
git checkout -- README.md

# 验证修改被撤销
git status

# 2. 再次修改并添加到暂存区
echo "## 新功能" >> README.md
git add README.md

# 查看状态
git status

# 撤销暂存
git reset HEAD README.md

# 3. 添加正确的内容并提交
echo "
## 新功能
- 文件版本控制
- 历史记录查看
" >> README.md

git add README.md
git commit -m "Add new features section"

# 修改最后一次提交信息
git commit --amend -m "Add features section to README"
```

### 验证
- 最后一次提交的信息应该是 "Add features section to README"
- 工作目录应该是干净的

---

## 练习 4: 使用 .gitignore

### 目标
学习如何忽略不需要跟踪的文件。

### 步骤
1. 创建一些临时文件
2. 创建 .gitignore 文件
3. 验证文件被忽略

### 详细指令

```bash
# 1. 创建一些临时文件
echo "temporary data" > temp.log
echo "cache data" > cache.tmp
mkdir __pycache__
echo "compiled" > __pycache__/module.pyc

# 查看状态（应该看到未跟踪的文件）
git status

# 2. 创建 .gitignore 文件
cat > .gitignore << EOF
# 日志文件
*.log

# 临时文件
*.tmp

# Python 缓存
__pycache__/
*.pyc

# IDE 文件
.vscode/
.idea/
EOF

# 3. 添加 .gitignore
git add .gitignore
git commit -m "Add .gitignore file"

# 查看状态（临时文件应该不再显示）
git status
```

### 验证
- `git status` 不应该显示 .log、.tmp 文件和 __pycache__ 目录
- .gitignore 文件应该被跟踪

---

## 练习 5: 查看历史和信息

### 目标
学习如何查看项目历史和文件信息。

### 步骤
1. 查看不同格式的提交历史
2. 查看特定文件的历史
3. 查看提交的详细信息

### 详细指令

```bash
# 1. 查看提交历史
git log
git log --oneline
git log --graph
git log --stat

# 2. 查看特定文件的历史
git log README.md
git log -p README.md

# 3. 查看特定提交的信息
# 首先获取提交 hash
git log --oneline

# 使用 hash 查看提交详情（替换 <commit-hash> 为实际的 hash）
git show <commit-hash>

# 4. 查看文件在特定时间点的内容
git show HEAD~1:README.md

# 5. 搜索提交
git log --grep="README"
```

### 验证
- 能够看到所有提交的历史
- 能够查看特定提交的详细信息

---

## 挑战练习

完成上述所有练习后，尝试以下挑战：

1. **项目模拟**: 创建一个模拟的项目，包含源代码、文档、测试文件等，并进行多次有意义的提交。

2. **错误修复**: 故意创建一些错误的提交，然后练习各种撤销方法。

3. **文件管理**: 练习重命名、移动、删除文件的 Git 操作。

4. **历史分析**: 使用各种 `git log` 选项分析项目历史。

## 完成标准

- [ ] 成功创建和初始化 Git 仓库
- [ ] 能够添加、修改、提交文件
- [ ] 掌握撤销操作的不同方法
- [ ] 能够使用 .gitignore 管理文件
- [ ] 熟练查看和分析项目历史
- [ ] 理解 Git 的基本工作流程

完成这些练习后，您就具备了 Git 的基础操作能力，可以继续学习分支管理等高级功能。