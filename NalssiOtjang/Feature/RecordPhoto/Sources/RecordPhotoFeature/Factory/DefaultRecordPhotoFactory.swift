//
//  File.swift
//  RecordPhoto
//
//  Created by 정지훈 on 9/17/25.
//

import RecordPhotoInterface
import AVFoundation
import SwiftUI

public struct DefaultRecordPhotoFactory: RecordPhotoFactory {
    public func cameraPreview(session: AVCaptureSession) -> AnyView {
        AnyView(CameraPreview(session: session))
    }
}
