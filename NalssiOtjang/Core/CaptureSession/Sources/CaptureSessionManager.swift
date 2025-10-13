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
    
    public func setUpCaptureSession(position: AVCaptureDevice.Position) async {
        captureSession.beginConfiguration()
        
        // Remove all existing inputs before switching cameras
        for input in captureSession.inputs {
            captureSession.removeInput(input)
        }
        
        // Find a camera device for the requested position
        let discovery = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera, .builtInDualCamera, .builtInTripleCamera, .builtInDualWideCamera], mediaType: .video, position: position)
        
        guard let cameraDevice = discovery.devices.first else {
            captureSession.commitConfiguration()
            return
        }
        
        guard let input = try? AVCaptureDeviceInput(device: cameraDevice) else {
            captureSession.commitConfiguration()
            return
        }
        
        if captureSession.canAddInput(input) {
            captureSession.addInput(input)
        }
        
        if captureSession.canAddOutput(photoOutput) {
            captureSession.addOutput(photoOutput)
        }
        
        captureSession.sessionPreset = .photo
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
    
    public func switchCamera(_ isFrontCamera: Bool) async {
        await setUpCaptureSession(position: isFrontCamera ? .front : .back)
    }
}

// MARK: - AVCapturePhotoCaptureDelegate

extension CaptureSessionManager: AVCapturePhotoCaptureDelegate {
    public func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: (any Error)?) {
        
        defer {
            self.continuation = nil
        }
        
        if let error {
            continuation?.resume(throwing: error)
            return
        }
        
        if let imageData = photo.fileDataRepresentation() {
            continuation?.resume(returning: imageData)
        }
    }
}

