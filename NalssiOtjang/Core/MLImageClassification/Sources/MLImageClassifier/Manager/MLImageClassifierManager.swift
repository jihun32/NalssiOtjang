//
//  File.swift
//  MLImageClassifier
//
//  Created by 정지훈 on 10/14/25.
//

import Foundation
import CoreML
import Vision
import DomainClothesInterface
import CoreImage

public struct MLImageClassifierManager: ClothesClassifier {
    
    public init() { }
    
    public func classify(imageData: Data) throws -> Clothes {
        guard let coreMLModel = try? ClothesClassifierModel(configuration: MLModelConfiguration()),
              let visionModel = try? VNCoreMLModel(for: coreMLModel.model) else {
            fatalError("Loading CoreML Model Failed")
        }
        
        let request = VNCoreMLRequest(model: visionModel)
        let handler = VNImageRequestHandler(ciImage: CIImage(data: imageData)!)
        try handler.perform([request])
        var categories: [String] = []
        if let observations = request.results as? [VNClassificationObservation] {
            categories = observations
                .sorted(by: { $0.confidence > $1.confidence})
                .map { $0.identifier }
        }
        
        return Clothes(categories: categories)
    }
}
