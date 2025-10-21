//
//  File.swift
//  MLImageClassifier
//
//  Created by 정지훈 on 10/14/25.
//

import Foundation
import CoreML
import Vision
import CoreImage
import CoreMLImageClassifierInterface

public struct MLImageClassifierManagerImpl: MLImageClassifierManager {
    
    public init() { }
    
    public func classify(imageData: Data) throws -> [String] {
        do {
            var categories: [String] = []
            
            let coreMLModel = try ClothesClassifierModel(configuration: MLModelConfiguration())
            let visionModel = try VNCoreMLModel(for: coreMLModel.model)
            let request = VNCoreMLRequest(model: visionModel)
            let handler = VNImageRequestHandler(ciImage: CIImage(data: imageData)!)
            try handler.perform([request])
            
            if let observations = request.results as? [VNClassificationObservation] {
                categories = observations
                    .sorted(by: { $0.confidence > $1.confidence })
                    .map { $0.identifier }
            }
            
            return categories
        } catch {
            throw error
        }
    }
}
