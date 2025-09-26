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
        case xButtonTapped
        case captureButtonTapped
    }
    
    // MARK: - Output
    
    struct Output {
        var xButtonHidden: Bool = false
        var capturedImage: UIImage?
    }
    
    private(set) var output: Output
    
    // MARK: - Dependencies
    var router: Router
    let captureSessionManager: CaptureSessionable
    
    // MARK: - Init
    init(router: Router, captureSessionManager: CaptureSessionable) {
        self.output = Output()
        self.router = router
        self.captureSessionManager = captureSessionManager
    }
    
    // MARK: Action
    
    func action(_ input: Input) {
        switch input {
        case .xButtonTapped:
            break
        case .captureButtonTapped:
            Task { [manager = captureSessionManager] in
                do {
                    let data = try await manager.capturePhoto()
                    output.capturedImage = UIImage(data: data)
                } catch {
                    Log.error("CaptureCameraError")
                }
            }
        }
    }
}
