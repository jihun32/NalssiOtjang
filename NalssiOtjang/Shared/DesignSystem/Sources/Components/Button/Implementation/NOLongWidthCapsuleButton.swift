//
//  NOCapsuleButton.swift
//  SharedDesignSystem
//
//  Created by 정지훈 on 9/19/25.
//

import SwiftUI

// MARK: - View

public struct NOLongWidthCapsuleButton: NOButton {
    let text: String
    let textColor: Color = Constant.textColor
    let backgroundColor: Color = Constant.backgroundColor
    let width: CGFloat = Constant.width
    let height: CGFloat = Constant.height
    
    let action: () -> Void
    
    public init(text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .foregroundStyle(textColor)
                .font(.headline)
        }
        .frame(maxWidth: width, maxHeight: height)
        .background(backgroundColor)
        .clipShape(.capsule)
    }
}

// MARK: - Constant

extension NOLongWidthCapsuleButton {
    private enum Constant {
        static let textColor: Color = .customColor(.neutral(.white))
        static let backgroundColor: Color = .customColor(.neutral(.black))
        static let width: CGFloat = 200
        static let height: CGFloat = 50
    }
}

#Preview {
    NOLongWidthCapsuleButton(
        text: "사진찍기",
        action: { }
    )
}
