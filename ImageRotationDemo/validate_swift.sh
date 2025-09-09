#!/bin/bash

# Simple Swift syntax validation script
# This checks basic Swift syntax for the ImageRotationDemo project

echo "🔍 Validating Swift syntax for ImageRotationDemo..."

# Check if Swift files exist
if [ ! -f "ImageRotationDemo/ViewController.swift" ]; then
    echo "❌ Error: ViewController.swift not found"
    exit 1
fi

if [ ! -f "ImageRotationDemo/AppDelegate.swift" ]; then
    echo "❌ Error: AppDelegate.swift not found"
    exit 1
fi

if [ ! -f "ImageRotationDemo/SceneDelegate.swift" ]; then
    echo "❌ Error: SceneDelegate.swift not found"
    exit 1
fi

echo "✅ All required Swift files found"

# Check if Info.plist exists
if [ ! -f "ImageRotationDemo/Info.plist" ]; then
    echo "❌ Error: Info.plist not found"
    exit 1
fi

echo "✅ Info.plist found"

# Basic syntax checks using grep for common Swift patterns
echo "🔍 Checking Swift syntax patterns..."

# Check for required imports
if ! grep -q "import UIKit" ImageRotationDemo/ViewController.swift; then
    echo "❌ Error: Missing 'import UIKit' in ViewController.swift"
    exit 1
fi

if ! grep -q "import PhotosUI" ImageRotationDemo/ViewController.swift; then
    echo "❌ Error: Missing 'import PhotosUI' in ViewController.swift"
    exit 1
fi

echo "✅ Required imports found"

# Check for required classes and methods
if ! grep -q "class ViewController: UIViewController" ImageRotationDemo/ViewController.swift; then
    echo "❌ Error: ViewController class definition not found"
    exit 1
fi

if ! grep -q "PHPickerViewControllerDelegate" ImageRotationDemo/ViewController.swift; then
    echo "❌ Error: PHPickerViewControllerDelegate conformance not found"
    exit 1
fi

if ! grep -q "CABasicAnimation" ImageRotationDemo/ViewController.swift; then
    echo "❌ Error: Core Animation usage not found"
    exit 1
fi

echo "✅ Core functionality patterns found"

# Check Info.plist permissions
if ! grep -q "NSPhotoLibraryUsageDescription" ImageRotationDemo/Info.plist; then
    echo "❌ Error: Missing photo library permission in Info.plist"
    exit 1
fi

echo "✅ Required permissions found in Info.plist"

echo "🎉 All validations passed! ImageRotationDemo appears to be correctly structured."