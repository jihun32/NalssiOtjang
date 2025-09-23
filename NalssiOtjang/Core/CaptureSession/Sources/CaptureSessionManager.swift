// The Swift Programming Language
// https://docs.swift.org/swift-book

import CoreCaptureSessionInterface
@preconcurrency import AVFoundation

final public class CaptureSessionManager: NSObject, CaptureSessionable {
    
    // MARK: - Private Properties
    
    private let photoOutput = AVCapturePhotoOutput()
    
    // MARK: - Init
    
    public override init() {
        
    }
    
    // MARK: - Protocol Properties
    
    public let captureSession: AVCaptureSession = AVCaptureSession()
    
    // MARK: - Public Method
    
    public func getIsAuthorized() async -> Bool {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        var isAuthorized = status == .authorized
        guard isAuthorized == false else { return true }
        
        if status == .notDetermined {
            isAuthorized = await AVCaptureDevice.requestAccess(for: .video)
        }
        
        return isAuthorized
    }
    
    public func setUpCaptureSession() async {
        captureSession.beginConfiguration()
        let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera,
                                                  for: .video, position: .unspecified)
        guard let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice!),
              captureSession.canAddInput(videoDeviceInput)
        else { return }
        
        captureSession.addInput(videoDeviceInput)
        
        guard captureSession.canAddOutput(photoOutput) else { return }
        captureSession.sessionPreset = .photo
        captureSession.addOutput(photoOutput)
        captureSession.commitConfiguration()
        
        captureSession.startRunning()
    }
    
    public func stopRunning() {
        captureSession.stopRunning()
    }
    
    public func capturePhoto() {
        let settings = AVCapturePhotoSettings()
        photoOutput.capturePhoto(with: settings, delegate: self)
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
