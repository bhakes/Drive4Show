//
//  ViewController.swift
//  Drive4Show
//
//  Created by Benjamin Hakes on 6/14/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AccessRights.shared.confirmRights()
        updateViews()
    }
    
    
    // MARK: - Private Methods
    private func updateViews(){
        
        self.view.addSubview(videoPlayerButton)
        
        NSLayoutConstraint.activate([
            videoPlayerButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            videoPlayerButton.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor)
            ])
        
    }
    
    // MARK: - Actions
    @objc func showVideoPlayer(sender: UIButton){
        let videoCaptureViewController = VideoCaptureViewController()
        
        present(videoCaptureViewController, animated: true, completion: nil)
    }
    
    // MARK: - Properties
    var videoController = VideoController()
    let videoPlayerButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("Video Player", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.backgroundColor = .blue
        b.addTarget(self, action: #selector(showVideoPlayer(sender:)), for: .touchUpInside)
        roundedAutolayoutView(b)
        return b
    }()
}

