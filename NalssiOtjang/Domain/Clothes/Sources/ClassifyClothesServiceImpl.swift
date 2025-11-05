//
//  ClassifyClothesServiceImpl.swift
//  DomainClassifyPhotoInterface
//
//  Created by 정지훈 on 10/14/25.
//

import Foundation
import DomainClothesInterface
import CoreMLImageClassifierInterface

public struct ClassifyClothesServiceImpl: ClassifyClothesService {
    private let classifier: MLImageClassifierManager
    
    public init(classifier: MLImageClassifierManager) {
        self.classifier = classifier
    }
    
    public func classify(imageData: Data) throws -> Clothes {
        do {
            let categories = try classifier.classify(imageData: imageData)
            return Clothes(categories: categories)
        } catch {
            throw error
        }
    }
}
