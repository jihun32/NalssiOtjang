// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import AVFoundation

final class PreviewView: UIView {
    override class var layerClass: AnyClass {
        AVCaptureVideoPreviewLayer.self
    }
    var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        layer as! AVCaptureVideoPreviewLayer
    }
}

struct CameraPreview: UIViewRepresentable {
    let session: AVCaptureSession
    
    init(session: AVCaptureSession) {
        self.session = session
    }
    
    func makeUIView(context: Context) -> PreviewView {
        let preview = PreviewView()
        preview.videoPreviewLayer.session = session
        preview.videoPreviewLayer.videoGravity = .resizeAspectFill
        
        return preview
    }
    
    func updateUIView(_ uiView: PreviewView, context: Context) {
        
    }
}

