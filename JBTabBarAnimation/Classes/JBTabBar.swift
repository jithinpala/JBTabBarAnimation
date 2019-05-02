//
//  JBTabBar.swift
//  JBTabBarAnimation
//
//  Created by Jithin Balan on 2/5/19.
//

import UIKit

public class JBTabBar: UITabBar {

    private let tabBarCurveShapeLayer = CAShapeLayer()
    private struct Constants {
        static let itemWidth = 60
    }
    
    var selectedIndex: Int = 0
    
    var startPoint: CGPoint {
        let itemWidth = self.bounds.width / CGFloat(items?.count ?? 0)
        let startXPoint = (itemWidth * CGFloat(selectedIndex)) + (itemWidth / 2)
        return CGPoint(x: startXPoint - 41, y: 0)
    }
    
    private var diameter: CGFloat = 72
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        self.setupTabBar()
    }
    
    func setupTabBar() {
        self.isTranslucent = true
        self.backgroundColor = UIColor.clear
        self.backgroundImage = UIImage()
        self.shadowImage = UIImage()
        self.clipsToBounds = false
        
        tabBarCurveShapeLayer.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        tabBarCurveShapeLayer.fillColor = UIColor.white.cgColor
        tabBarCurveShapeLayer.strokeColor = UIColor.white.cgColor
        tabBarCurveShapeLayer.path = createPathForTabBar().cgPath
        self.layer.insertSublayer(tabBarCurveShapeLayer, at: 0)
        
    }
    
    private func createPathForTabBar() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: startPoint)
        
        let leftCurveControlPoint1 = CGPoint(x: startPoint.x + 6, y: 0)
        let leftCurveControlPoint2 = CGPoint(x: startPoint.x + 10, y: 5)
        path.addCurve(to: CGPoint(x: startPoint.x + 10, y: 10), controlPoint1: leftCurveControlPoint1, controlPoint2: leftCurveControlPoint2)
        
        let middleCurveControlPoint1 = CGPoint(x: startPoint.x + 10, y: 60)
        let middleCurveControlPoint2 = CGPoint(x: startPoint.x + diameter, y: 60)
        path.addCurve(to: CGPoint(x: startPoint.x + diameter, y: 10), controlPoint1: middleCurveControlPoint1, controlPoint2: middleCurveControlPoint2)
        
        let rightCurveControlPoint1 = CGPoint(x: startPoint.x + diameter, y: 5)
        let rightCurveControlPoint2 = CGPoint(x: startPoint.x + diameter + 5, y: 0)
        path.addCurve(to: CGPoint(x: startPoint.x + diameter + 10, y: 0), controlPoint1: rightCurveControlPoint1, controlPoint2: rightCurveControlPoint2)
        
        path.addLine(to: CGPoint(x: self.bounds.width, y: 0))
        path.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height))
        path.addLine(to: CGPoint(x: 0, y: self.bounds.height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        
        return path
        
    }
    
    func curveAnimation(for index: Int) {
        self.selectedIndex = index
        curveAnimation()
    }
    
    private func curveAnimation() {
        let pathAnimation = CASpringAnimation(keyPath: "path")
        pathAnimation.damping = 100
        pathAnimation.toValue = createPathForTabBar().cgPath
        pathAnimation.duration = 0.9
        pathAnimation.fillMode = .forwards
        pathAnimation.isRemovedOnCompletion = false
        pathAnimation.autoreverses = false
        pathAnimation.repeatCount = 0
        tabBarCurveShapeLayer.add(pathAnimation, forKey: "pathAnimation")
    }
    
    func finishAnimation() {
        tabBarCurveShapeLayer.path = createPathForTabBar().cgPath
    }

}
