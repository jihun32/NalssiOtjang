//
//  NOButton.swift
//  SharedDesignSystem
//
//  Created by 정지훈 on 9/22/25.
//

import SwiftUI

protocol NOButton: View {
    var foregroundColor: Color { get }
    var backgroundColor: Color? { get }
    var buttonSize: CGSize? { get }
    var action: () -> Void { get }
}

protocol NOTextButton: NOButton {
    var text: String { get }
}

protocol NOImageButton: NOButton {
    var image: Image { get }
    var imageSize: CGSize? { get }
}
