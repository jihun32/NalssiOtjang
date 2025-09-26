//
//  NOCapsuleButton.swift
//  SharedDesignSystem
//
//  Created by 정지훈 on 9/19/25.
//

import SwiftUI

// MARK: - View

public struct NORoundedRectangleButton: NOButton {

    let text: String
    let foregroundColor: Color = Constant.textColor
    let backgroundColor: Color? = Constant.backgroundColor
    let buttonSize: CGSize? = CGSize(width: Constant.width, height: Constant.height)
    
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
                .foregroundStyle(foregroundColor)
                .font(.headline)
        }
        .frame(maxWidth: buttonSize?.width, maxHeight: buttonSize?.height)
        .background(backgroundColor)
        .clipShape(.capsule)
    }
}

// MARK: - Constant

extension NORoundedRectangleButton {
    private enum Constant {
        static let textColor: Color = .customColor(.neutral(.white))
        static let backgroundColor: Color = .customColor(.primary(.main))
        static let width: CGFloat = .infinity
        static let height: CGFloat = 40
    }
}

#Preview {
    NORoundedRectangleButton(
        text: "사진찍기",
        action: { }
    )
}
