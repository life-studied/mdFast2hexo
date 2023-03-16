#!/bin/bash

# 设置源目录和目标目录
source_dir="D:\文件合集\markdown合集"
target_dir="./source/_posts"

# 清理目标目录下的所有文件
rm -rf $target_dir/*
echo "清理完成！"

# 复制源目录下的所有文件及其子文件到目标目录下
cp -r "$source_dir"/* "$target_dir"
echo "copy completed!"

# 遍历当前目录下所有 .md 文件
find $target_dir -type f -name "*.md" | while read file; do
  # 获取文件的修改日期
  modified=$(stat -c %y "$file" | awk '{print $1}')
  # 获取文件名和扩展名，并删除特殊字符
  filename=$(basename "$file" .md | sed 's/\./-/g')
  extension=".md"
  # 新文件名为修改日期和原文件名用下划线连接
  new_filename="${modified}_${filename}${extension}"
  # 如果新文件名和原文件名不同，则重命名文件
  if [ "$new_filename" != "$filename$extension" ]; then
    # 将文件名和路径分开处理，并使用双引号将变量括起来
    file_dir=$(dirname "$file")
    mv "$file" "$file_dir/$new_filename"
    echo "Renamed $file to $new_filename"
  fi
done

# 定义查找文件的函数
function find_md_files() {
    local dir="$1"
    for file in "$dir"/*; do
        if [[ -d "$file" ]]; then
            find_md_files "$file"
        elif [[ "$file" == *.md ]]; then
            # 在第五行插入<!--more-->
            sed -i '5i<!--more-->' "$file"
            echo ""$file" has added <!--more-->"
        fi
    done
}

# 在当前目录下的source/_posts目录中查找.md文件并插入<!--more-->
find_md_files "source/_posts"

echo "插入完成！"
