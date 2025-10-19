# 简单项目示例

这是一个简单的项目示例，用于演示 Git 的基本操作。

## 项目结构

```
simple-project/
├── README.md
├── src/
│   ├── main.py
│   └── utils.py
├── docs/
│   └── api.md
└── tests/
    └── test_main.py
```

## 演示步骤

### 1. 初始化项目

```bash
# 创建项目目录
mkdir simple-project
cd simple-project

# 初始化 Git 仓库
git init

# 创建 README 文件
echo "# 简单项目" > README.md

# 添加并提交
git add README.md
git commit -m "Initial commit: Add README"
```

### 2. 添加源代码

```bash
# 创建源代码目录
mkdir src

# 创建主程序文件
cat > src/main.py << EOF
def main():
    print("Hello, Git!")

if __name__ == "__main__":
    main()
EOF

# 添加并提交
git add src/main.py
git commit -m "Add main program"
```

### 3. 添加工具函数

```bash
# 创建工具函数文件
cat > src/utils.py << EOF
def greet(name):
    return f"Hello, {name}!"

def add_numbers(a, b):
    return a + b
EOF

# 添加并提交
git add src/utils.py
git commit -m "Add utility functions"
```

### 4. 添加文档

```bash
# 创建文档目录
mkdir docs

# 创建 API 文档
cat > docs/api.md << EOF
# API 文档

## main.py
- main(): 主函数

## utils.py
- greet(name): 问候函数
- add_numbers(a, b): 加法函数
EOF

# 添加并提交
git add docs/api.md
git commit -m "Add API documentation"
```

### 5. 添加测试

```bash
# 创建测试目录
mkdir tests

# 创建测试文件
cat > tests/test_main.py << EOF
import sys
import os
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from src.utils import greet, add_numbers

def test_greet():
    assert greet("World") == "Hello, World!"

def test_add_numbers():
    assert add_numbers(2, 3) == 5
EOF

# 添加并提交
git add tests/test_main.py
git commit -m "Add unit tests"
```

### 6. 查看历史

```bash
# 查看提交历史
git log --oneline

# 查看详细历史
git log

# 查看图形化历史
git log --graph --oneline
```

### 7. 修改和更新

```bash
# 修改主程序
cat > src/main.py << EOF
from utils import greet

def main():
    name = input("请输入您的姓名: ")
    print(greet(name))

if __name__ == "__main__":
    main()
EOF

# 查看修改
git diff

# 添加并提交
git add src/main.py
git commit -m "Update main program to use utils"
```

## 常见操作演示

### 查看状态
```bash
git status
```

### 查看差异
```bash
git diff
git diff --cached
```

### 撤销操作
```bash
# 撤销工作区修改
git checkout -- filename

# 撤销暂存
git reset HEAD filename

# 修改最后一次提交
git commit --amend -m "New commit message"
```

## 练习任务

1. 按照上述步骤创建项目
2. 尝试修改某个文件，然后撤销修改
3. 添加一个新文件，然后从暂存区移除
4. 查看项目的完整历史
5. 使用 `git show` 查看某次提交的详细信息

## 扩展练习

1. 添加 `.gitignore` 文件，忽略 Python 的 `__pycache__` 目录
2. 创建更多的测试文件
3. 添加项目配置文件
4. 尝试使用 `git blame` 查看文件的修改历史

