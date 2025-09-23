//
//  File.swift
//  RecordPhoto
//
//  Created by 정지훈 on 9/18/25.
//

import Foundation
import CoreRouterInterface
import CoreCaptureSessionInterface

@Observable @MainActor
public final class RecordPhotoRootViewModel {
    
    // MARK: - Input
    
    enum Input {
        case onAppear
    }
    
    // MARK: - Output
    
    struct Output {
        var isAuthorized: Bool = false
    }
    
    private(set) var output: Output
    
    // MARK: - Dependencies
    
    var router: Router
    private let captureSessionManager: CaptureSessionable
    
    // MARK: - Init
    
    public init(router: Router, captureSessionManager: CaptureSessionable) {
        self.router = router
        self.captureSessionManager = captureSessionManager
        self.output = Output()
    }
    
    // MARK: Action
    
    func action(_ input: Input) {
        switch input {
        case .onAppear:
            Task {
                let isAuthorized = await captureSessionManager.getIsAuthorized()
                output.isAuthorized = isAuthorized
            }
        }
    }
}
