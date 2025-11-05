// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public protocol Router {
    // Navigation
    var path: NavigationPath { get set }
    var presentedRoute: (any Route)? { get set }
    func push(_ route: some Route)
    func pop()
    func popToRoot()
    
    // Modal
    func sheet(_ route: some Route)
    func fullScreenCover(_ route: some Route)
    func dismiss()
}
