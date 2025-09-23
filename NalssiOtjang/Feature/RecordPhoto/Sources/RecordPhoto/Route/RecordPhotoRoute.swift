//
//  File.swift
//  RecordPhoto
//
//  Created by 정지훈 on 9/22/25.
//

import SwiftUI
import CoreRouterInterface

public enum RecordPhotoRoute: Hashable {
    case explainPhoto
    case camera
    case validatePhoto
    case choiceClothesIcon
    case recordPhoto
}

public final class RecordPhotoRouter: Router {
    var path = NavigationPath()
    var presentedRoute: RecordPhotoRoute?
    
    public func push(_ route: some Hashable) {
        path.append(route)
    }
    
    public func pop() {
        path.removeLast()
    }
    
    public func popToRoot() {
        path.removeLast(path.count)
    }
    
    public func sheet(_ route: some Hashable) {
        presentedRoute = route as? RecordPhotoRoute
    }
    
    public func fullScreenCover(_ route: some Hashable) {
        presentedRoute = route as? RecordPhotoRoute
    }
    
    public func dismiss() {
        presentedRoute = nil
    }
    
   
}
