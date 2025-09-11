//
//  SetBackgroundGradient.swift
//  SharedDesignSystem
//
//  Created by home on 9/11/25.
//

import SwiftUI

extension View {
    public func setBackgroundGradient() -> some View {
        self.background {
            LinearGradient(
                colors: [
                    .customColor(.gradient(.lightSkyblueStart)),
                    .customColor(.gradient(.lightSkyblueEnd))
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        }
        .ignoresSafeArea()
    }
}
