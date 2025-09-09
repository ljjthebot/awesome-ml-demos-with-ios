# ImageRotationDemo UI Preview

This document shows the visual layout and user interface design of the iOS ImageRotationDemo app.

## App Interface Layout

```
┌─────────────────────────────────────────┐
│                  iOS App                 │
│ ═══════════════════════════════════════ │
│                                         │
│              [ 选择图片 ]                │  ← Top: Image selection button
│                                         │    (Blue button, rounded corners)
│                                         │
│   ┌─────────────────────────────────┐   │
│   │                                 │   │  ← Center: Image display area
│   │        🖼️ Selected Image        │   │    (Gray background when empty)
│   │      (Rotating Animation)       │   │    (Square aspect ratio)
│   │                                 │   │    (Rounded corners)
│   └─────────────────────────────────┘   │
│                                         │
│                                         │
│                                         │
│             转速: 2.5x                   │  ← Speed display label
│                                         │
│   ◀─────●──────────────────────────▶   │  ← Speed control slider
│   0.1x              5.0x               │    (Range: 0.1x to 5.0x)
│                                         │
└─────────────────────────────────────────┘
```

## UI Components

### 1. Image Selection Button
- **Type**: UIButton with system style
- **Text**: "选择图片" (Select Image)
- **Style**: Blue background, white text, rounded corners
- **Action**: Opens PHPickerViewController for image selection

### 2. Image Display View
- **Type**: UIImageView with animation support
- **Background**: Light gray when no image selected
- **Placeholder**: System photo icon
- **Animation**: Continuous rotation using Core Animation
- **Style**: Rounded corners, aspect fit content mode

### 3. Speed Control Section
- **Label**: Shows current rotation speed (e.g., "转速: 2.5x")
- **Slider**: UISlider with range 0.1 to 5.0
- **Behavior**: Real-time speed adjustment during rotation

## User Interaction Flow

```
1. App Launch
   ↓
2. User taps "选择图片" button
   ↓
3. PHPickerViewController appears
   ↓
4. User selects image from photo library
   ↓
5. Image appears in center view
   ↓
6. Rotation animation starts automatically
   ↓
7. User adjusts speed with slider
   ↓
8. Animation speed updates in real-time
```

## Visual States

### Initial State (No Image)
```
┌─────────────────────────────────────────┐
│              [ 选择图片 ]                │
│                                         │
│   ┌─────────────────────────────────┐   │
│   │              📷                 │   │
│   │        Photo Placeholder        │   │
│   │         (Gray area)             │   │
│   └─────────────────────────────────┘   │
│                                         │
│             转速: 1.0x                   │
│   ◀─●─────────────────────────────▶     │
└─────────────────────────────────────────┘
```

### With Image Selected (Rotating)
```
┌─────────────────────────────────────────┐
│              [ 选择图片 ]                │
│                                         │
│   ┌─────────────────────────────────┐   │
│   │          🔄 🖼️ 🔄            │   │
│   │      Selected Image             │   │
│   │    (Smoothly rotating)          │   │
│   └─────────────────────────────────┘   │
│                                         │
│             转速: 3.2x                   │
│   ◀─────────●─────────────────────▶     │
└─────────────────────────────────────────┘
```

## Animation Details

- **Rotation Type**: 360-degree continuous rotation around center point
- **Animation Framework**: Core Animation (CABasicAnimation)
- **Duration Calculation**: `2.0 / currentRotationSpeed` seconds per rotation
- **Smoothness**: Infinite repeat count for seamless rotation
- **Performance**: Hardware-accelerated animation on device

## Responsive Design

The interface adapts to different screen sizes using Auto Layout:
- Margins: 40pt from screen edges
- Button height: 44pt (Apple HIG recommended)
- Image view: Square aspect ratio, responsive width
- Slider: Full width with margins, 44pt height