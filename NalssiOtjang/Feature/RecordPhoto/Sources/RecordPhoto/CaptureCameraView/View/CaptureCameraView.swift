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
        VStack(spacing: Constant.RootVStack.spacing) {
            
            Text(Constant.ExplainText.text)
                .foregroundStyle(Color.customColor(.neutral(.white)))
                .padding(.top, Constant.ExplainText.topPadding)
            
            if let isAuthorized = viewModel.output.isAuthorized  {
                if isAuthorized {
                    CameraPreview(session: viewModel.captureSessionManager.captureSession)
                        .padding(.top, Constant.CameraPreview.topPadding)
                } else {
                    // TODO: - Alert 띄우고 권한창으로 보내기
                }
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
        
        enum ToolBarButton {
            static let xButtonimageName: String = "xmark"
            static let xButtonImageSize: CGSize = .init(width: 18, height: 18)
            static let switchButtonimageName: String = "arrow.trianglehead.2.clockwise.rotate.90"
            static let switchButtonImageSize: CGSize = .init(width: 26, height: 22)
        }
    }
}

