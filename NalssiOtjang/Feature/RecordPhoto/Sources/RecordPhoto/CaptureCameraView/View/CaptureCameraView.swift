//
//  File.swift
//  FeatureRecordPhoto
//
//  Created by 정지훈 on 9/23/25.
//

import SwiftUI
import SharedDesignSystem

struct CaptureCameraView: View {
    
    private let viewModel: CaptureCameraViewModel
    
    init(viewModel: CaptureCameraViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            if let capturedImage = viewModel.output.capturedImage {
                CapturedCameraView(
                    capturedImage: capturedImage,
                    retakeButtonTapped: {
                        viewModel.action(.retakeButtonTapped)
                    },
                    usePhotoButtonTapped: {
                        viewModel.action(.usePhotoButtonTapped)
                    }
                )
            } else {
                LiveCameraView(
                    isAuthorized: viewModel.output.isAuthorized,
                    isShowTutorialAlert: viewModel.output.isShowTutorialAlert,
                    sessionManager: viewModel.captureSessionManager,
                    isShowBottomToolBar: viewModel.output.isShowBottomToolBar,
                    captureButtonTapped: {
                        viewModel.action(.captureButtonTapped)
                    }, tutorialOKButtonTapped: {
                        viewModel.action(.tutorialOkButtonTapped)
                    }, switchButtonTapped: {
                        viewModel.action(.switchButtonTapped)
                    }, xButtonTapped: {
                        viewModel.action(.xButtonTapped)
                    }
                )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .setBackgroundBlackIgnoreSafeArea()
    }
}
