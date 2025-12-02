//
//  File.swift
//  SharedDesignSystem
//
//  Created by 정지훈 on 12/2/25.
//

import SwiftUI

public struct ErrorAlertContent {
    public let title: String
    public let message: String
    public let buttonTitle: String
    
    public init(
        title: String = "오류",
        message: String = "예상치 못한 오류가 발생했습니다. 다시 시도해 주세요.",
        buttonTitle: String = "확인"
    ) {
        self.title = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
}

public extension View {
    func errorAlert(
        isPresented: Binding<Bool>,
        content: ErrorAlertContent = ErrorAlertContent(),
        onDismiss: (() -> Void)?
    ) -> some View {
        alert(isPresented: isPresented) {
            Alert(
                title: Text(content.title),
                message: Text(content.message),
                dismissButton: .default(
                    Text(content.buttonTitle),
                    action: { onDismiss?() }
                )
            )
        }
    }
}
