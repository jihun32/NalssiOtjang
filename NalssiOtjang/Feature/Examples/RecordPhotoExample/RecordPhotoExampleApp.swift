//
//  RecordPhotoExampleApp.swift
//  RecordPhotoExample
//
//  Created by 정지훈 on 9/17/25.
//

import SwiftUI
import FeatureRecordPhoto
import CoreRouter
import CoreCaptureSession
import Foundation

@main
struct RecordPhotoExampleApp: App {
    let router = BaseRouter()
    let captureSessionManager = CaptureSessionManager()
    var body: some Scene {
        WindowGroup {
            RecordPhotoRootView(
                viewModel: RecordPhotoRootViewModel(
                    router: router,
                    captureSessionManager: captureSessionManager
                )
            )
        }
    }
}

#Preview {
    RecordPhotoRootView(
        viewModel: RecordPhotoRootViewModel(
            router: BaseRouter(),
            captureSessionManager: CaptureSessionManager()
        )
    )
}
