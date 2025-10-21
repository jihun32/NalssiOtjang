//
//  ClassifyPhotoViewModel.swift
//  FeatureRecordPhoto
//
//  Created by 정지훈 on 10/21/25.
//

import Foundation
import DomainClothesInterface

@Observable @MainActor
public final class ClassifyPhotoViewModel {
    
    // MARK: - Input
    
    enum Input {
    }
    
    // MARK: - Output
    
    struct Output {
        var capturedImageData: Data
    }
    
    var output: Output
    
    // MARK: - Dependencies
    
    private let classifierService: ClassifyClothesService
    
    // MARK: - Init
    
    init(capturedImageData: Data, classifierService: ClassifyClothesService) {
        self.output = Output(capturedImageData: capturedImageData)
        self.classifierService = classifierService
    }
    
    
    // MARK: Action
    
    func action(_ input: Input) {
        switch input {
        }
    }
}
