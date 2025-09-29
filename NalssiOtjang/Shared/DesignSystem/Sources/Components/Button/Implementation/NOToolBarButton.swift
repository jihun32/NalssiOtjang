//
//  File.swift
//  SharedDesignSystem
//
//  Created by 정지훈 on 9/25/25.
//

import SwiftUI

public struct NOToolBarButton: NOImageButton {
    
    let image: Image
    var imageSize: CGSize?
    var buttonSize: CGSize?
    var foregroundColor: Color
    var backgroundColor: Color?
    var action: () -> Void
    
    public init(image: Image, imageSize: CGSize, foregroundColor: Color, action: @escaping () -> Void) {
        self.image = image
        self.imageSize = imageSize
        self.foregroundColor = foregroundColor
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            image
                .resizable()
                .frame(width: imageSize?.width, height: imageSize?.height)
                .foregroundStyle(foregroundColor)
                .padding(8)
        }
        .clipShape(.circle)
        .buttonStyle(.glass)
    }
}
