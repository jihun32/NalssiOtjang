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
            if let capturedImage = viewModel.output.capturedImage {
                CapturedCameraView(
                    capturedImage: capturedImage,
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
        .alert(isPresented: $viewModel.output.isShowingErrorAlet) {
            Alert(
                title: Text(Constant.ErrorAlert.title),
                message: Text(Constant.ErrorAlert.message),
                dismissButton: .default(
                    Text(Constant.ErrorAlert.buttonTitle),
                    action: {
                        viewModel.action(.errorAlertButtonTapped)
                    }
                )
            )
        }
        .setBackgroundBlackIgnoreSafeArea()
    }
}

// MARK: - Constant

extension CaptureCameraView {
    fileprivate enum Constant {
        enum ErrorAlert {
            static let title: String = "오류"
            static let message: String = "사진 촬영 도중 예상치 못한 오류가 발생했습니다. 다시 시도해 주세요."
            static let buttonTitle: String = "확인"
        }
    }
}
