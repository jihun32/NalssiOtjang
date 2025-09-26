//
//  File.swift
//  FeatureRecordPhoto
//
//  Created by 정지훈 on 9/23/25.
//

import UIKit.UIImage
import CoreRouterInterface
import CoreCaptureSessionInterface
import CoreLog

@Observable @MainActor
final class CaptureCameraViewModel {
    
    // MARK: - Input
    
    enum Input {
        case captureButtonTapped
        case xButtonTapped
        case switchButtonTapped
    }
    
    // MARK: - Output
    
    struct Output {
        var isAuthorized: Bool?
        var capturedImage: UIImage?
        var isFrontCamera: Bool = false
    }
    
    private(set) var output: Output
    
    // MARK: - Dependencies
    var router: Router
    let captureSessionManager: CaptureSessionable
    
    // MARK: - Init
    init(output: Output?, router: Router, captureSessionManager: CaptureSessionable) {
        self.output = output ?? Output()
        self.router = router
        self.captureSessionManager = captureSessionManager
    }
    
    // MARK: Action
    
    func action(_ input: Input) {
        switch input {
        case .captureButtonTapped:
            Task { [manager = captureSessionManager] in
                do {
                    let data = try await manager.capturePhoto()
                    output.capturedImage = UIImage(data: data)
                } catch {
                    Log.error("CaptureCameraError")
                }
            }
        case .xButtonTapped:
            break
            
        case .switchButtonTapped:
            Task { [isFrontCamera = output.isFrontCamera, manager = captureSessionManager] in
                output.isFrontCamera = !isFrontCamera
                await manager.switchCamera(output.isFrontCamera)
            }
        }
    }
}
