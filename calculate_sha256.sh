#!/bin/bash

# 遍历当前目录下的所有文件，忽略 .git 文件夹
echo "|文件名 | sha256sum|"
echo "|- | -|"
find . -path './.git' -prune -o -type f -print0 | while IFS= read -r -d '' file; do
    # 去除文件名中的 ./ 符号
    cleaned_file=$(echo "$file" | sed 's/^\.\///')
    # 计算文件的 sha256sum
    sha256=$(sha256sum "$file" | awk '{print $1}')
    # 格式化输出文件名和对应的 sha256sum
    printf "|%-60s | %s|\n" "$cleaned_file" "$sha256"
done