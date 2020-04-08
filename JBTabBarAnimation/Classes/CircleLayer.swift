//
//  CircleLayer.swift
//  JBTabBarAnimation
//
//  Created by Jithin Balan on 2/5/19.
//

import Foundation
import UIKit

open class CircleLayer: CAShapeLayer {
    
    var circleColor = UIColor.white
    var positionValue: CGPoint = .zero
    private var radiusValue: CGFloat = 25
    
    override init() {
        super.init()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createCircle() -> CircleLayer {
        fillColor = circleColor.cgColor
        path = createPath()
        return self
    }
    
    func createPath() -> CGPath{
        let path = UIBezierPath()
        path.addArc(withCenter: positionValue, radius: radiusValue, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        return path.cgPath
    }
    
}
