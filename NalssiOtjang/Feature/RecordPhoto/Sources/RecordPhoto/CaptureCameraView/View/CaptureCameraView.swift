//
//  File.swift
//  FeatureRecordPhoto
//
//  Created by 정지훈 on 9/23/25.
//

import SwiftUI
import CoreCaptureSessionInterface
import SharedDesignSystem

public struct CaptureCameraView: View {
    
    private let viewModel: CaptureCameraViewModel
    
    public init(viewModel: CaptureCameraViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        
        VStack(spacing: Constant.RootVStack.spacing) {
            
            Text(Constant.ExplainText.text)
                .foregroundStyle(Color.customColor(.neutral(.white)))
                .padding(.top, Constant.ExplainText.topPadding)
            
            CameraPreview(session: viewModel.captureSessionManager.captureSession)
            
            Button {
                
            } label: {
                Circle()
                    .stroke(Color.customColor(.neutral(.darkGray)), lineWidth: Constant.CaptureButton.lineWidth)
                    .fill(Color.customColor(.neutral(.white)))
                    .frame(width: Constant.CaptureButton.size, height: Constant.CaptureButton.size)
            }
        }
        .setBackgroundBlackIgnoreSafeArea()
        .navigationBarBackButtonHidden()
    }
}

// MARK: - Constant

extension CaptureCameraView {
    private enum Constant {
        
        fileprivate enum RootVStack {
            static let spacing: CGFloat = 20
        }
        
        fileprivate enum ExplainText {
            static let text: String = "상하의가 잘 보이게 사진을 찍어주세요"
            static let topPadding: CGFloat = 10
        }
        
        fileprivate enum CaptureButton {
            static let lineWidth: CGFloat = 10
            static let size: CGFloat = 60
        }
    }
}
