//
//  File.swift
//  RecordPhoto
//
//  Created by 정지훈 on 9/17/25.
//

import SwiftUI

public struct RecordPhotoExplainView: View {
    let viewModel: RecordPhotoExplainViewModel
    
    public init(viewModel: RecordPhotoExplainViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack {
            
        }
    }
}

#Preview {
    RecordPhotoExplainView(
        viewModel: RecordPhotoExplainViewModel()
    )
}
