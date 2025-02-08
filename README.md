# AirCalendar

AirCalendar 是一款简约而优雅的日历应用，融合了每日语录和自然音效，为用户带来独特的时间管理体验。

## 特性

### 📅 简约日历
- 清晰的月视图展示
- 优雅的日期切换动画
- 支持农历显示
- 节假日标记

### 💭 每日语录
- 365句精选生活感悟
- 根据日期固定显示
- 覆盖多个主题：
  - 时间感悟
  - 生活态度
  - 内心成长
  - 梦想追求
  - 自然感受
  - 情感表达

### 🎵 自然音效
- 8种精选自然音效：
  - 细雨绵绵
  - 海浪轻拍
  - 林间鸟语
  - 溪水潺潺
  - 微风拂叶
  - 温暖篝火
  - 夜晚虫鸣
  - 山涧流水
- 自动根据日期随机匹配
- 无缝循环播放

## 系统要求

- iOS 15.0+
- Xcode 14.0+
- Swift 5.0+

## 安装

1. 克隆仓库

## 自定义

### 添加新的每日语录
编辑 `DailyQuote.swift` 文件中的 `quotes` 数组。

### 添加新的音效
1. 将 MP3 文件添加到 `Resources/Sounds` 目录
2. 在 `AudioManager.swift` 中的 `natureSounds` 字典中添加对应条目

## 贡献

欢迎提交 Pull Request 或创建 Issue。

## 许可证

本项目采用 MIT 许可证。详见 [LICENSE](LICENSE) 文件。

## 致谢

- 音效来源：[Pixabay](https://pixabay.com/sound-effects/)
- 图标设计：[Icon Kitchen](https://icon.kitchen/)

## 联系方式

如有任何问题或建议，请通过以下方式联系：
- Email: ace.leo.zhu@gmail.com
- GitHub Issues: [创建新 Issue](https://github.com/sanshanchuns/AirCalendar/issues)