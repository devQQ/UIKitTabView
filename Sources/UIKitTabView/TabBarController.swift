//
//  TabBarController.swift
//
//
//  Created by Q Trang on 8/1/20.
//

import SwiftUI

public struct TabBarController: UIViewControllerRepresentable {
    public class Coordinator: NSObject, UITabBarControllerDelegate {
        let parent: TabBarController
        let didSelectIndex: ((Int) -> Void)?
        
        init(_ parent: TabBarController, didSelectIndex: ((Int) -> Void)? = nil) {
            self.parent = parent
            self.didSelectIndex = didSelectIndex
        }
        
        public func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
            let index = tabBarController.viewControllers!.firstIndex(of: viewController)
            self.didSelectIndex?(index ?? 0)
        }
    }
    
    public let viewControllers: [UIViewController]
    public let didSelectIndex: ((Int) -> Void)?
    
    public init(viewControllers: [UIViewController], didSelectIndex: ((Int) -> Void)? = nil) {
        self.viewControllers = viewControllers
        self.didSelectIndex = didSelectIndex
    }
    
    public func makeUIViewController(context: Context) -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = viewControllers
        tabBarController.delegate = context.coordinator
        
        return tabBarController
    }
    
    public func updateUIViewController(_ uiViewController: UITabBarController, context: Context) {}
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self, didSelectIndex: didSelectIndex)
    }
}
