# v6.1 修复说明

## 已修复

- 新增 `Sources/StandaloneBootstrap.m` 自动启动入口。
- dylib 加载后会等待应用窗口出现，再挂载透明悬浮层。
- 左上角显示 `YY` 浮标；点击可开关状态面板。
- 首次挂载会显示约 1.5 秒的 `YYModel loaded` HUD。
- Metal 触控坐标会显示在状态面板中。
- 构建后执行 ad-hoc 签名，并在 GitHub Actions 中验证签名及 `__mod_init_func`。

## 编译后应看到什么

1. 启动目标应用。
2. 短暂出现 `YYModel loaded`。
3. 左上角出现圆形 `YY` 按钮。
4. 点击状态面板，可看到 `Metal rendering: active` 和触控坐标。

如果以上内容全部没有出现，说明 dylib 没有被目标进程加载，而不是界面代码没有执行。检查运行日志中是否存在：

```text
[YYModelStandalone] bootstrap loaded
[YYModelStandalone] overlay attached to ...
```

## 重要限制

- 编译出 dylib 不等于已注入应用；目标应用必须包含该 dylib 的加载引用。
- dylib 放进 IPA 后，需要重新签名整个 IPA。
- 该版本只验证通用 Metal/触控/HUD/WebView 组件和启动链，不包含授权绕过、服务器协议或应用/游戏数据功能。
