//
//  File.swift
//  DesignSystem
//
//  Created by home on 9/7/25.
//

import SwiftUI

public enum NOColor {
    case gradient(Gradient)
    case neutral(Neutral)
    case primary(Primary)

    public enum Gradient {
        case lightSkyblueStart
        case lightSkyblueEnd
        case skyblueStart
        case skyblueEnd
        case purpleStart
        case purpleEnd
    }
    
    public enum Neutral {
        case lightGray
        case yellow
        case black
        case white
    }
    
    public enum Primary {
        case main
    }
}

extension NOColor {
    var color: Color {
        switch self {
        case let .gradient(gradient):
            gradient.color
        case let .neutral(neutral):
            neutral.color
        case let .primary(primary):
            primary.color
        }
    }
}

extension NOColor.Gradient: Colorable {
    var color: Color {
        switch self {
        case .lightSkyblueStart:
            Color(.lightSkyBlueStart)
        case .lightSkyblueEnd:
            Color(.lightSkyBlueEnd)
        case .skyblueStart:
            Color(.skyBlueStart)
        case .skyblueEnd:
            Color(.skyBlueEnd)
        case .purpleStart:
            Color(.purpleStart)
        case .purpleEnd:
            Color(.purpleEnd)
        }
    }
}


extension NOColor.Neutral: Colorable {
    var color: Color {
        switch self {
        case .lightGray:
            Color(.lightGray)
        case .yellow:
            Color(.yellow)
        case .black:
            Color(.black)
        case .white:
            Color(.white)
        }
    }
}

extension NOColor.Primary: Colorable {
    var color: Color {
        switch self {
        case .main:
            Color(.primaryMain)
        }
    }
}
