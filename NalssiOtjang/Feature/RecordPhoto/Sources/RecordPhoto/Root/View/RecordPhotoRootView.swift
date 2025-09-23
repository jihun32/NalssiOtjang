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
            RecordPhotoExplainView(viewModel: RecordPhotoExplainViewModel())
        }.navigationDestination(for: RecordPhotoRoute.self) { route in
            destinationView(route)
        }
    }
    
    @ViewBuilder
    private func destinationView(_ route: RecordPhotoRoute) -> some View {
        switch route {
        case .explainPhoto:
            RecordPhotoExplainView(viewModel: RecordPhotoExplainViewModel())
        default: EmptyView()
        }
    }
}
