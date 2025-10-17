//
//  ClassificationClothesService.swift
//  DomainClassifyPhotoInterface
//
//  Created by 정지훈 on 10/13/25.
//

import Foundation

public protocol ClothesClassifier {
    func classify(imageData: Data) throws -> Clothes
}
