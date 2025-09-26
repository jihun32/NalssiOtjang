//
//  File.swift
//  CaptureSession
//
//  Created by home on 9/16/25.
//

import AVFoundation

public protocol CaptureSessionable {
    var captureSession: AVCaptureSession { get }
    
    func getIsAuthorized() async -> Bool
    func setUpCaptureSession(position: AVCaptureDevice.Position) async
    func stopRunning()
    func capturePhoto() async throws -> Data
    func switchCamera(_ isFrontCamera: Bool) async
}
