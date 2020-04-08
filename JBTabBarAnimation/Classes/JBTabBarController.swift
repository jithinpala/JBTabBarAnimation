//
//  JBTabBarController.swift
//  JBTabBarAnimation
//
//  Created by Jithin Balan on 2/5/19.
//

import UIKit

open class JBTabBarController: UITabBarController {

    var priviousSelectedIndex: Int = -1
    
    open var circleColor = UIColor.white
    
    open override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let item = self.tabBar.selectedItem {
            self.tabBar(self.tabBar, didSelect: item)
        }
    }
    
    open override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let items = self.tabBar.items, let selectedIndex = items.firstIndex(of: item), priviousSelectedIndex != selectedIndex, let customTabBar = tabBar as? JBTabBar {
            let tabBarItemViews = self.tabBarItemViews()
            tabBarItemViews.forEach { tabBarItemView in
                let firstIndex = tabBarItemViews.firstIndex(of: tabBarItemView)
                if selectedIndex == firstIndex {
                    showItemLabel(for: selectedIndex, isHidden: true)
                    createRoundLayer(for: tabBarItemView, at: selectedIndex)
                    customTabBar.curveAnimation(for: selectedIndex)
                    shouldDisableUserInteraction(for: false)
                    UIView.animate(withDuration: 0.7, delay: 0.0, usingSpringWithDamping: 0.57, initialSpringVelocity: 0.0, options: .curveEaseInOut, animations: {
                        tabBarItemView.frame = CGRect(x: tabBarItemView.frame.origin.x, y: tabBarItemView.frame.origin.y - 1, width: tabBarItemView.frame.width, height: tabBarItemView.frame.height)
                    }, completion: { _ in
                        customTabBar.finishAnimation()
                        self.shouldDisableUserInteraction(for: true)
                    })
                } else if priviousSelectedIndex == firstIndex {
                    showItemLabel(for: priviousSelectedIndex, isHidden: false)
                    removeBarItemCircleLayer(barItemView: tabBarItemView)
                    UIView.animate(withDuration: 0.7, delay: 0.0, usingSpringWithDamping: 0.57, initialSpringVelocity: 0.0, options: .curveEaseInOut, animations: {
                        tabBarItemView.frame = CGRect(x: tabBarItemView.frame.origin.x, y: tabBarItemView.frame.origin.y + 1, width: tabBarItemView.frame.width, height: tabBarItemView.frame.height)
                    }, completion: nil)
                }
            }
            priviousSelectedIndex = selectedIndex
        }
    }
    
    private func tabBarItemViews() -> [UIView] {
        let interactionControls = tabBar.subviews.filter { $0 is UIControl }
        return interactionControls.sorted(by: { $0.frame.minX < $1.frame.minX })
    }
    
    private func removeBarItemCircleLayer(barItemView: UIView) {
        if let circleLayer = (barItemView.layer.sublayers?.filter { $0 is CircleLayer }.first) {
            circleLayer.removeFromSuperlayer()
        }
    }
    
    private func createRoundLayer(for tabBarItemView: UIView, at index: Int) {
        if let itemImageView = tabBar.imageView(at: index) {
            let circle = CircleLayer()
            circle.circleColor = circleColor
            circle.positionValue = itemImageView.center
            tabBarItemView.layer.addSublayer(circle.createCircle())
        }
    }
    
    private func showItemLabel(for index: Int, isHidden: Bool) {
        if let buttonLabel = tabBar.titleLabel(at: index) {
            buttonLabel.isHidden = isHidden
        }
    }
    
    private func shouldDisableUserInteraction(for status: Bool) {
        tabBar.isUserInteractionEnabled = status
    }
}
