// The Swift Programming Language
// https://docs.swift.org/swift-book

public protocol Router {
    // Navigation
    func push<T: Hashable>(_ route: T)
    func pop()
    func popToRoot()
    func replace<T: Hashable>(_ route: T)
    
    // Modal
    func sheet<T: Hashable>(_ route: T)
    func fullScreenCover<T: Hashable>(_ route: T)
    func dismiss()
}
