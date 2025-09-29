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
            VStack(spacing: Constant.RootVStack.spacing) {
                
                if !viewModel.output.isShowTutorialAlert {
                    Text(Constant.ExplainText.text)
                        .foregroundStyle(Color.customColor(.neutral(.white)))
                        .padding(.top, Constant.ExplainText.topPadding)
                }
                
                if viewModel.output.isAuthorized {
                    CameraPreview(session: viewModel.captureSessionManager.captureSession)
                }
                
                Spacer()
                
                Button {
                    viewModel.action(.captureButtonTapped)
                } label: {
                    Circle()
                        .stroke(Color.customColor(.neutral(.darkGray)), lineWidth: Constant.CaptureButton.lineWidth)
                        .fill(Color.customColor(.neutral(.white)))
                        .frame(width: Constant.CaptureButton.size, height: Constant.CaptureButton.size)
                }
            }
            
            if viewModel.output.isAuthorized && viewModel.output.isShowTutorialAlert {
                NOAlertView(
                    title: Constant.AlertView.title,
                    image: NOImage.normal(.recordPhoto(.recordPhotoExpain)).image,
                    buttonText: Constant.AlertView.buttonTitle
                ) {
                    withAnimation(.easeInOut(duration: Constant.AlertView.animationDuration)) {
                        viewModel.action(.tutorialOkButtonTapped)
                    }
                }
                .zIndex(1)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.customColor(.neutral(.black)))
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                NOToolBarButton(
                    image: Image(systemName: Constant.ToolBarButton.xButtonimageName),
                    imageSize: Constant.ToolBarButton.xButtonImageSize,
                    foregroundColor: .customColor(.neutral(.white))) {
                        viewModel.action(.xButtonTapped)
                    }
            }
            .sharedBackgroundVisibility(.hidden)
            
            ToolbarSpacer(.flexible, placement: .bottomBar)
            
            ToolbarItem(placement: .bottomBar) {
                NOToolBarButton(
                    image: Image(systemName: Constant.ToolBarButton.switchButtonimageName),
                    imageSize: Constant.ToolBarButton.switchButtonImageSize,
                    foregroundColor: .customColor(.neutral(.white))) {
                        viewModel.action(.switchButtonTapped)
                    }
            }
            .sharedBackgroundVisibility(.hidden)
        }
        .toolbar(viewModel.output.isShowTutorialAlert ? .hidden : .visible, for: .bottomBar)
    }
}

// MARK: - Constant

extension CaptureCameraView {
    fileprivate enum Constant {
        enum RootVStack {
            static let spacing: CGFloat = 10
        }
        
        enum ExplainText {
            static let text: String = "옷이 잘 보이도록 사진을 찍어주세요"
            static let topPadding: CGFloat = 20
        }
        
        enum CameraPreview {
            static let topPadding: CGFloat = 10
        }
        
        enum CaptureButton {
            static let lineWidth: CGFloat = 10
            static let size: CGFloat = 60
        }
        
        enum AlertView {
            static let title: String = "옷이 잘 보이도록 사진을 찍어주세요!"
            static let buttonTitle: String = "확인"
            static let animationDuration: TimeInterval = 0.2
        }
        
        enum ToolBarButton {
            static let xButtonimageName: String = "xmark"
            static let xButtonImageSize: CGSize = .init(width: 18, height: 18)
            static let switchButtonimageName: String = "arrow.trianglehead.2.clockwise.rotate.90"
            static let switchButtonImageSize: CGSize = .init(width: 26, height: 22)
        }
    }
}

