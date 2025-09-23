//
//  BaseRouter.swift
//  CoreRouterInterface
//
//  Created by 정지훈 on 9/23/25.
//

import CoreRouterInterface
import SwiftUI

public class BaseRouter: Router {
    
    public var path = NavigationPath()
    var presentedRoute: (any Route)?
    
    public init () { }
    
    public func push(_ route: some Route) {
        path.append(route)
    }
    
    public func pop() {
        path.removeLast()
    }
    
    public func popToRoot() {
        path.removeLast(path.count)
    }
    
    public func sheet(_ route: some Route) {
        presentedRoute = route
    }
    
    public func fullScreenCover(_ route: some Route) {
        presentedRoute = route
    }
    
    public func dismiss() {
        presentedRoute = nil
    }
}

