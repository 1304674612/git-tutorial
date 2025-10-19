#!/bin/bash

# 自动修复 Markdown 格式问题的脚本

echo "🔧 开始修复 Markdown 格式问题..."

# 函数：在标题前后添加空行
fix_headings() {
    local file="$1"
    echo "修复文件: $file"
    
    # 创建临时文件
    local temp_file=$(mktemp)
    
    # 处理文件
    awk '
    BEGIN { prev_line = ""; in_code_block = 0 }
    
    # 检测代码块
    /^```/ { 
        in_code_block = !in_code_block 
        print
        prev_line = $0
        next
    }
    
    # 如果在代码块中，直接输出
    in_code_block {
        print
        prev_line = $0
        next
    }
    
    # 处理标题
    /^#{1,6} / {
        # 如果前一行不是空行且不是开头，添加空行
        if (prev_line != "" && NR > 1) {
            print ""
        }
        print
        prev_line = $0
        next
    }
    
    # 处理代码块开始
    /^```/ && !in_code_block {
        # 如果前一行不是空行，添加空行
        if (prev_line != "") {
            print ""
        }
        print
        prev_line = $0
        next
    }
    
    # 处理列表
    /^[[:space:]]*[-*+] / {
        # 如果前一行不是空行且不是列表项，添加空行
        if (prev_line != "" && prev_line !~ /^[[:space:]]*[-*+] / && prev_line !~ /^[[:space:]]*$/) {
            print ""
        }
        print
        prev_line = $0
        next
    }
    
    # 其他行
    {
        print
        prev_line = $0
    }
    ' "$file" > "$temp_file"
    
    # 替换原文件
    mv "$temp_file" "$file"
    
    # 确保文件以单个换行符结尾
    if [ -s "$file" ]; then
        # 移除文件末尾的多余空行
        sed -i '' -e :a -e '/^\s*$/N' -e 's/\n\s*$//' -e ta "$file"
        # 添加单个换行符
        echo "" >> "$file"
    fi
}

# 修复所有 Markdown 文件
find . -name "*.md" -not -path "./.git/*" | while read -r file; do
    fix_headings "$file"
done

echo "✅ Markdown 格式修复完成！"