//
//  ContentView.swift
//  MLImageClassificationExample
//
//  Created by 정지훈 on 10/15/25.
//

import SwiftUI
import CoreMLImageClassifier

struct ContentView: View {
    let classifier: MLImageClassifierManagerImpl = MLImageClassifierManagerImpl()
    let imageData = UIImage(resource: .test).pngData()!
    @State var texts: [String] = []
    
    var body: some View {
        VStack {
            Image(.test)
            
            Button("이미지 분석") {
                texts = []
                try? classifier.classify(imageData: imageData)
                    .compactMap { $0 }
                    .forEach { texts.append($0) }
            }
            
            ForEach(texts, id: \.self) { text in
                Text(text)
            }
        }
    }
}

#Preview {
    ContentView()
}
