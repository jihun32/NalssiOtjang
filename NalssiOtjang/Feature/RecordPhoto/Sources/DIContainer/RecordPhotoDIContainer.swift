//
//  File.swift
//  FeatureRecordPhoto
//
//  Created by 정지훈 on 10/21/25.
//

import Foundation
import CoreCaptureSessionInterface
import CoreMLImageClassifierInterface
import CoreRouterInterface

@MainActor
public final class RecordPhotoDIContainer {
    
    public struct Dependencies {
        let captureSessionManager: CaptureSessionManager
        let classifierManager: MLImageClassifierManager
        let router: Router
        
        public init(
            captureSessionManager: CaptureSessionManager,
            classifierManager: MLImageClassifierManager,
            router: Router
        ) {
            self.captureSessionManager = captureSessionManager
            self.classifierManager = classifierManager
            self.router = router
        }
    }
    
    let dependenices: Dependencies
    
    public init(dependenices: Dependencies) {
        self.dependenices = dependenices
    }
    
    func makeRecordRootViewModel() -> RecordPhotoRootViewModel {
        RecordPhotoRootViewModel(
            router: dependenices.router,
            captureSessionManager: dependenices.captureSessionManager
        )
    }
    
    func makeCaptureCameraViewModel() -> CaptureCameraViewModel {
        CaptureCameraViewModel(
            router: dependenices.router,
            captureSessionManager: dependenices.captureSessionManager
        )
    }
}
