//
//  ClassifyClothesService.swift
//  DomainClothes
//
//  Created by 정지훈 on 10/16/25.
//

import Foundation

public protocol ClassifyClothesService {
    func classify(imageData: Data) throws -> Clothes
}
