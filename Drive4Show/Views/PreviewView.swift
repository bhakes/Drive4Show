//
//  PreviewView.swift
//  Drive4Show
//
//  Created by Benjamin Hakes on 6/14/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

import UIKit
import AVKit

class PreviewView: UIView {
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    
    /// Convenience wrapper to get layer as its statically known type.
    var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }
}
