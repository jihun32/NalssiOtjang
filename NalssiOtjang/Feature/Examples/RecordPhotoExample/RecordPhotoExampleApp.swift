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
import CoreMLImageClassifier

@main
struct RecordPhotoExampleApp: App {
    let router = BaseRouter()
    let captureSessionManager = CaptureSessionManager()
    let classifierManager = MLImageClassifierManagerImpl()
    @State var isToggle: Bool = false
    
    var body: some Scene {
        WindowGroup {
            VStack {
                Button("사진 찍기") {
                    router.fullScreenCover(RecordPhotoRoute.recordPhoto)
                }
            }
            .fullScreenCover(
                isPresented: Binding(
                    get: { router.presentedRoute != nil },
                    set: { isPresented in
                        if !isPresented { router.dismiss() }
                    }
                )
            ) {
                switch router.presentedRoute as? RecordPhotoRoute {
                case .recordPhoto:
                    RecordPhotoRootView(
                        diContianer: RecordPhotoDIContainer(
                            dependenices: .init(
                                captureSessionManager: captureSessionManager,
                                classifierManager: classifierManager,
                                router: router
                            )
                        )
                    )
                default:
                    EmptyView()
                }
            }
        }
        
    }
}

#Preview {
    RecordPhotoRootView(
        diContianer: RecordPhotoDIContainer(
            dependenices: .init(
                captureSessionManager: CaptureSessionManager(),
                classifierManager: MLImageClassifierManagerImpl(),
                router: BaseRouter()
            )
        )
    )
}
