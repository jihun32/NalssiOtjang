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
    
    public init(viewModel: RecordPhotoRootViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        NavigationStack(path: $viewModel.router.path) {
            CaptureCameraView(
                viewModel: CaptureCameraViewModel(
                    output: CaptureCameraViewModel.Output(isAuthorized: viewModel.output.isAuthorized),
                    router: viewModel.router,
                    captureSessionManager: viewModel.captureSessionManager
                )
            )
            .navigationDestination(for: RecordPhotoRoute.self) { route in
                destinationView(route)
            }
        }
        .onAppear {
            viewModel.action(.onAppear)
        }
    }
    
    @ViewBuilder
    private func destinationView(_ route: RecordPhotoRoute) -> some View {
        switch route {
        default: EmptyView()
        }
    }
}
