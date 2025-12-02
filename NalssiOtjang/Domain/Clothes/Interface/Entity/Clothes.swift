//
//  Clothes.swift
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


// MARK: - Korean Name Computed Properties

extension Clothes.Category.Top {
    public var koreanName: String {
        switch self {
        case .sweatShirt: return "맨투맨"
        case .sweater: return "니트"
        case .hoodie: return "후드티"
        case .shirtBlouse: return "셔츠/블라우스"
        case .longSleeve: return "긴팔티"
        case .sleeveless: return "민소매"
        case .tShirt: return "반팔티"
        }
        
    }
    
}

extension Clothes.Category.Outer {
    
    public var koreanName: String {
        switch self {
        case .hoodieZipup: return "후드 집업"
        case .jacket: return "자켓"
        case .cardigan: return "가디건"
        case .windbreaker: return "바람막이"
        case .sportJacket: return "저지"
        case .thinCoat: return "얇은 코트"
        case .fieldCoat: return "야상"
        case .vest: return "조끼"
        case .shortWinterJacket: return "숏패딩"
        case .longWinterJacket: return "롱패딩"
        case .shearlingCoat: return "무스탕"
        case .fleeceJacket: return "후리스"
        case .thickCoat: return "두꺼운 코트"
        case .pufferVest: return "패딩조끼"
        case .shortCoat: return "숏코트"
        case .lightweightJacket: return "경량 패딩"
        }
    }
    
}

extension Clothes.Category.Bottom {
    
    public var koreanName: String {
        switch self {
        case .longPants: return "긴바지"
        case .shortPants: return "반바지"
        case .leggings: return "레깅스"
        case .overall: return "오버롤"
        case .miniSkirt: return "미니스커트"
        case .mediumSkirt: return "미디스커트"
        case .longSkirt: return "롱스커트"
        }
    }
}

extension Clothes.Category.Dress {
    public var koreanName: String {
        switch self {
        case .miniDress: return "미니 원피스"
        case .mediumDress: return "미디 원피스"
        case .longDress: return "롱 원피스"
        }
    }
}
