//
//  RecordPhotoRootView.swift
//  RecordPhoto
//
//  Created by 정지훈 on 9/18/25.
//

import SwiftUI

// MARK: - View

public struct RecordPhotoRootView: View {
    @State private var viewModel: RecordPhotoRootViewModel
    @AppStorage("hasSeenRecordPhotoExplain") private var hasSeenRecordPhotoExplain: Bool = false
    @State private var captureCameraViewModel: CaptureCameraViewModel
    
    public init(viewModel: RecordPhotoRootViewModel) {
        self.viewModel = viewModel
        self.captureCameraViewModel = CaptureCameraViewModel(
            output: nil,
            router: viewModel.router,
            captureSessionManager: viewModel.captureSessionManager
        )
    }
    
    public var body: some View {
        NavigationStack(path: $viewModel.router.path) {
            CaptureCameraView(
                viewModel: captureCameraViewModel
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
            ClassifyPhotoView(imageData: captureCameraViewModel.output.capturedImage)
        default: EmptyView()
        }
    }
}
