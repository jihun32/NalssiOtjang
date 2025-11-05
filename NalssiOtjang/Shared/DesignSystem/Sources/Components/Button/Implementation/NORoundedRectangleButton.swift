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
    let foregroundColor: Color
    let backgroundColor: Color?
    let buttonSize: CGSize?
    
    let action: () -> Void
    
    public init(
        text: String,
        foregroundColor: Color? = nil,
        backgroundColor: Color? = nil,
        buttonSize: CGSize? = nil,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.foregroundColor = foregroundColor ?? Constant.textColor
        self.backgroundColor = backgroundColor ?? Constant.backgroundColor
        self.buttonSize = buttonSize ?? CGSize(width: Constant.width, height: Constant.height)
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .foregroundStyle(foregroundColor)
                .font(.title2)
                .frame(maxWidth: buttonSize?.width, maxHeight: buttonSize?.height)
        }
        .background(
            RoundedRectangle(cornerRadius: Constant.radius)
                .fill(backgroundColor ?? .clear)
        )
    }
}

// MARK: - Constant

extension NORoundedRectangleButton {
    private enum Constant {
        static let textColor: Color = .customColor(.neutral(.white))
        static let backgroundColor: Color = .customColor(.primary(.main))
        static let width: CGFloat = .infinity
        static let height: CGFloat = 60
        static let radius: CGFloat = 16
    }
}

#Preview {
    NORoundedRectangleButton(
        text: "사진찍기",
        action: { }
    )
}
