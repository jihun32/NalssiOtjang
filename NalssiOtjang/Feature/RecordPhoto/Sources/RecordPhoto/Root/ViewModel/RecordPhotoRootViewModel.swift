//
//  File.swift
//  RecordPhoto
//
//  Created by 정지훈 on 9/18/25.
//

import Foundation
import CoreRouterInterface
import CoreCaptureSessionInterface

public struct RecordPhotoRootViewModel {
    var router: Router
    let captureSessionManager: CaptureSessionable
    
    public init(router: Router, captureSessionManager: CaptureSessionable) {
        self.router = router
        self.captureSessionManager = captureSessionManager
    }
}
