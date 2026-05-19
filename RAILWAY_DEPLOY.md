# Railway 部署指南

Railway 是一个易用的云平台，提供免费额度部署容器化应用。

## 部署步骤

### 1. 注册 Railway 账户
1. 访问 [railway.app](https://railway.app)
2. 使用 GitHub 账户登录

### 2. 部署项目

**方式一：通过 GitHub 部署（推荐）**

1. 在 Railway Dashboard 点击 **"New Project"**
2. 选择 **"Deploy from GitHub repo"**
3. 选择 `zhangzhang-super/pixel-gemini` 仓库
4. 点击 **"Deploy"**

**方式二：使用 Railway CLI**

```bash
# 安装 Railway CLI
npm install -g @railway/cli

# 登录
railway login

# 进入项目目录
cd pixel-gemini

# 关联项目
railway link

# 部署
railway up
```

### 3. 配置环境变量

1. 在 Railway Dashboard 选择项目
2. 点击 **"Variables"** 标签
3. 添加变量：
   - `TELEGRAM_BOT_TOKEN` = 你的 Bot Token

### 4. 查看日志

```bash
railway logs
```

## 免费额度

- 每月 $5 免费额度
- 512 MB RAM
- 1 GB 磁盘空间
- 100 GB 出站流量

## 保持服务运行

Railway 会自动保持服务运行，无需额外配置。

## 故障排除

### 服务崩溃重启
检查日志中的错误信息：
```bash
railway logs --tail
```

### Chrome 启动失败
确保 Dockerfile 中的 Chrome 路径正确：
```
ENV CHROME_BIN=/usr/bin/chromium
```
