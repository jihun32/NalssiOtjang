//
//  File 2.swift
//  SharedDesignSystem
//
//  Created by 정지훈 on 9/18/25.
//

import SwiftUI

public enum NOImage: Imageable {
    case icon(IconType)
    case normal(ImageType)
    
    public enum IconType {
        case clothes(Clothes)
        
        public enum Clothes {
            case blazer
            case cardigun
            case fieldCoat
            case fleeceJacket
            case hoodie
            case hoodieZipup
            case jacket
            case leggings
            case lightweightJacket
            case longDress
            case longPants
            case longSkirt
            case longSleeve
            case longWinterJacket
            case mediumSkirt
            case mediumDres
            case miniDress
            case miniSkirt
            case overall
            case pufferVest
            case shearlingJacket
            case shirt
            case shortCoat
            case shortPants
            case shortWinterJacket
            case sleeveless
            case sportJacket
            case suit
            case sweater
            case sweatshirt
            case thickCoat
            case thinCoat
            case tshirt
            case vest
            case windbreaker
        }
    }
    
    public enum ImageType {
        case recordPhoto(RecordPhoto)
        
        public enum RecordPhoto {
            case recordPhotoExpain
        }
    }
}

extension NOImage {
    public var image: Image {
        switch self {
        case let .icon(icon):
            return icon.image
        case let .normal(imageType):
            return imageType.image
        }
    }
}
