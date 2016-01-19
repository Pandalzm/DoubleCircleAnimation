//
//  FirstCircle.swift
//  DoubleCircleAnimation
//
//  Created by PandaLZMing on 16/1/18.
//  Copyright © 2016年 PandaLZMing. All rights reserved.
//

import UIKit

class BlueCircle: UIView {
    
    var circleLayer: CAShapeLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect, color: UIColor, lineWidth: CGFloat) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: frame.size.width / 2, startAngle: 0.0, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
        
        circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.CGPath
        circleLayer.fillColor = UIColor.clearColor().CGColor
        circleLayer.strokeColor = color.CGColor
        circleLayer.lineWidth = lineWidth
        circleLayer.strokeEnd = 1.0
        
        self.layer.addSublayer(circleLayer)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
