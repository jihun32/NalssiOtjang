//
//  CameraLiveView.swift
//  FeatureRecordPhoto
//
//  Created by 정지훈 on 9/29/25.
//

import SwiftUI
import SharedDesignSystem
import CoreCaptureSessionInterface

struct LiveCameraView: View {
    let isAuthorized: Bool
    let isShowTutorialAlert: Bool
    let sessionManager: CaptureSessionable
    let onCapture: () -> Void
    let onTutorialOK: () -> Void

    var body: some View {
        ZStack {
            VStack(spacing: Constant.RootVStack.spacing) {
                if !isShowTutorialAlert {
                    Text(Constant.ExplainText.text)
                        .foregroundStyle(Color.customColor(.neutral(.white)))
                        .padding(.top, Constant.ExplainText.topPadding)
                }

                if isAuthorized {
                    CameraPreview(session: session)
                }

                Spacer()

                Button(action: onCapture) {
                    Circle()
                        .stroke(Color.customColor(.neutral(.darkGray)),
                                lineWidth: Constant.CaptureButton.lineWidth)
                        .fill(Color.customColor(.neutral(.white)))
                        .frame(width: Constant.CaptureButton.size,
                               height: Constant.CaptureButton.size)
                }
            }

            if isAuthorized && isShowTutorialAlert {
                NOAlertView(
                    title: Constant.AlertView.title,
                    image: NOImage.normal(.recordPhoto(.recordPhotoExpain)).image,
                    buttonText: Constant.AlertView.buttonTitle
                ) {
                    withAnimation(.easeInOut(duration: Constant.AlertView.animationDuration)) {
                        onTutorialOK()
                    }
                }
                .zIndex(1)
            }
        }
    }
}

extension CameraLiveView {
    fileprivate enum Constant {
        enum RootVStack {
            static let spacing: CGFloat = 10
        }
        
        enum ExplainText {
            static let text: String = "옷이 잘 보이도록 사진을 찍어주세요"
            static let topPadding: CGFloat = 20
        }
        
        enum CameraPreview {
            static let topPadding: CGFloat = 10
        }
        
        enum CaptureButton {
            static let lineWidth: CGFloat = 10
            static let size: CGFloat = 60
        }
        
        enum AlertView {
            static let title: String = "옷이 잘 보이도록 사진을 찍어주세요!"
            static let buttonTitle: String = "확인"
            static let animationDuration: TimeInterval = 0.2
        }
        
        enum ToolBarButton {
            static let xButtonimageName: String = "xmark"
            static let xButtonImageSize: CGSize = .init(width: 18, height: 18)
            static let switchButtonimageName: String = "arrow.trianglehead.2.clockwise.rotate.90"
            static let switchButtonImageSize: CGSize = .init(width: 26, height: 22)
        }
    }
}
