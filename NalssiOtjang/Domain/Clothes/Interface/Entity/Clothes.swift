//
//  File 2.swift
//  DomainClassifyPhotoInterface
//
//  Created by 정지훈 on 10/13/25.
//

import Foundation

public struct Clothes {
    public var top: Category.Top?
    public var bottom: Category.Bottom?
    public var outer: Category.Outer?
    public var dress: Category.Dress?
    
    public init(categories: [String]) {
        for category in categories {
            if let topType = Category.Top(rawValue: category), top == nil {
                top = topType
            } else if let bottomType = Category.Bottom(rawValue: category), bottom == nil {
                bottom = bottomType
            } else if let outerType = Category.Outer(rawValue: category), outer == nil {
                outer = outerType
            } else if let dressType = Category.Dress(rawValue: category), dress == nil {
                dress = dressType
            }
        }
    }
    
}

// MARK: - Clothes Category

extension Clothes {
    public enum Category {
        public enum Top: String {
            case sweatShirt = "sweat_shirt"
            case sweater
            case hoodie
            case shirtBlouse = "shirt_blouse"
            case longSleeve = "long_sleeve"
            case sleeveless
            case tShirt = "tshirt"
        }
        
        public enum Outer: String {
            case hoodieZipup = "hoodie_zipup"
            case jacket
            case cardigan
            case windbreaker
            case sportJacket = "sport_jacket"
            case thinCoat = "thin_coat"
            case fieldCoat = "field_coat"
            case vest
            case shortWinterJacket = "short_winter_jacket"
            case longWinterJacket = "long_winter_jacket"
            case shearlingCoat = "shearling_coat"
            case fleeceJacket = "fleece_jacket"
            case thickCoat = "thick_coat"
            case pufferVest = "puffer_vest"
            case shortCoat = "short_coat"
            case lightweightJacket = "lightweight_jacket"
        }
        
        public enum Bottom: String {
            case longPants = "long_pants"
            case shortPants = "short_pants"
            case leggings
            case overall
            
            case miniSkirt = "mini_skirt"
            case mediumSkirt = "medium_skirt"
            case longSkirt = "long_skirt"
        }
        
        public enum Dress: String {
            case miniDress = "mini_dress"
            case mediumDress = "medium_dress"
            case longDress = "long_dress"
        }
    }
}
