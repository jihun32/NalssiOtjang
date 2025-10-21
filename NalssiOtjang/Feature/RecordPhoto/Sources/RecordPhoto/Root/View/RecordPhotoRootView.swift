//
//  RecordPhotoRootView.swift
//  RecordPhoto
//
//  Created by 정지훈 on 9/18/25.
//

import SwiftUI

// MARK: - View

public struct RecordPhotoRootView: View {
    let diContianer: RecordPhotoDIContainer
    @State private var viewModel: RecordPhotoRootViewModel
    
    public init(diContianer: RecordPhotoDIContainer) {
        self.diContianer = diContianer
        viewModel = diContianer.makeRecordRootViewModel()
    }
    
    public var body: some View {
        NavigationStack(path: $viewModel.router.path) {
            CaptureCameraView(
                viewModel: diContianer.makeCaptureCameraViewModel()
            )
            .navigationDestination(for: RecordPhotoRoute.self) { route in
                destinationView(route)
            }
        }
    }
    
    @ViewBuilder
    private func destinationView(_ route: RecordPhotoRoute) -> some View {
        switch route {
        case .classifyPhoto:
            ClassifyPhotoView()
        default: EmptyView()
        }
    }
}
