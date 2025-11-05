//
//  ClassifyClothesServiceImpl.swift
//  DomainClassifyPhotoInterface
//
//  Created by 정지훈 on 10/14/25.
//

import Foundation
import DomainClothesInterface

public struct ClassifyClothesServiceImpl: ClassifyClothesService {
    private let classifier: ClothesClassifier
    
    public init(classifier: ClothesClassifier) {
        self.classifier = classifier
    }
    
    public func classify(imageData: Data) throws -> Clothes {
        try classifier.classify(imageData: imageData)
    }
}
