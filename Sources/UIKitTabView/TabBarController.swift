//
//  TabBarController.swift
//  
//
//  Created by Q Trang on 8/1/20.
//

import SwiftUI

public struct TabBarController: UIViewControllerRepresentable {
    public let viewControllers: [UIViewController]
    
    public init(viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
    }
    
    public func makeUIViewController(context: Context) -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = viewControllers
        
        return tabBarController
    }
    
    public func updateUIViewController(_ uiViewController: UITabBarController, context: Context) {}
}

