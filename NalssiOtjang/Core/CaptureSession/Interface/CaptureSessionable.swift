//
//  File.swift
//  CaptureSession
//
//  Created by home on 9/16/25.
//

import AVFoundation

public protocol CaptureSessionable: Sendable {
    var captureSession: AVCaptureSession { get }
    
    func getIsAuthorized() async -> Bool
    func setUpCaptureSession() async
    func stopRunning()
    func capturePhoto()
}
