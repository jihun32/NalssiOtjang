//
//  File.swift
//  FeatureRecordPhoto
//
//  Created by 정지훈 on 9/23/25.
//

import SwiftUI
import SharedDesignSystem

struct CaptureCameraView: View {
    
    @Bindable private var viewModel: CaptureCameraViewModel
    
    init(viewModel: CaptureCameraViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            if let capturedImageData = viewModel.output.capturedImageData {
                CapturedCameraView(
                    capturedImageData: capturedImageData,
                    onRetake: { viewModel.action(.retakeButtonTapped) },
                    onUsePhoto: { viewModel.action(.usePhotoButtonTapped) }
                )
            } else {
                LiveCameraView(
                    isAuthorized: viewModel.output.isAuthorized,
                    isShowingTutorialAlert: viewModel.output.isShowingTutorialAlert,
                    sessionManager: viewModel.captureSessionManager,
                    isShowingBottomToolBar: viewModel.output.isShowingBottomToolBar,
                    onCapture: { viewModel.action(.captureButtonTapped) },
                    onTutorialOK: { viewModel.action(.tutorialOkButtonTapped) },
                    onSwitchCameara: { viewModel.action(.switchButtonTapped) },
                    onDismissCamera: { viewModel.action(.xButtonTapped) }
                )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            viewModel.action(.onAppear)
        }
        .errorAlert(isPresented: $viewModel.output.isShowingErrorAlet, onDismiss: {
            viewModel.action(.errorAlertButtonTapped)
        })
        .setBackgroundBlackIgnoreSafeArea()
    }
}
