//
//  ClassifyPhotoView.swift
//  FeatureRecordPhoto
//
//  Created by 정지훈 on 10/13/25.
//

import SwiftUI
import SharedDesignSystem

struct ClassifyPhotoView: View {
    
    @State var isLoading: Bool = true
    var imageData: Data?
    
    var body: some View {
        VStack(spacing: 0) {
            if isLoading {
                NOLottieView(
                    name: Constant.Loading.lottieName,
                    size: Constant.Loading.lottieSize,
                    loopMode: .loop
                )
                .onAppear {
                    Task {
                        try await Task.sleep(for: .seconds(Constant.Loading.seconds))
                        isLoading.toggle()
                    }
                }
                
                Text(Constant.Loading.text)
                    .font(.title)
                    .padding(.top, Constant.Loading.textTopPadding)
                    .padding(.bottom, Constant.Loading.textBottomPadding)
                
            } else {
                ClothesCardView(
                    imageData: imageData!,
                    dateString: "2025.10.20",
                    category: "#니트 #긴바지",
                    weatherImage: "sun.max.fill",
                    weatherColor: .orange,
                    lowTemperature: 15,
                    highTemperature: 25
                )
                .padding(.top, Constant.ClothesCard.topPadding)
                
                
                Text(Constant.Question.text)
                    .font(.title2)
                    .padding(.top, Constant.Question.textTopPadding)
                
                HStack {
                    NORoundedRectangleButton(
                        text: Constant.Question.yesButtonText,
                        foregroundColor: .white,
                        backgroundColor: .customColor(.gradient(.skyblueStart)),
                        buttonSize: CGSize(width: CGFloat.infinity, height: Constant.Question.buttonHeight)
                    ) {
                        
                    }
                    
                    NORoundedRectangleButton(
                        text: Constant.Question.noButtonText,
                        foregroundColor: .white,
                        backgroundColor: .gray.opacity(0.5),
                        buttonSize: CGSize(width: CGFloat.infinity, height: Constant.Question.buttonHeight)
                    ) {
                        
                    }
                }
                .padding(.top, Constant.Question.topPadding)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, Constant.RootVStack.horizontalPadding)
        .setBackgroundGradient()
    }
}

#Preview {
    ClassifyPhotoView(imageData: UIImage(systemName: "sun.max")?.pngData())
}


extension ClassifyPhotoView {
    fileprivate enum Constant {
        
        enum RootVStack {
            static let horizontalPadding: CGFloat = 20
        }
        
        enum Loading {
            static let lottieName: String = "magnifyingGlass"
            static let lottieSize: CGSize = CGSize(width: 400, height: 400)
            static let seconds: Double = 3
            static let text: String = "AI가 옷을 분석중이에요•••"
            static let textTopPadding: CGFloat = 10
            static let textBottomPadding: CGFloat = 150
        }
        
        enum ClothesCard {
            static let topPadding: CGFloat = 30
        }
        
        enum Question {
            static let text: String = "옷 분석 결과가 실제와 일치하나요?"
            static let textTopPadding: CGFloat = 50
            static let yesButtonText: String = "예"
            static let noButtonText: String = "아니요"
            static let buttonHeight: CGFloat = 50
            static let topPadding: CGFloat = 20
        }
    }
}
