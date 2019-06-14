//
//  AccessRights.swift
//  Drive4Show
//
//  Created by Benjamin Hakes on 6/14/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

import Foundation
import AVFoundation

struct AccessRights {
    
    static var shared: AccessRights {
        return AccessRights()
    }
    
    private init(){
        
    }
    
    func confirmRights(){
        confirmCameraAccessRights()
        confirmMicrophoneAccessRights()
    }
    
    private func confirmCameraAccessRights(){
        let videoAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        switch videoAuthorizationStatus {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) {
                $0 ? print("Granted") : print("Denied")
            }
        case .authorized:
            print("Already Authorized")
        case .denied:
            print("Access Denied")
        case .restricted:
            print("Access Restricted")
        default:
            print("New Case")
        }
    }
    
    private func confirmMicrophoneAccessRights(){
        let audioAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .audio)
        switch audioAuthorizationStatus {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .audio) {
                $0 ? print("Granted") : print("Denied")
            }
        case .authorized:
            print("Already Authorized")
        case .denied:
            print("Access Denied")
        case .restricted:
            print("Access Restricted")
        default:
            print("New Case")
        }
    }
}
