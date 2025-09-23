//
//  File.swift
//  FeatureRecordPhoto
//
//  Created by 정지훈 on 9/23/25.
//

import Foundation
import CoreRouterInterface
import CoreCaptureSessionInterface

public final class CaptureCameraViewModel {
    
    // MARK: - Input
    
    enum Input {
    }
    
    // MARK: - Output
    
    struct Output {
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
        }
    }
}
