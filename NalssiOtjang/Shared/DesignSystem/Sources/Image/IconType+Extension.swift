//
//  File.swift
//  SharedDesignSystem
//
//  Created by 정지훈 on 9/18/25.
//

import SwiftUI

extension NOImage.IconType: Imageable {
    var image: Image {
        switch self {
            case let .clothes(clothes):
            return clothes.image
        }
    }
}

extension NOImage.IconType.Clothes: Imageable {
    var image: Image {
        switch self {
        case .blazer:
            return Image(.blazer)
        case .cardigun:
            return Image(.cardigun)
        case .fieldCoat:
            return Image(.filedCoat)
        case .fleeceJacket:
            return Image(.fleeceJacket)
        case .hoodie:
            return Image(.hoodie)
        case .hoodieZipup:
            return Image(.hoodieZipup)
        case .jacket:
            return Image(.jacket)
        case .leggings:
            return Image(.leggings)
        case .lightweightJacket:
            return Image(.lightweightJacket)
        case .longDress:
            return Image(.longDress)
        case .longPants:
            return Image(.longPants)
        case .longSkirt:
            return Image(.longSkirt)
        case .longSleeve:
            return Image(.longSleeve)
        case .longWinterJacket:
            return Image(.longWinterJacket)
        case .mediumSkirt:
            return Image(.mediumSkirt)
        case .mediumDres:
            return Image(.mediumDress)
        case .miniDress:
            return Image(.miniDress)
        case .miniSkirt:
            return Image(.miniSkirt)
        case .overall:
            return Image(.overall)
        case .pufferVest:
            return Image(.pufferVest)
        case .shearlingJacket:
            return Image(.shearlingJacket)
        case .shirt:
            return Image(.shirt)
        case .shortCoat:
            return Image(.shortCoat)
        case .shortPants:
            return Image(.shortPants)
        case .shortWinterJacket:
            return Image(.shortWinterJacket)
        case .sleeveless:
            return Image(.sleeveless)
        case .sportJacket:
            return Image(.sportJacket)
        case .suit:
            return Image(.suit)
        case .sweater:
            return Image(.sweater)
        case .sweatshirt:
            return Image(.sweatshirt)
        case .thickCoat:
            return Image(.thickCoat)
        case .thinCoat:
            return Image(.thinCoat)
        case .tshirt:
            return Image(.tshirt)
        case .vest:
            return Image(.vest)
        case .windbreaker:
            return Image(.windbreaker)
        }
    }
}
