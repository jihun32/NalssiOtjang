//
//  RecordPhotoExplainViewModel.swift
//  RecordPhoto
//
//  Created by 정지훈 on 9/17/25.
//

import Foundation
import CoreCaptureSessionInterface
import CoreRouterInterface

@Observable @MainActor
public final class RecordPhotoExplainViewModel {
    
    // MARK: - Input
    
    enum Input {
        case capturePhotoButtonTapped
    }
    
    // MARK: - Output
    
    struct Output {
    }
    
    private(set) var output: Output
    
    // MARK: - Dependencies
    var router: Router
    private let captureSessionManager: CaptureSessionable
    
    // MARK: - Init
    public init(router: Router, captureSessionManager: CaptureSessionable) {
        self.output = Output()
        self.router = router
        self.captureSessionManager = captureSessionManager
    }
    
    // MARK: Action
    
    func action(_ input: Input) {
        switch input {
        case .capturePhotoButtonTapped:
            Task {
                router.push(RecordPhotoRoute.cameraPreview)
            }
        }
    }
}
