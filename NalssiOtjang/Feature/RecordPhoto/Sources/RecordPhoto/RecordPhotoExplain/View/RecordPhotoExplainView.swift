//
//  File.swift
//  RecordPhoto
//
//  Created by 정지훈 on 9/17/25.
//

import SwiftUI
import SharedDesignSystem

// MARK: - View

public struct RecordPhotoExplainView: View {
    let viewModel: RecordPhotoExplainViewModel
    
    public init(viewModel: RecordPhotoExplainViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            
            Text(Constant.ExplainText.explainText)
                .padding(.top, Constant.ExplainText.topPadding)
                .font(.system(size: Constant.ExplainText.fontSize, weight: .regular))
                .multilineTextAlignment(.center)
            
            NOImage.normal(.recordPhoto(.recordPhotoExpain)).image
                .resizable()
                .frame(height: Constant.ExplainImage.frameHeight)
                .padding(.top, Constant.ExplainImage.topPadding)
                .padding(.horizontal, Constant.ExplainImage.horizontalPadding)
            
            Spacer()
            
            NOLongWidthCapsuleButton(text: "사진찍기") {
                viewModel.action(.capturePhotoButtonTapped)
            }
            
        }
        .setBackgroundGradient()
    }
}

// MARK: - Constant

extension RecordPhotoExplainView {
    private enum Constant {
        fileprivate enum ExplainText {
            static let explainText: String = "오늘 입었던 옷이 잘 보이도록 사진을 찍어주세요"
            static let topPadding: CGFloat = 50
            static let fontSize: CGFloat = 25
        }
        
        fileprivate enum ExplainImage {
            static let frameHeight: CGFloat = 500
            static let topPadding: CGFloat = 40
            static let horizontalPadding: CGFloat = 20
        }
    }
}
