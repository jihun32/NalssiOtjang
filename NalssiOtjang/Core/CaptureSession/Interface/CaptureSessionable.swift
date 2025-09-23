//
//  File.swift
//  CaptureSession
//
//  Created by home on 9/16/25.
//

import AVFoundation

public enum CameraAuthorizationStatus: Int {
    case notDetermined
    case restricted
    case denied
    case authorized
}

public protocol CaptureSessionable {
    var captureSession: AVCaptureSession { get }
    var authorizationStatus: CameraAuthorizationStatus { get }

    func requestAuthorization() async
    func setUpCaptureSession() async
    func startRunning()
    func stopRunning()
    func capturePhoto()
}
