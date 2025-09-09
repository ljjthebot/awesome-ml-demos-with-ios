# Image Rotation Demo

<p align="center">
  <img src="../Resource/imagerotation-demo-preview.gif" width="200"/>
</p>

一个iOS Swift应用demo，实现图片选择和旋转速度控制功能。

## 功能特性

- **📷 图片选择功能**: 从相册中选择图片
- **🔄 图片旋转功能**: 选中的图片能够在view上绕中心点旋转
- **⚡ 转速控制功能**: 通过滑块控制图片的旋转速度 (0.1x - 5.0x)

## 技术实现

### 核心技术栈
- **Swift 5.0+** - 主要编程语言
- **UIKit** - 用户界面框架
- **PhotosUI (PHPickerViewController)** - 图片选择
- **Core Animation (CABasicAnimation)** - 旋转动画
- **Auto Layout** - 响应式布局

### 关键实现细节

#### 1. 图片选择
```swift
// 使用 PHPickerViewController 进行图片选择
var configuration = PHPickerConfiguration()
configuration.filter = .images
configuration.selectionLimit = 1

let picker = PHPickerViewController(configuration: configuration)
picker.delegate = self
present(picker, animated: true)
```

#### 2. 旋转动画
```swift
// 使用 Core Animation 实现平滑旋转
let rotation = CABasicAnimation(keyPath: "transform.rotation")
rotation.fromValue = 0
rotation.toValue = CGFloat.pi * 2
rotation.duration = CFTimeInterval(2.0 / currentRotationSpeed)
rotation.repeatCount = .infinity

imageView.layer.add(rotation, forKey: "rotation")
```

#### 3. 速度控制
```swift
// 滑块控制旋转速度
@objc private func speedChanged(_ sender: UISlider) {
    currentRotationSpeed = sender.value
    speedLabel.text = String(format: "转速: %.1fx", currentRotationSpeed)
    
    if isRotating {
        startRotationAnimation() // 实时更新动画速度
    }
}
```

## UI 布局

界面采用垂直布局设计：

```
┌─────────────────────┐
│    [ 选择图片 ]      │  ← 顶部：图片选择按钮
├─────────────────────┤
│                     │
│   ┌─────────────┐   │  ← 中间：图片显示区域
│   │   🖼️ 图片   │   │     (支持旋转动画)
│   └─────────────┘   │
│                     │
├─────────────────────┤
│   转速: 2.5x        │  ← 底部：速度显示标签
│  ◀────●─────────▶   │  ← 速度控制滑块
└─────────────────────┘
```

## 权限配置

在 `Info.plist` 中添加了必要的权限：

```xml
<!-- 相册访问权限 -->
<key>NSPhotoLibraryUsageDescription</key>
<string>This app needs access to photo library to select images for rotation animation.</string>

<!-- iOS 14+ 限制访问级别 -->
<key>PHPickerViewControllerPhotoLibraryAccessLevel</key>
<string>add-only</string>
```

## 项目结构

```
ImageRotationDemo/
├── ViewController.swift    # 主控制器
├── AppDelegate.swift       # 应用委托
├── SceneDelegate.swift     # 场景委托
├── Info.plist             # 项目配置和权限
└── README.md              # 项目文档
```

## 使用方法

1. **选择图片**: 点击"选择图片"按钮从相册选择一张图片
2. **开始旋转**: 选择图片后自动开始旋转动画
3. **调整速度**: 使用底部滑块调整旋转速度 (0.1x 到 5.0x)
4. **实时控制**: 滑块调整会实时影响旋转速度

## 系统要求

- **iOS 14.0+** (使用 PHPickerViewController)
- **Xcode 12.0+**
- **Swift 5.0+**

## 演示效果

该demo展示了：
- ✅ 流畅的图片旋转动画
- ✅ 实时的速度控制
- ✅ 现代化的图片选择器
- ✅ 响应式的用户界面
- ✅ 清晰的用户交互反馈

## 扩展可能性

- 添加暂停/恢复功能
- 支持多种旋转方向
- 添加更多动画效果
- 支持手势控制
- 添加图片保存功能

---

> 这个demo是 [awesome-ml-demos-with-ios](https://github.com/ljjthebot/awesome-ml-demos-with-ios) 项目的一部分，展示了iOS平台上的图片处理和动画技术。