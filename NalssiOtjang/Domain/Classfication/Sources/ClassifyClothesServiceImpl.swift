//
//  ClassifyClothesServiceImpl.swift
//  DomainClassifyPhotoInterface
//
//  Created by 정지훈 on 10/14/25.
//

import Foundation
import DomainClassificationClothesInterface

public struct ClassifyClothesServiceImpl: ClassifyClothesService {
    private let classifier: ClothesClassifier
    
    public init(classifier: ClothesClassifier) {
        self.classifier = classifier
    }
    
    public func classify(image: Data) throws -> Clothes {
        <#code#>
    }
}
