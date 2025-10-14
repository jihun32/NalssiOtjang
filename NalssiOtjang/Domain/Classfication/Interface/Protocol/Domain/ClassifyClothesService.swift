//
//  ClassifyClothesService.swift
//  DomainClassifyPhotoInterface
//
//  Created by 정지훈 on 10/14/25.
//

import Foundation

protocol ClassifyClothesService {
    func classify(image: Data) throws -> Clothes
}
