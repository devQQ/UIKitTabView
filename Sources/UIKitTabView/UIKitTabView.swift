//
//  UIKitTabView.swift
//
//
//  Created by Q Trang on 8/1/20.
//

import SwiftUI

public struct UIKitTabView: View {
    public struct Tab<Content: View> {
        let content: Content
        let item: UITabBarItem
        
        public init(content: Content, item: UITabBarItem) {
            self.content = content
            self.item = item
        }
        
        public init(@ViewBuilder _ content: @escaping () -> Content, title: String? = nil, image: UIImage? = nil, selectedImage: UIImage? = nil) {
            let item = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
            self.init(content: content(), item: item)
            
        }
        
        public init(@ViewBuilder _ content: @escaping () -> Content, title: String? = nil, image: UIImage? = nil, tag: Int) {
            let item = UITabBarItem(title: title, image: image, tag: tag)
            self.init(content: content(), item: item)
        }
    }
    
    let viewControllers: [UIHostingController<AnyView>]
    
    public init(tabs: [Tab<AnyView>]) {
        self.viewControllers = tabs.map() {
            let vc = UIHostingController(rootView: $0.content)
            vc.tabBarItem = $0.item
            
            return vc
        }
    }
    
    public var body: some View {
        TabBarController(viewControllers: viewControllers)
            .edgesIgnoringSafeArea(.bottom)
    }
}
