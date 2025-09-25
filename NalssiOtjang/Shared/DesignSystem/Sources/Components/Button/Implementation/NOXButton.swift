//
//  File.swift
//  SharedDesignSystem
//
//  Created by 정지훈 on 9/25/25.
//

import SwiftUI

public struct NOXButton: NOImageButton {

    let image: Image = Image(systemName: Constant.xmarKImageName)
    let imageSize: CGSize = CGSize(width: Constant.imageSize, height: Constant.imageSize)
    var buttonSize: CGSize?
    let foregroundColor: Color = Constant.tintColor
    var backgroundColor: Color?
    var action: () -> Void
    
    public init(action: @escaping () -> Void) {
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            image
                .resizable()
                .frame(width: imageSize.width, height: imageSize.height)
                .tint(foregroundColor)
        }
    }
}

// MARK: - Constant

extension NOXButton {
    private enum Constant {
        static let xmarKImageName: String = "xmark"
        static let imageSize: CGFloat = 16
        static let tintColor: Color = .customColor(.neutral(.white))
    }
}
