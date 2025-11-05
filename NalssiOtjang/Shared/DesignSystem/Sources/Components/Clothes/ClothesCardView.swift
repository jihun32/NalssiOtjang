//
//  ClothesCardView.swift
//  SharedDesignSystem
//
//  Created by 정지훈 on 10/20/25.
//

import SwiftUI

public struct ClothesCardView: View {
    
    private let imageData: Data
    private let dateString: String
    private let category: String
    private let weatherImage: String
    private let weatherColor: Color
    private let lowTemperature: Int
    private let highTemperature: Int
    
    public init(
        imageData: Data,
        dateString: String,
        category: String,
        weatherImage: String,
        weatherColor: Color,
        lowTemperature: Int,
        highTemperature: Int
    ) {
        self.imageData = imageData
        self.dateString = dateString
        self.category = category
        self.weatherImage = weatherImage
        self.weatherColor = weatherColor
        self.lowTemperature = lowTemperature
        self.highTemperature = highTemperature
    }
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            if let image = UIImage(data: imageData) {
                Image(uiImage: image)
                    .resizable()
                    .clipShape(.rect(cornerRadius: Constant.Layout.radius))
            }
            
            HStack {
                VStack(alignment: .leading, spacing: Constant.CardTextInfo.vStackSpacing) {
                    Text(Constant.CardTextInfo.todayText)
                        .font(.system(size: Constant.CardTextInfo.todayTextFontSize, weight: .heavy))
                    
                    Text(dateString)
                        .font(.system(size: Constant.CardTextInfo.dateTextFontSize, weight: .semibold))
                    
                    Text(category)
                        .font(.system(size: Constant.CardTextInfo.cateogryTextFontSize, weight: .bold))
                }
                .foregroundStyle(.white)
                
                Spacer()
                
                VStack {
                    Image(systemName: weatherImage)
                        .resizable()
                        .foregroundStyle(weatherColor)
                        .frame(width: Constant.CardWeatherInfo.imageSize.width, height: Constant.CardWeatherInfo.imageSize.height)
                    
                    Text("최저 \(lowTemperature)°C")
                        .font(.system(size: Constant.CardWeatherInfo.temperatureFontSize, weight: .bold))
                        .foregroundStyle(.white)
                    
                    Text("최고 \(highTemperature)°C")
                        .font(.system(size: Constant.CardWeatherInfo.temperatureFontSize, weight: .bold))
                        .foregroundStyle(.white)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(Constant.CardWeatherInfo.padding)
            .background(.ultraThinMaterial)
            .clipShape(.rect(cornerRadius: Constant.Layout.radius))
            
        }
        .padding(Constant.Layout.zStackPadding)
        .background(.white)
        .clipShape(.rect(cornerRadius: Constant.Layout.radius))
    }
}

#Preview {
    ClothesCardView(
        imageData: UIImage(resource: .recordPhotoExplain).pngData()!,
        dateString: "2025.10.20",
        category: "#니트 #긴바지",
        weatherImage: "sun.max.fill",
        weatherColor: .orange,
        lowTemperature: 15,
        highTemperature: 25
    )
}

extension ClothesCardView {
    fileprivate enum Constant {
        enum CardTextInfo {
            static let todayText: String = "Today's Outfit"
            static let todayTextFontSize: CGFloat = 20
            static let dateTextFontSize: CGFloat = 12
            static let cateogryTextFontSize: CGFloat = 14
            static let vStackSpacing: CGFloat = 4
        }
        
        enum CardWeatherInfo {
            static let imageSize: CGSize = CGSize(width: 40, height: 40)
            static let temperatureFontSize: CGFloat = 12
            static let padding: CGFloat = 14
        }
        
        enum Layout {
            static let radius: CGFloat = 16
            static let zStackPadding: CGFloat = 8
        }
    }
}
