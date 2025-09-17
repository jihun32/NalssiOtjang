//
//  File.swift
//  RecordPhoto
//
//  Created by home on 9/16/25.
//

import SwiftUI

public protocol CameraPreviewInterface {
    associatedtype CameraPreview: View
    
    func cameraPreview() -> CameraPreview
}
