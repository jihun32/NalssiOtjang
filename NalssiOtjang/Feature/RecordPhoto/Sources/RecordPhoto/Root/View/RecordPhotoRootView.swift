//
//  RecordPhotoRootView.swift
//  RecordPhoto
//
//  Created by 정지훈 on 9/18/25.
//

import SwiftUI

// MARK: - View

public struct RecordPhotoRootView: View {
    @State var viewModel: RecordPhotoRootViewModel
    
    public init(viewModel: RecordPhotoRootViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        NavigationStack(path: $viewModel.router.path) {
            if viewModel.output.isAuthorized {
                RecordPhotoExplainView(
                    viewModel: RecordPhotoExplainViewModel(
                        router: viewModel.router,
                        captureSessionManager: viewModel.captureSessionManager
                    )
                )
                .navigationDestination(for: RecordPhotoRoute.self) { route in
                    destinationView(route)
                }
            } else {
                // TODO: - Alert 만들기
                EmptyView()
            }
        }
        .onAppear {
            viewModel.action(.onAppear)
        }
    }
    
    @ViewBuilder
    private func destinationView(_ route: RecordPhotoRoute) -> some View {
        switch route {
        case .explainPhoto:
            RecordPhotoExplainView(
                viewModel: RecordPhotoExplainViewModel(
                    router: viewModel.router,
                    captureSessionManager: viewModel.captureSessionManager
                )
            )
        case .cameraPreview:
            CaptureCameraView(
                viewModel: CaptureCameraViewModel(
                    router: viewModel.router,
                    captureSessionManager: viewModel.captureSessionManager
                )
            )
        default: EmptyView()
        }
    }
}
