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
        RecordPhotoExplainView(viewModel: RecordPhotoExplainViewModel())
    }
}

#Preview {
    RecordPhotoRootView(
        viewModel: RecordPhotoRootViewModel()
    )
}
