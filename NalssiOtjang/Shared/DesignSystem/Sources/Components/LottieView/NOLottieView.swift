//
//  NOLottieView.swift
//  SharedDesignSystem
//
//  Created by 정지훈 on 10/13/25.
//

import SwiftUI
import Lottie

public struct NOLottieView: View {
    
    private let name: String
    private let size: CGSize
    private let loopMode: LottieLoopMode
    
    public init(name: String, size: CGSize, loopMode: LottieLoopMode) {
        self.name = name
        self.size = size
        self.loopMode = loopMode
    }
    
    public var body: some View {
        LottieView(animation: .named(name, bundle: .module))
            .playing(loopMode: loopMode)
            .resizable()
            .frame(width: size.width, height: size.height)
    }
}

#Preview {
    NOLottieView(
        name: "magnifyingGlass",
        size: CGSize(width: 200, height: 200),
        loopMode: .loop
    )
}
