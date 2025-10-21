//
//  ClassifyPhotoViewModel.swift
//  FeatureRecordPhoto
//
//  Created by 정지훈 on 10/21/25.
//

import Foundation
import DomainClothesInterface
import CoreRouterInterface

@Observable @MainActor
public final class ClassifyPhotoViewModel {
    
    // MARK: - Input
    
    enum Input {
        case onAppear
    }
    
    // MARK: - Output
    
    struct Output {
        var isLoading: Bool = true
        var capturedImageData: Data
    }
    
    var output: Output
    
    // MARK: - Dependencies
    
    private let router: Router
    private let classifierService: ClassifyClothesService
    
    // MARK: - Init
    
    init(
        router: Router,
        capturedImageData: Data,
        classifierService: ClassifyClothesService
    ) {
        self.router = router
        self.output = Output(capturedImageData: capturedImageData)
        self.classifierService = classifierService
    }
    
    
    // MARK: Action
    
    func action(_ input: Input) {
        switch input {
        case .onAppear:
            Task {
                try await Task.sleep(for: .seconds(3))
                output.isLoading = false
            }
        }
    }
}
