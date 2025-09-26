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
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(Constant.ExplainText.text)
                    .foregroundStyle(Color.customColor(.neutral(.white)))
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                if !viewModel.output.xButtonHidden {
                    NOXButton {
                        viewModel.action(.xButtonTapped)
                    }
                }
            }
        }
        .setBackgroundBlackIgnoreSafeArea()
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(!viewModel.output.xButtonHidden)
    }
}

// MARK: - Constant

extension CaptureCameraView {
    private enum Constant {
        
        fileprivate enum RootVStack {
            static let spacing: CGFloat = 20
        }
        
        fileprivate enum ExplainText {
            static let text: String = "옷이 잘 보이도록 사진을 찍어주세요"
            static let topPadding: CGFloat = 10
        }
        
        fileprivate enum CaptureButton {
            static let lineWidth: CGFloat = 10
            static let size: CGFloat = 60
        }
    }
}
