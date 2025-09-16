//
//  File.swift
//  CaptureSession
//
//  Created by home on 9/16/25.
//

import AVFoundation

public protocol CaptureSessionable {
    var isAuthorized: Bool { get async }
    
    func setUpCaptureSession()
    func startRunning()
    func stopRunning()
    func capturePhoto()
}
