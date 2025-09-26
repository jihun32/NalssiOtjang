// The Swift Programming Language
// https://docs.swift.org/swift-book

import CoreCaptureSessionInterface
import AVFoundation

final public class CaptureSessionManager: NSObject, CaptureSessionable {
    
    typealias CaptureContinuation = CheckedContinuation<Data, Error>
    
    // MARK: - Private Properties
    
    private let photoOutput = AVCapturePhotoOutput()
    private var continuation: CaptureContinuation?
    
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
    
    public func capturePhoto() async throws -> Data {
        return try await withCheckedThrowingContinuation { continuation in
            self.continuation = continuation
            let settings = AVCapturePhotoSettings()
            photoOutput.capturePhoto(with: settings, delegate: self)
        }
    }
}

// MARK: - AVCapturePhotoCaptureDelegate

extension CaptureSessionManager: AVCapturePhotoCaptureDelegate {
    public func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: (any Error)?) {
        
        defer {
            self.continuation = nil
        }
        
        if let error = error {
            continuation?.resume(throwing: error)
            return
        }
        
        if let imageData = photo.fileDataRepresentation() {
            continuation?.resume(returning: imageData)
        }
    }
}

