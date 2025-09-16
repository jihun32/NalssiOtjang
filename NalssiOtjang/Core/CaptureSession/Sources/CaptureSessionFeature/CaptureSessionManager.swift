// The Swift Programming Language
// https://docs.swift.org/swift-book

import CaptureSessionInterface
import AVFoundation

final public class CaptureSessionManager: NSObject, CaptureSessionable {
    
    // MARK: - Properties
    private let photoOutput = AVCapturePhotoOutput()
    
    // MARK: - Protocol Properties
    
    public let captureSession: AVCaptureSession = AVCaptureSession()
    public var authorizationStatus: CameraAuthorizationStatus {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        let cameraStatus: CameraAuthorizationStatus = CameraAuthorizationStatus(rawValue: status.rawValue) ?? .notDetermined
        
        return cameraStatus
    }
    
    // MARK: - Protocol Method
    
    public func requestAuthorization() async {
        if authorizationStatus == .notDetermined {
            await AVCaptureDevice.requestAccess(for: .video)
        }
    }
    
    public func setUpCaptureSession() async {
        captureSession.beginConfiguration()
        guard let videoDevice = AVCaptureDevice.default(
                .builtInWideAngleCamera,
                for: .video,
                position: .unspecified),
              let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice),
              captureSession.canAddInput(videoDeviceInput)
            else { return }
        
        captureSession.addInput(videoDeviceInput)
        
        guard captureSession.canAddOutput(photoOutput) else { return }
        captureSession.sessionPreset = .photo
        captureSession.addOutput(photoOutput)
        captureSession.commitConfiguration()
    }
    
    public func startRunning() {
        captureSession.startRunning()
    }
    
    public func stopRunning() {
        captureSession.stopRunning()
    }
    
    public func capturePhoto() {
        let settings = AVCapturePhotoSettings()
        photoOutput.capturePhoto(with: settings, delegate: self)
  }
    // MARK: - Factory Method
    
    public func makeCaptureSessionManager() -> CaptureSessionable {
        CaptureSessionManager()
    }
}



extension CaptureSessionManager: AVCapturePhotoCaptureDelegate {
    public func photoOutput(
        _ output: AVCapturePhotoOutput,
        didFinishCaptureFor resolvedSettings: AVCaptureResolvedPhotoSettings,
        error: (
            any Error
        )?
    ) {
        // TODO: image return
    }
}
