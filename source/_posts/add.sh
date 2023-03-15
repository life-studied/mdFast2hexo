#!/bin/bash

# 遍历当前目录下所有 .md 文件
find . -type f -name "*.md" | while read file; do
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
  # 在每个.md文件的第一行插入<!--more-->
  sed -i '5i <!--more-->' "$new_filename"
  echo "add more tag in $new_filename"
done