//
//  VideoCaptureViewController.swift
//  Drive4Show
//
//  Created by Benjamin Hakes on 6/14/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

import UIKit
import AVKit

class VideoCaptureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        updateViews()
        startSession()
        cameraPreviewView.videoPreviewLayer.session = videoController.captureSession
    }
    
    
    // MARK: - Private Methods
    private func updateViews(){
        
        self.view.addSubview(cameraPreviewView)
        self.view.addSubview(cameraButton)
        
        // Camera Preview Constraints
        NSLayoutConstraint.activate([
            cameraPreviewView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            cameraPreviewView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            cameraPreviewView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            cameraPreviewView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
            ])
        
        // Button Constraints
        NSLayoutConstraint.activate([
            cameraButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            cameraButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: CGFloat(-40)),
            cameraButton.widthAnchor.constraint(equalToConstant: CGFloat(80)),
            cameraButton.heightAnchor.constraint(equalToConstant: CGFloat(80))
            ])
        
        cameraButtonRecognizer = UITapGestureRecognizer(target: self, action: #selector(videoController.startCapture))
        
    }
    
    private func setupPreviewLayer() {
        let previewLayer = videoController.getPreviewLayer()
        previewLayer.frame = cameraPreviewView.bounds
        cameraPreviewView.layer.addSublayer(previewLayer)
    }
    
    private func startSession() {
        if videoController.setupSession() {
            setupPreviewLayer()
            videoController.startSession()
        }
    }
    
    
    // MARK: - Actions
    @objc private func cameraButtonTapped(sender: UIButton) {
        videoController.startCapture()
    }
    
    
    // MARK: - Properties
    var videoController = VideoController()
    var cameraButtonRecognizer: UITapGestureRecognizer?
    var cameraPreviewView: PreviewView = {
        var v = PreviewView()
        autolayoutStyle(v)
        return v
    }()
    let cameraButton: UIButton = {
        let b = UIButton()
        b.layer.cornerRadius = 40
        b.backgroundColor = .red
        b.addTarget(self, action: #selector(cameraButtonTapped(sender:)), for: .touchUpInside)
        autolayoutStyle(b)
        return b
    }()


}
