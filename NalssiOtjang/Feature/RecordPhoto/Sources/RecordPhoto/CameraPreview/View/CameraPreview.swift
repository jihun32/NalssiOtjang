// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import AVFoundation

public final class PreviewView: UIView {
    public override class var layerClass: AnyClass {
        AVCaptureVideoPreviewLayer.self
    }
    var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        layer as! AVCaptureVideoPreviewLayer
    }
}

public struct CameraPreview: UIViewRepresentable {
    let session: AVCaptureSession
    
    public init(session: AVCaptureSession) {
        self.session = session
    }
    
    public func makeUIView(context: Context) -> PreviewView {
        let preview = PreviewView()
        preview.videoPreviewLayer.session = session
        preview.videoPreviewLayer.videoGravity = .resizeAspectFill
        preview.backgroundColor = .black
        return preview
    }
    
    public func updateUIView(_ uiView: PreviewView, context: Context) {
        
    }
}

