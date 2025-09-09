<p align="center">
<img src="Resource/awesome-ml-demos-with-ios-logo.png" width="187" height="174"/>
</p>


[![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/motlabs/awesome-ml-demos-with-ios) ![Hits](https://hitcounter.pythonanywhere.com/count/tag.svg?url=https%3A%2F%2Fgithub.com%2Fmotlabs%2Fawesome-ml-demos-with-ios) [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com) [![GIF PRs More Welcome](https://img.shields.io/badge/GIF--PRs-WELCOME!-brightgreen.svg?style=flat-square)](http://makeapullrequest.com) 

> This repo was moved from [@motlabs](https://github.com/motlabs) group. Thanks for [@jwkanggist](https://github.com/jwkanggist) who is a leader of motlabs community.

# Awesome Machine Learning DEMOs with iOS

We tackle the challenge of using machine learning models on iOS via Core ML and ML Kit (TensorFlow Lite).

[한국어 README](https://github.com/motlabs/iOS-Proejcts-with-ML-Models/blob/master/README_kr.md)

## Contents
- [Machine Learning Framework for iOS](#machine-learning-framework-for-ios)
  - [Flow of Model When Using Core ML](#Flow-of-Model-When-Using-Core-ML)
  - [Flow of Model When Using Create ML](#Flow-of-Model-When-Using-Create-ML)
- [Baseline Projects](#Baseline-Projects)
  - [Image Classification](#Image-Classification)
  - [Object Detection & Recognition](#Object-Detection--Recognition)
  - [Image Estimation](#Image-Estimation)
  - [Semantic Segmentation](#Semantic-Segmentation)
- [Application Projects](#Application-Projects)
  - [Annotation Tool](#Annotation-Tool)
- [Create ML Projects](#Create-ML-Projects)
- [Performance](#Performance)
  - [📏Measure module](#measure-module)
  - [Implements](#Implements)
- [See also](#See-also)

## Machine Learning Framework for iOS

- [Core ML](https://developer.apple.com/documentation/coreml)
- [TensorFlow Lite](https://www.tensorflow.org/lite)
- [Pytorch Mobile](https://pytorch.org/mobile/home/)
- [fritz](https://www.fritz.ai/)
- etc. ~~[Tensorflow Mobile](https://www.tensorflow.org/mobile/)~~`DEPRECATED`)


### Flow of Model When Using Core ML

[![Flow of Model When Using Core ML](Resource/flow_of_model_when_using_coreml.png?raw=true)](https://docs.google.com/presentation/d/1wA_PAjllpLLcFPuZcERYbQlPe1Ipb-bzIZinZg3zXkg/edit?usp=sharing)

The overall flow is very similar for most ML frameworks. Each framework has its own compatible model format. We need to take the model created in TensorFlow and **convert it into the appropriate format, for each mobile ML framework**.

Once the compatible model is prepared, you can run the inference using the ML framework. Note that you must perform **pre/postprocessing** manually.

> If you want more explanation, check [this slide(Korean)](https://docs.google.com/presentation/d/1wA_PAjllpLLcFPuZcERYbQlPe1Ipb-bzIZinZg3zXkg/edit?usp=sharing).

### Flow of Model When Using Create ML

![playground-createml-validation-001](Resource/flow_of_model_when_using_createml.png)

## Baseline Projects

#### DONE

- Using built-in model with Core ML

- Using built-in on-device model with ML Kit
- Using custom model for Vision with Core ML and ML Kit
- Object Detection with Core ML

#### TODO

- Object Detection with ML Kit
- Using built-in cloud model on ML Kit
  - Landmark recognition
- Using custom model for NLP with Core ML and ML Kit
- Using custom model for Audio with Core ML and ML Kit
  - Audio recognition
  - Speech recognition
  - TTS



### Image Processing & Animation

| Name | DEMO | Note |
| ---- | ---- | ---- |
| [ImageRotationDemo](ImageRotationDemo/) | <p align="center"><img src="Resource/imagerotation-demo-preview.gif" width="200"/></p> | iOS Swift app with image selection and rotation speed control using PHPickerViewController and Core Animation |

### Image Classification

| Name | DEMO | Note |
| ---- | ---- | ---- |
| [ImageClassification-CoreML](https://github.com/tucan9389/ImageClassification-CoreML) | <p align="center"><img src="Resource/MobileNet-CoreML-DEMO.gif" width="200"/></p> | - |
| [MobileNet-MLKit](https://github.com/tucan9389/MobileNet-MLKit) | <p align="center"><img src="Resource/MobileNet-MLKit-DEMO.gif" width="200"/></p> | - |

### Object Detection & Recognition

| Name | DEMO | Note |
| ---- | ---- | ---- |
| [ObjectDetection-CoreML](https://github.com/tucan9389/ObjectDetection-CoreML) | <p align="center"><img src="Resource/SSDMobileNetV2-DEMO.gif" width="200"/></p> | - |
| [TextDetection-CoreML](https://github.com/tucan9389/TextDetection-CoreML) | <p align="center"><img src="Resource/TextDetection-CoreML_DEMO001.gif" width="200"/></p> | - |
| [TextRecognition-MLKit](https://github.com/tucan9389/TextRecognition-MLKit) | <p align="center"><img src="Resource/TextRecognition-MLKit_DEMO002.gif" width="200"/></p> | - |
| [FaceDetection-MLKit](https://github.com/tucan9389/FaceDetection-MLKit) | <p align="center"><img src="Resource/FaceDetection-MLKit-DEMO.gif" width="200"/></p> | - |

### Pose Estimation

| Name | DEMO | Note |
| ---- | :--- | ---- |
| [PoseEstimation-CoreML](https://github.com/tucan9389/PoseEstimation-CoreML) | <p align="center"><img src="Resource/180801-poseestimation-demo.gif" width="200"/></p> | - |
| [PoseEstimation-TFLiteSwift](https://github.com/tucan9389/PoseEstimation-TFLiteSwift) | <img src="https://user-images.githubusercontent.com/37643248/77227994-99ba2a80-6bc7-11ea-9b08-9bb57723bc42.gif" width=200px><img src="https://user-images.githubusercontent.com/37643248/110994933-e68ca780-83bc-11eb-8331-d827e19d2d36.gif" width=200px> | -    |
| [PoseEstimation-MLKit](https://github.com/tucan9389/PoseEstimation-MLKit) | <p align="center"><img src="Resource/PoseEstimation-MLKit-hourglass.gif" width="200"/></p> | -    |
| [FingertipEstimation-CoreML](https://github.com/tucan9389/FingertipEstimation-CoreML) | <p align="center"><img src="Resource/fingertip_estimation_demo003.gif" width="200"/></p> | - |

### Depth Prediction

|                                                              |                                                              |      |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ---- |
| [DepthPrediction-CoreML](https://github.com/tucan9389/DepthPrediction-CoreML) | <p align="center"><img src="Resource/190727-depthprediction-demo001.gif" width="200"/></p> | -    |

### Semantic Segmentation

| Name | DEMO | Note |
| ---- | ---- | ---- |
| [SemanticSegmentation-CoreML](https://github.com/tucan9389/SemanticSegmentation-CoreML) | <p align="center"><img src="https://user-images.githubusercontent.com/37643248/99242802-167ad280-2843-11eb-959a-5fe3b169d8f0.gif" width="200"/><img src="https://user-images.githubusercontent.com/37643248/110972921-e8943d80-839f-11eb-9559-2a32d3b56de0.gif" width=200px></p> | - |

## Application Projects

| Name | DEMO | Note |
| ---- | ---- | ---- |
| [dont-be-turtle-ios](https://github.com/motlabs/dont-be-turtle-ios) | <p align="center"><img src="Resource/dont-be-turtle_demo_004.gif" width="200"/></p> | - |
| [WordRecognition-CoreML-MLKit](https://github.com/tucan9389/WordRecognition-CoreML-MLKit)(preparing...) | <p align="center"><img src="Resource/recognition_a_word_demo002.gif" width="200"/></p> | Detect character, find a word what I point and then recognize the word using Core ML and ML Kit. |

### Annotation Tool

| Name | DEMO | Note |
| ---- | ---- | ---- |
| [KeypointAnnotation](https://github.com/tucan9389/KeypointAnnotation) | <p align="center"><img src="Resource/annotation_ios_app_demo001.gif" width="200"/></p> | Annotation tool for own custom estimation dataset |

## Create ML Projects

| Name | Create ML DEMO | Core ML DEMO | Note |
| ------ | ------------------------------------------------------------ | ---------------------------------- | ------ |
| [SimpleClassification-CreateML-CoreML](https://github.com/tucan9389/SimpleClassification-CreateML-CoreML) | ![IMG_0436](Resource/playground-createml-validation-001.png) | ![IMG_0436](Resource/IMG_0436.PNG) | A Simple Classification Using Create ML and Core ML |

## Performance

Execution Time: Inference Time + Postprocessing Time

|              (with iPhone X) | Inference Time(ms) | Execution Time(ms) |   FPS   |
| ---------------------------: | :----------------: | :----------------: | :-----: |
|   ImageClassification-CoreML |         40         |         40         |   23    |
|              MobileNet-MLKit |        120         |        130         |    6    |
|       ObjectDetection-CoreML |  100 ~ 120         |    110 ~ 130       |    5    |
|         TextDetection-CoreML |         12         |         13         | 30(max) |
|        TextRecognition-MLKit |       35~200       |       40~200       |  5~20   |
|        PoseEstimation-CoreML |         51         |         65         |   14    |
|         PoseEstimation-MLKit |        200         |        217         |    3    |
|       DepthPrediction-CoreML |        624         |        640         |    1    |
|    SemanticSegmentation-CoreML |        178         |        509         |    1    |
| WordRecognition-CoreML-MLKit |         23         |         30         |   14    |
| FaceDetection-MLKit          |         -          |          -         |   -     |

### 📏Measure module

You can see the measured latency time for inference or execution and FPS on the top of the screen.

> If you have more elegant method for measuring the performance, suggest on issue!

<img src="Resource/measure_ui.jpeg" width="320"/>

### Implements

|                            | Measure📏 | Unit Test | Bunch Test |
| -------------------------: | :-------: | :-------: | :--------: |
| ImageClassification-CoreML |    O      |     X     |     X      |
|            MobileNet-MLKit |    O      |     X     |     X      |
|     ObjectDetection-CoreML |    O      |     O     |     X      |
|       TextDetection-CoreML |    O      |     X     |     X      |
|      TextRecognition-MLKit |    O      |     X     |     X      |
|      PoseEstimation-CoreML |    O      |     O     |     X      |
|       PoseEstimation-MLKit |    O      |     X     |     X      |
|     DepthPrediction-CoreML |    O      |     X     |     X      |
|  SemanticSegmentation-CoreML |    O      |     X     |     X      |

## See also

- [Core ML | Apple Developer Documentation](https://developer.apple.com/documentation/coreml)
- [Machine Learning - Apple Developer](https://developer.apple.com/machine-learning/)
- [ML Kit - Firebase](https://developers.google.com/ml-kit/)
- [Apple's Core ML 2 vs. Google's ML Kit: What's the difference?](https://venturebeat.com/2018/06/05/apples-core-ml-2-vs-googles-ml-kit-whats-the-difference/)
- [iOS에서 머신러닝 슬라이드 자료](https://docs.google.com/presentation/d/1wA_PAjllpLLcFPuZcERYbQlPe1Ipb-bzIZinZg3zXkg/edit?usp=sharing)
- [MoT Labs Blog](https://motlabs.github.io/)

### WWDC

#### Core ML

- WWDC2020
  - [WWDC2020 10152 Session - Use model deployment and security with Core ML](https://developer.apple.com/videos/play/wwdc2020/10152/)
  - [WWDC2020 10153 Session - Get models on device using Core ML Converters](https://developer.apple.com/videos/play/wwdc2020/10153/)
  - Vision
    - [WWDC2020 10673 Session - Explore Computer Vision APIs](https://developer.apple.com/videos/play/wwdc2020/10673/)
    - [WWDC2020 10099 Session - Explore the Action & Vision app](https://developer.apple.com/videos/play/wwdc2020/10099/)
    - [WWDC2020 10653 Session - Detect Body and Hand Pose with Vision](https://developer.apple.com/videos/play/wwdc2020/10653/)
    - [TECH-TALKS 206 Session - QR Code Recognition on iOS 11](https://developer.apple.com/videos/play/tech-talks/206/)
  - NLP
    - [WWDC2020 10657 Session - Make apps smarter with Natural Language](https://developer.apple.com/videos/play/wwdc2020/10657/)

- WWDC2019
  - [WWDC2019 256 Session - Advances in Speech Recognition](https://developer.apple.com/videos/play/wwdc2019/256/)
  - [WWDC2019 704 Session - Core ML 3 Framework](https://developer.apple.com/videos/play/wwdc2019/704/)
  - [WWDC2019 228 Session - Creating Great Apps Using Core ML and ARKit](https://developer.apple.com/videos/play/wwdc2019/228/)
  - [WWDC2019 232 Session - Advances in Natural Language Framework](https://developer.apple.com/videos/play/wwdc2019/232/)
  - [WWDC2019 222 Session - Understanding Images in Vision Framework](https://developer.apple.com/videos/play/wwdc2019/222/)
  - [WWDC2019 234 Session - Text Recognition in Vision Framework](https://developer.apple.com/videos/play/wwdc2019/234/)
- WWDC2018
  - [WWDC2018 708 Session - What’s New in Core ML, Part 1](https://developer.apple.com/videos/play/wwdc2018/708/)
  - [WWDC2018 716 Session - Object Tracking in Vision](https://developer.apple.com/videos/play/wwdc2018/716/)
  - [WWDC2018 717 Session - Vision with Core ML](https://developer.apple.com/videos/play/wwdc2018/717/)
  - [WWDC2018 709 Session - What’s New in Core ML, Part 2](https://developer.apple.com/videos/play/wwdc2018/709/)
  - [WWDC2018 713 Session - Introducing Natural Language Framework](https://developer.apple.com/videos/play/wwdc2018/713/)
- WWDC2017
  - [WWDC2017 710 Session - Core ML in depth](https://developer.apple.com/videos/play/wwdc2017/710/)
  - [WWDC2017 208 Session - Natural Language Processing and your Apps](https://developer.apple.com/videos/play/wwdc2017/208/)
  - [WWDC2017 510 Session - Advances in Core Image: Filters, Metal, Vision, and More](https://developer.apple.com/videos/play/wwdc2017/510/)
  - [WWDC2017 506 Session - Vision Framework: Building on Core ML](https://developer.apple.com/videos/play/wwdc2017/506/)
  - [WWDC2017 703 Session - Introducing Core ML](https://developer.apple.com/videos/play/wwdc2017/703/)

#### Create ML and Turi Create

- WWDC2020
  - [WWDC2020 10642 Session - Build Image and Video Style Transfer models in Create ML](https://developer.apple.com/videos/play/wwdc2020/10642/)
  - [WWDC2020 10156 Session - Control training in Create ML with Swift](https://developer.apple.com/videos/play/wwdc2020/10156/)
  - [WWDC2020 10043 Session - Build an Action Classifier with Create ML](https://developer.apple.com/videos/play/wwdc2020/10043/)
- WWDC2019
  - [WWDC2019 424 Session - Training Object Detection Models in Create ML](https://developer.apple.com/videos/play/wwdc2019/424/)
  - [WWDC2019 426 Session - Building Activity Classification Models in Create ML](https://developer.apple.com/videos/play/wwdc2019/426/)
  - [WWDC2019 420 Session - Drawing Classification and One-Shot Object Detection in Turi Create](https://developer.apple.com/videos/play/wwdc2019/420/)
  - [WWDC2019 425 Session - Training Sound Classification Models in Create ML](https://developer.apple.com/videos/play/wwdc2019/425/)
  - [WWDC2019 428 Session - Training Text Classifiers in Create ML](https://developer.apple.com/videos/play/wwdc2019/428/)
  - [WWDC2019 427 Session - Training Recommendation Models in Create ML](https://developer.apple.com/videos/play/wwdc2019/427/)
  - [WWDC2019 430 Session - Introducing the Create ML App](https://developer.apple.com/videos/play/wwdc2019/430/)
- WWDC2018
  - [WWDC2018 712 Session - A Guide to Turi Create](https://developer.apple.com/videos/play/wwdc2018/712/)
  - [WWDC2018 703 Session - Introducing Create ML](https://developer.apple.com/videos/play/wwdc2018/703/)

#### Common ML

- WWDC2020
  - [WWDC2020 10677 Session - Build customized ML models with the Metal Performance Shaders Graph](https://developer.apple.com/videos/play/wwdc2020/10677/)
- WWDC2019
  - [WWDC2019 803 Session - Designing Great ML Experiences](https://developer.apple.com/videos/play/wwdc2019/803/)
  - [WWDC2019 614 Session - Metal for Machine Learning](https://developer.apple.com/videos/play/wwdc2019/614/)
  - [WWDC2019 209 Session - What's New in Machine Learning](https://developer.apple.com/videos/play/wwdc2019/209/)
- WWDC2018
  - [WWDC2018 609 Session - Metal for Accelerating Machine Learning](https://developer.apple.com/videos/play/wwdc2018/609/)
- WWDC2016
  - [WWDC2016 715 Session - Neural Networks and Accelerate](https://developer.apple.com/videos/play/wwdc2016/715/)
  - [WWDC2016 605 Session - What's New in Metal, Part 2](https://developer.apple.com/videos/play/wwdc2016/605/)  

### Metal

- WWDC2020
  - [WWDC2020 10632 Session - Optimize Metal Performance for Apple Silicon Macs](https://developer.apple.com/videos/play/wwdc2020/10632/)
  - [WWDC2020 10603 Session - Optimize Metal apps and games with GPU counters](https://developer.apple.com/videos/play/wwdc2020/10603/)
  - [TECH-TALKS 606 Session - Metal 2 on A11 - Imageblock Sample Coverage Control](https://developer.apple.com/videos/play/tech-talks/606/)
  - [TECH-TALKS 603 Session - Metal 2 on A11 - Imageblocks](https://developer.apple.com/videos/play/tech-talks/603/)
  - [TECH-TALKS 602 Session - Metal 2 on A11 - Overview](https://developer.apple.com/videos/play/tech-talks/602/)
  - [TECH-TALKS 605 Session - Metal 2 on A11 - Raster Order Groups](https://developer.apple.com/videos/play/tech-talks/605/)
  - [TECH-TALKS 604 Session - Metal 2 on A11 - Tile Shading](https://developer.apple.com/videos/play/tech-talks/604/)
  - [TECH-TALKS 608 Session - Metal Enhancements for A13 Bionic](https://developer.apple.com/videos/play/tech-talks/608/)
  - [WWDC2020 10631 Session - Bring your Metal app to Apple Silicon Macs](https://developer.apple.com/videos/play/wwdc2020/10631/)
  - [WWDC2020 10197 Session - Broaden your reach with Siri Event Suggestions](https://developer.apple.com/videos/play/wwdc2020/10197/)
  - [WWDC2020 10615 Session - Build GPU binaries with Metal](https://developer.apple.com/videos/play/wwdc2020/10615/)
  - [WWDC2020 10021 Session - Build Metal-based Core Image kernels with Xcode](https://developer.apple.com/videos/play/wwdc2020/10021/)
  - [WWDC2020 10616 Session - Debug GPU-side errors in Metal](https://developer.apple.com/videos/play/wwdc2020/10616/)
  - [WWDC2020 10012 Session - Discover ray tracing with Metal](https://developer.apple.com/videos/play/wwdc2020/10012/)
  - [WWDC2020 10013 Session - Get to know Metal function pointers](https://developer.apple.com/videos/play/wwdc2020/10013/)
  - [WWDC2020 10605 Session - Gain insights into your Metal app with Xcode 12](https://developer.apple.com/videos/play/wwdc2020/10605/)
  - [WWDC2020 10602 Session - Harness Apple GPUs with Metal](https://developer.apple.com/videos/play/wwdc2020/10602/)

### AR

- WWDC2020
  - [TECH-TALKS 609 Session - Advanced Scene Understanding in AR](https://developer.apple.com/videos/play/tech-talks/609/)
  - [TECH-TALKS 601 Session - Face Tracking with ARKit](https://developer.apple.com/videos/play/tech-talks/601/)
  - [WWDC2020 10611 Session - Explore ARKit 4](https://developer.apple.com/videos/play/wwdc2020/10611/)
  - [WWDC2020 10604 Session - Shop online with AR Quick Look](https://developer.apple.com/videos/play/wwdc2020/10604/)
  - [WWDC2020 10601 Session - The artist’s AR toolkit](https://developer.apple.com/videos/play/wwdc2020/10601/)
  - [WWDC2020 10613 Session - What's new in USD](https://developer.apple.com/videos/play/wwdc2020/10613/)

### Examples

- Training
  - Keras examples: https://keras.io/examples/
  - Pytorch examples: https://github.com/pytorch/examples
- Inference
  - TFLite examples: https://github.com/tensorflow/examples/tree/master/lite
  - Pytorch Mobile iOS example: https://github.com/pytorch/ios-demo-app
  - FritzLabs examples: https://github.com/fritzlabs/fritz-examples
- Models
  - TensorFlow & TFLite models: https://tfhub.dev/
  - Pytorch models: https://pytorch.org/hub/
  - CoreML official models: https://developer.apple.com/machine-learning/models/
