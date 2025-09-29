//
//  NOAlertView.swift
//  SharedDesignSystem
//
//  Created by 정지훈 on 9/26/25.
//

import SwiftUI

public struct NOAlertView: View {
    
    private let title: String
    private let image: Image
    private let buttonText: String
    
    var action: () -> Void
    
    public init(title: String, image: Image, buttonText: String, action: @escaping () -> Void) {
        self.title = title
        self.image = image
        self.buttonText = buttonText
        self.action = action
    }
    
    public var body: some View {
        VStack(spacing: Constant.RootVStack.spacing) {
            
            Text(title)
                .font(.system(size: Constant.TitleText.titleFontSize, weight: .semibold))
                .multilineTextAlignment(.center)
                .padding(.top, Constant.TitleText.topPadding)
            
            image
                .resizable()
                .scaledToFit()
                .padding(.horizontal, Constant.AlertImage.horizontalPadding)
            
            NORoundedRectangleButton(text: buttonText) {
                action()
            }
            .padding(.bottom, Constant.Button.bottomPadding)
        }
        .padding(.horizontal, Constant.RootVStack.horizontalPadding)
        .background(
            RoundedRectangle(cornerRadius: Constant.RoundedRectangle.cornerRadius)
                .fill(Constant.RoundedRectangle.foregroundColor)
        )
        .padding(.horizontal, Constant.RootVStack.horizontalPadding)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Constant.RootVStack.backgroundColor)
    }
}

// MARK: - Constants

extension NOAlertView {
    fileprivate enum Constant {
        
        enum RootVStack {
            static let spacing: CGFloat = 30
            static let horizontalPadding: CGFloat = 20
            static let backgroundColor: Color = .customColor(.neutral(.black)).opacity(0.6)
        }
        
        enum TitleText {
            static let titleFontSize: CGFloat = 26
            static let topPadding: CGFloat = 30
        }
        
        enum AlertImage {
            static let horizontalPadding: CGFloat = 40
        }
        
        enum Button {
            static let bottomPadding: CGFloat = 30
        }
        
        enum RoundedRectangle {
            static let cornerRadius: CGFloat = 20
            static let foregroundColor: Color = .customColor(.neutral(.white))
        }
    }
}

#Preview {
    NOAlertView(
        title: "옷이 잘 보이도록 사진을 찍어주세요!",
        image: Image(.recordPhotoExplain),
        buttonText: "확인",
        action: { }
    )
}


