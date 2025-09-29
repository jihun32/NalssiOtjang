//
//  File 2.swift
//  SharedDesignSystem
//
//  Created by 정지훈 on 9/18/25.
//

import SwiftUI

extension NOImage.ImageType: Imageable {
    var image: Image {
        switch self {
            case let .recordPhoto(image):
            return image.image
        }
    }
}

extension NOImage.ImageType.RecordPhoto: Imageable {
    var image: Image {
        switch self {
        case .recordPhotoExpain:
            return Image(.recordPhotoExplain)
        }
    }
}
