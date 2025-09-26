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
            
            CameraPreview(session: viewModel.captureSessionManager.captureSession)
            
            Button {
                viewModel.action(.captureButtonTapped)
            } label: {
                Circle()
                    .stroke(Color.customColor(.neutral(.darkGray)), lineWidth: Constant.CaptureButton.lineWidth)
                    .fill(Color.customColor(.neutral(.white)))
                    .frame(width: Constant.CaptureButton.size, height: Constant.CaptureButton.size)
            }
            .padding(.bottom, Constant.CaptureButton.bottomPadding)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(Constant.ExplainText.text)
                    .foregroundStyle(Color.customColor(.neutral(.white)))
            }
            
            ToolbarItem(placement: .bottomBar) {
                NOToolBarButton(
                    image: Image(systemName: Constant.ToolBarButton.xButtonimageName),
                    imageSize: .init(width: 18, height: 18),
                    foregroundColor: .customColor(.neutral(.white))) {
                        viewModel.action(.xButtonTapped)
                    }
            }
            .sharedBackgroundVisibility(.hidden)
            
            ToolbarSpacer(.flexible, placement: .bottomBar)
            
            ToolbarItem(placement: .bottomBar) {
                NOToolBarButton(
                    image: Image(systemName: Constant.ToolBarButton.switchButtonimageName),
                    imageSize: .init(width: 26, height: 22),
                    foregroundColor: .customColor(.neutral(.white))) {
                        viewModel.action(.switchButtonTapped)
                    }
            }
            .sharedBackgroundVisibility(.hidden)
        }
        .navigationBarBackButtonHidden()
        .setBackgroundBlackIgnoreSafeArea()
    }
}

// MARK: - Constant

extension CaptureCameraView {
    fileprivate enum Constant {
        
        enum RootVStack {
            static let spacing: CGFloat = 20
        }
        
        enum ExplainText {
            static let text: String = "옷이 잘 보이도록 사진을 찍어주세요"
            static let topPadding: CGFloat = 10
        }
        
        enum CaptureButton {
            static let lineWidth: CGFloat = 10
            static let size: CGFloat = 60
            static let bottomPadding: CGFloat = 15
        }
        
        enum ToolBarButton {
            static let xButtonimageName: String = "xmark"
            static let switchButtonimageName: String = "arrow.trianglehead.2.clockwise.rotate.90"
        }
    }
}
