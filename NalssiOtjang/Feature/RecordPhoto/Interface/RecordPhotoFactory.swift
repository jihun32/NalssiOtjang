//
//  File.swift
//  RecordPhoto
//
//  Created by home on 9/16/25.
//

import SwiftUI
import AVFoundation

@MainActor
public protocol RecordPhotoFactory {
    func cameraPreview(session: AVCaptureSession) -> AnyView
}
