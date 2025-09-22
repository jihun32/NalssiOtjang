//
//  File.swift
//  SharedDesignSystem
//
//  Created by 정지훈 on 9/22/25.
//

import SwiftUI

protocol NOButton: View {
    var text: String { get }
    var textColor: Color { get }
    var backgroundColor: Color { get }
    var width: CGFloat { get }
    var height: CGFloat { get }
    var action: () -> Void { get }
}
