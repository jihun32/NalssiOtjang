//
//  File.swift
//  CoreMLImageClassifier
//
//  Created by 정지훈 on 10/21/25.
//

import Foundation

public protocol MLImageClassifierManager {
    func classify(imageData: Data) throws -> [String]
}
