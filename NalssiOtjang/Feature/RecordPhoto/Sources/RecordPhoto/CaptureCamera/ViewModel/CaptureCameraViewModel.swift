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
import SharedUtil

@Observable @MainActor
final class CaptureCameraViewModel {
    
    // MARK: - Input
    
    enum Input {
        case captureButtonTapped
        case xButtonTapped
        case switchButtonTapped
        case tutorialOkButtonTapped
        case retakeButtonTapped
        case usePhotoButtonTapped
        case errorAlertButtonTapped
    }
    
    // MARK: - Output
    
    struct Output {
        @UserDefaultsWrapper(key: "isShowTutorialAlert", defaultValue: true)
        var isShowingTutorialAlert: Bool
        var isShowingErrorAlet: Bool = false
        var isAuthorized: Bool = false
        var capturedImage: UIImage?
        var isShowingBottomToolBar: Bool { isShowingTutorialAlert || capturedImage != nil }
    }
    
    var output: Output
    
    // MARK: - Private Properties
    
    private var isFrontCamera: Bool = false
    
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
                    output.isShowingErrorAlet = true
                    Log.error("CaptureCameraError: \(error.localizedDescription)")
                }
            }
            
        case .xButtonTapped:
            router.dismiss()
            
        case .switchButtonTapped:
            Task { [manager = captureSessionManager] in
                isFrontCamera.toggle()
                await manager.switchCamera(isFrontCamera)
            }
        case .tutorialOkButtonTapped:
            output.isShowingTutorialAlert = false
            
        case .retakeButtonTapped:
            output.capturedImage = nil
            
        case .usePhotoButtonTapped:
            router.push(RecordPhotoRoute.classifyPhoto)
            
        case .errorAlertButtonTapped:
            router.dismiss()
        }
    }
}
