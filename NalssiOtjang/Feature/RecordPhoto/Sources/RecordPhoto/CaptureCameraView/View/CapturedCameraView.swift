//
//  CapturedCamearaView.swift
//  FeatureRecordPhoto
//
//  Created by 정지훈 on 9/29/25.
//

import SwiftUI
import SharedDesignSystem

struct CapturedCameraView: View {
    
    let capturedImage: UIImage
    let retakeButtonTapped: () -> Void
    let usePhotoButtonTapped: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            Image(uiImage: capturedImage)
                .resizable()
                .scaledToFit()
                .padding(.top, Constant.CapturedImage.topPadding)
            
            Spacer()
            
            HStack {
                Button(action: retakeButtonTapped) {
                    Text(Constant.Button.reTakeButtonTitle)
                        .foregroundStyle(Color.customColor(.neutral(.white)))
                }
                
                Spacer()
                
                Button(action: usePhotoButtonTapped) {
                    Text(Constant.Button.usePhotoButtonTitle)
                        .foregroundStyle(Color.customColor(.neutral(.white)))
                }

            }
            .padding(.horizontal, Constant.Button.buttonHorizontalPadding)
            .padding(.bottom, Constant.Button.buttonBottomPadding)
        }
    }
}

// MARK: - Constant

extension CapturedCameraView {
    fileprivate enum Constant {
        enum CapturedImage {
            static let topPadding: CGFloat = 80
        }
        
        enum Button {
            static let reTakeButtonTitle: String = "다시 찍기"
            static let usePhotoButtonTitle: String = "사진 사용"
            static let buttonHorizontalPadding: CGFloat = 30
            static let buttonBottomPadding: CGFloat = 20
        }
    }
}
