//
//  RecordPhotoExampleApp.swift
//  RecordPhotoExample
//
//  Created by 정지훈 on 9/17/25.
//

import SwiftUI
import RecordPhotoFeature
import Foundation

@main
struct RecordPhotoExampleApp: App {
    
    var body: some Scene {
        WindowGroup {
            RecordPhotoRootView(viewModel: RecordPhotoRootViewModel())
        }
    }
}
