#!/bin/bash

# 定义一个函数，用于递归处理目录下的所有 .md 文件
function recursiveHandle() {
    for file in "$1"/*; do
        if [[ -d "$file" ]]; then
            # 如果是目录，递归调用该函数处理该目录下的文件
            recursiveHandle "$file"
        elif [[ -f "$file" && "${file##*.}" == "md" ]]; then
            # 如果是 .md 文件，插入一行 <!--more-->
            sed -i '5i <!--more-->' "$file"
        fi
    done
}

# 调用函数处理当前目录下的所有 .md 文件
recursiveHandle "."

echo "Done!"