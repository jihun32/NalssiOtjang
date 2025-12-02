//
//  ClassifyPhotoViewModel.swift
//  FeatureRecordPhoto
//
//  Created by 정지훈 on 10/21/25.
//

import Foundation
import DomainClothesInterface
import CoreRouterInterface
import CoreLog

@Observable @MainActor
public final class ClassifyPhotoViewModel {
    
    // MARK: - Input
    
    enum Input {
        case onAppear
        case errorAlertButtonTapped
    }
    
    // MARK: - Output
    
    struct Output {
        var isLoading: Bool = true
        var isShowingErrorAlet: Bool = false
        var capturedImageData: Data
        var categoryString: String = ""
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
                do {
                    let clothes = try classifierService.classify(imageData: output.capturedImageData)
                    output.categoryString = convertClothesToString(clothes: clothes)
                    
                    try await Task.sleep(for: .seconds(3))
                    output.isLoading = false
                } catch {
                    Log.error("Classification Error: \(error.localizedDescription)")
                    output.isShowingErrorAlet = true
                }
            }
            
        case .errorAlertButtonTapped:
            output.isShowingErrorAlet = false
            router.pop()
        }
    }
}

// MARK: - Private Method

extension ClassifyPhotoViewModel {
    private func convertClothesToString(clothes: Clothes) -> String {
        var categories: [String] = []
        
        if let top = clothes.top { categories.append(top.koreanName) }
        if let outer = clothes.outer { categories.append(outer.koreanName) }
        if let bottom = clothes.bottom { categories.append(bottom.koreanName) }
        if let dress = clothes.dress { categories.append(dress.koreanName) }
        
        return "#" + categories.joined(separator: " #")
    }
}
