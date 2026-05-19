# Replit 部署指南 - Pixel Gemini Bot

本文档介绍如何在 Replit 上部署 pixel-gemini Telegram Bot。

## 快速开始

### 1. 导入项目到 Replit

**方式一：从 GitHub 导入**
1. 访问 [Replit](https://replit.com)
2. 点击 **"Create"** → **"Import from GitHub"**
3. 输入仓库地址：`https://github.com/encore22/pixel-gemini`
4. 选择模板：**Python**
5. 点击 **"Import from GitHub"**

**方式二：手动创建**
1. 在 Replit 创建新的 Python Repl
2. 将本项目的所有文件复制到 Repl 中

### 2. 配置环境变量

1. 点击左侧边栏的 **"Secrets"** 🔒 图标
2. 添加以下环境变量：

| 键 | 值 | 说明 |
|---|---|---|
| `TELEGRAM_BOT_TOKEN` | 你的 Bot Token | 从 @BotFather 获取 |

#### 获取 Telegram Bot Token
1. 在 Telegram 中搜索 **@BotFather**
2. 发送 `/newbot` 命令
3. 按照提示设置 Bot 名称和用户名
4. 复制获得的 API Token（格式：`123456789:ABCdefGHIjklMNOpqrsTUVwxyz`）

### 3. 安装依赖

Replit 会自动检测 `requirements.txt` 并安装依赖。如果没有自动安装，在 Shell 中运行：

```bash
pip install -r requirements.txt
```

### 4. 运行 Bot

点击顶部的 **"Run"** 按钮，或在 Shell 中执行：

```bash
python main.py
```

看到以下日志表示 Bot 启动成功：

```
Bot is running. Press Ctrl-C to stop.
```

### 5. 保持 Bot 持续运行（可选但推荐）

Replit 免费版会在一段时间不活动后休眠。要保持 Bot 24/7 运行：

1. 点击 **"Deployments"** 标签
2. 选择 **"Always On"** 或 **"Autoscale"**
3. 按照提示完成部署

> 💡 **提示**: 免费账户有 Always On 配额限制，请合理使用。

## 配置说明

### 已创建的配置文件

| 文件 | 用途 |
|---|---|
| `.replit` | Replit 主配置文件，定义运行命令和环境 |
| `replit.nix` | Nix 包管理配置，安装 Chromium 和 ChromeDriver |
| `.replitignore` | 导入时忽略的文件列表 |

### Chromium 配置

Replit 环境已预配置 Chromium 浏览器和 ChromeDriver：

- **Chromium 路径**: 自动配置
- **ChromeDriver 路径**: 自动配置
- **显示模式**: 无头模式 (headless)

无需修改代码即可在 Replit 上运行 Selenium 自动化。

## 使用 Bot

在 Telegram 中与你的 Bot 对话，使用以下命令：

| 命令 | 功能 |
|---|---|
| `/start` | 显示欢迎信息和命令列表 |
| `/login` | 输入 Gmail 邮箱和密码 |
| `/check_offer` | 模拟 Pixel 10 Pro 设备并检查 Gemini Pro 优惠 |
| `/get_link` | 获取上次捕获的优惠链接 |
| `/status` | 查看当前会话状态和设备信息 |

### 典型使用流程

1. `/start` - 启动 Bot
2. `/login` - 输入 Google 账户凭据
3. `/check_offer` - 检查并获取 Gemini Pro 优惠链接
4. `/get_link` - 再次查看优惠链接

## 故障排除

### Bot 无法启动

**检查日志中的错误信息：**

```
TELEGRAM_BOT_TOKEN environment variable is not set
```
→ 确认已在 Secrets 中设置 `TELEGRAM_BOT_TOKEN`

### Selenium / Chrome 错误

**错误信息：**
```
WebDriverException: Message: 'chromedriver' executable needs to be in PATH
```

**解决方案：**
1. 确认 `replit.nix` 文件存在且内容正确
2. 点击 **"Shell"** 标签，运行：
   ```bash
   which chromium
   which chromedriver
   ```
3. 如果未找到，尝试重新加载 Repl（刷新页面）

### Google 登录失败

**可能原因：**
- 账户启用了两步验证
- Google 检测到异常登录
- 密码错误

**解决方案：**
- 检查邮箱和密码是否正确
- 暂时关闭两步验证（不推荐长期使用）
- 在常用设备上登录一次以解除安全警告

### Bot 响应缓慢

**原因：**
- Selenium 操作需要时间
- Google 页面加载较慢

**正常现象：**
`/check_offer` 命令通常需要 30-60 秒完成，请耐心等待。

## 安全提示

1. **不要在代码中硬编码凭据** - 使用 Replit Secrets
2. **密码仅存储在内存中** - 项目设计如此，重启后需要重新登录
3. **Telegram 密码消息会自动删除** - 输入密码后消息会被立即删除
4. **定期更换 Bot Token** - 如果怀疑 Token 泄露，在 @BotFather 中重新生成

## 限制说明

1. **Replit 免费版限制**：
   - Always On 有运行时间配额
   - 网络请求可能有一定延迟

2. **Google 安全限制**：
   - 频繁登录可能触发验证码
   - 某些账户可能需要额外验证

3. **Bot 限制**：
   - 仅支持单个用户会话
   - 重启后会话数据丢失

## 相关链接

- [项目 GitHub](https://github.com/encore22/pixel-gemini)
- [Replit 文档](https://docs.replit.com)
- [python-telegram-bot 文档](https://docs.python-telegram-bot.org/)
- [Selenium 文档](https://selenium-python.readthedocs.io/)

---

如有问题，请在项目 GitHub Issues 中反馈。
