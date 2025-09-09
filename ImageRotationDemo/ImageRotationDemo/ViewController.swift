//
//  ViewController.swift
//  ImageRotationDemo
//
//  Created on iOS Image Rotation Demo
//  Demo for selecting images and controlling rotation speed
//

import UIKit
import PhotosUI

class ViewController: UIViewController {
    
    // MARK: - UI Elements
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var selectImageButton: UIButton!
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    
    // MARK: - Properties
    private var rotationAnimation: CABasicAnimation?
    private var currentRotationSpeed: Float = 1.0
    private var isRotating = false
    
    // Add pause/resume functionality
    private var isPaused = false
    private var pauseButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = UIColor.systemBackground
        
        // Setup image view
        setupImageView()
        
        // Setup select button
        setupSelectButton()
        
        // Setup speed controls
        setupSpeedControls()
        
        // Setup pause button
        setupPauseButton()
        
        // Setup constraints
        setupConstraints()
    }
    
    private func setupImageView() {
        imageView = UIImageView()
        imageView.backgroundColor = UIColor.systemGray6
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add placeholder image
        imageView.image = UIImage(systemName: "photo.circle")
        imageView.tintColor = UIColor.systemGray3
        
        view.addSubview(imageView)
    }
    
    private func setupSelectButton() {
        selectImageButton = UIButton(type: .system)
        selectImageButton.setTitle("选择图片", for: .normal)
        selectImageButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        selectImageButton.backgroundColor = UIColor.systemBlue
        selectImageButton.setTitleColor(.white, for: .normal)
        selectImageButton.layer.cornerRadius = 12
        selectImageButton.translatesAutoresizingMaskIntoConstraints = false
        selectImageButton.addTarget(self, action: #selector(selectImageTapped), for: .touchUpInside)
        
        view.addSubview(selectImageButton)
    }
    
    private func setupSpeedControls() {
        // Speed slider
        speedSlider = UISlider()
        speedSlider.minimumValue = 0.1
        speedSlider.maximumValue = 5.0
        speedSlider.value = 1.0
        speedSlider.translatesAutoresizingMaskIntoConstraints = false
        speedSlider.addTarget(self, action: #selector(speedChanged(_:)), for: .valueChanged)
        
        // Speed label
        speedLabel = UILabel()
        speedLabel.text = "转速: 1.0x"
        speedLabel.font = UIFont.systemFont(ofSize: 16)
        speedLabel.textAlignment = .center
        speedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(speedSlider)
        view.addSubview(speedLabel)
    }
    
    private func setupPauseButton() {
        pauseButton = UIButton(type: .system)
        pauseButton.setTitle("暂停", for: .normal)
        pauseButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        pauseButton.backgroundColor = UIColor.systemOrange
        pauseButton.setTitleColor(.white, for: .normal)
        pauseButton.layer.cornerRadius = 8
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        pauseButton.addTarget(self, action: #selector(pauseResumeButtonTapped), for: .touchUpInside)
        pauseButton.isHidden = true // Initially hidden until image is selected
        
        view.addSubview(pauseButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Select button constraints
            selectImageButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            selectImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectImageButton.widthAnchor.constraint(equalToConstant: 120),
            selectImageButton.heightAnchor.constraint(equalToConstant: 44),
            
            // Image view constraints
            imageView.topAnchor.constraint(equalTo: selectImageButton.bottomAnchor, constant: 30),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            // Speed label constraints
            speedLabel.bottomAnchor.constraint(equalTo: speedSlider.topAnchor, constant: -10),
            speedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            // Pause button constraints  
            pauseButton.centerYAnchor.constraint(equalTo: speedLabel.centerYAnchor),
            pauseButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            pauseButton.widthAnchor.constraint(equalToConstant: 60),
            pauseButton.heightAnchor.constraint(equalToConstant: 32),
            
            // Speed slider constraints
            speedSlider.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            speedSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            speedSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            speedSlider.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    // MARK: - Actions
    @objc private func selectImageTapped() {
        presentImagePicker()
    }
    
    @objc private func speedChanged(_ sender: UISlider) {
        currentRotationSpeed = sender.value
        speedLabel.text = String(format: "转速: %.1fx", currentRotationSpeed)
        
        // Update rotation animation if currently rotating and not paused
        if isRotating && !isPaused {
            startRotationAnimation()
        }
    }
    
    @objc private func pauseResumeButtonTapped() {
        if isPaused {
            resumeRotation()
        } else {
            pauseRotation()
        }
    }
    
    // MARK: - Image Picker
    private func presentImagePicker() {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 1
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true)
    }
    
    // MARK: - Animation
    private func startRotationAnimation() {
        // Remove existing animation
        imageView.layer.removeAnimation(forKey: "rotation")
        
        // Create rotation animation
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.fromValue = 0
        rotation.toValue = CGFloat.pi * 2
        rotation.duration = CFTimeInterval(2.0 / currentRotationSpeed) // Adjust duration based on speed
        rotation.repeatCount = .infinity
        rotation.isRemovedOnCompletion = false
        
        // Add animation to image view
        imageView.layer.add(rotation, forKey: "rotation")
        isRotating = true
        isPaused = false
        pauseButton.setTitle("暂停", for: .normal)
        pauseButton.backgroundColor = UIColor.systemOrange
    }
    
    private func stopRotationAnimation() {
        imageView.layer.removeAnimation(forKey: "rotation")
        isRotating = false
        isPaused = false
        pauseButton.isHidden = true
    }
    
    private func pauseRotation() {
        if isRotating {
            imageView.layer.speed = 0
            imageView.layer.timeOffset = imageView.layer.convertTime(CACurrentMediaTime(), from: nil)
            isPaused = true
            pauseButton.setTitle("继续", for: .normal)
            pauseButton.backgroundColor = UIColor.systemGreen
        }
    }
    
    private func resumeRotation() {
        if isPaused {
            let pausedTime = imageView.layer.timeOffset
            imageView.layer.speed = 1.0
            imageView.layer.timeOffset = 0.0
            imageView.layer.beginTime = 0.0
            let timeSincePause = imageView.layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
            imageView.layer.beginTime = timeSincePause
            isPaused = false
            pauseButton.setTitle("暂停", for: .normal)
            pauseButton.backgroundColor = UIColor.systemOrange
        }
    }
}

// MARK: - PHPickerViewControllerDelegate
extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        guard let result = results.first else { return }
        
        // Load the selected image
        result.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] object, error in
            if let image = object as? UIImage {
                DispatchQueue.main.async {
                    self?.imageView.image = image
                    self?.pauseButton.isHidden = false // Show pause button when image is loaded
                    // Start rotation animation when image is loaded
                    self?.startRotationAnimation()
                }
            }
        }
    }
}