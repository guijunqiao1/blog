#!/bin/bash

# 博客部署脚本
# 使用方法: ./deploy.sh "你的提交信息"

# 颜色定义
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}开始部署博客...${NC}"

# 检查是否有提交信息
if [ -z "$1" ]; then
    COMMIT_MSG="update: 更新博客内容"
else
    COMMIT_MSG="$1"
fi

# 添加所有修改
echo -e "${GREEN}1. 添加修改的文件...${NC}"
git add .

# 检查是否有修改
if git diff --staged --quiet; then
    echo -e "${YELLOW}没有检测到修改，退出部署。${NC}"
    exit 0
fi

# 提交修改
echo -e "${GREEN}2. 提交修改...${NC}"
git commit -m "$COMMIT_MSG"

# 推送到 GitHub
echo -e "${GREEN}3. 推送到 GitHub...${NC}"
git push origin main

echo -e "${GREEN}✅ 部署完成！${NC}"
echo -e "${YELLOW}GitHub Actions 正在自动构建和部署...${NC}"
echo -e "查看部署进度: ${GREEN}https://github.com/guijunqiao1/blog/actions${NC}"
echo -e "博客地址: ${GREEN}https://guijunqiao1.github.io/blog/${NC}"

