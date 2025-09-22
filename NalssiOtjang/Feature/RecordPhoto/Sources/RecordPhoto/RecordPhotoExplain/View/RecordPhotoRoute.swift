//
//  File.swift
//  RecordPhoto
//
//  Created by 정지훈 on 9/22/25.
//

import SwiftUI

public enum RecordPhotoRoute: Hashable {
    case explainPhoto
    case camera
    case validatePhoto
    case choiceClothesIcon
    case recordPhoto
}

public final class RecordPhotoRouter {
    var path = NavigationPath()
    
    func push(_ route: RecordPhotoRoute) {
        path.append(route)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path = NavigationPath()
    }
    
    func replace(with route: RecordPhotoRoute) {
        path.removeLast()
        path.append(route)
    }
}
