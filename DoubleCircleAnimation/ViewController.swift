//
//  ViewController.swift
//  DoubleCircleAnimation
//
//  Created by PandaLZMing on 16/1/18.
//  Copyright © 2016年 PandaLZMing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var backCircle: BlueCircle!
    var frontCircle: BlueCircle!
    let circleWidth: CGFloat = 140.0
    let maxCircleDistance: CGFloat = 30.0
    let animationDuration = 0.4
    let lineWidth : CGFloat = 30.0
    let frontCircleColor: String = "0x5BC6EF"
    let backCircleColor: String = "0x1BA6E3"
    var animationed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backCircle = BlueCircle(frame: CGRect(x: 0, y: 0, width: circleWidth, height: circleWidth), color: UIColor(hexString: backCircleColor)!, lineWidth: lineWidth)
        backCircle.center = CGPoint(x: (self.view.width / 2.0 - maxCircleDistance), y: self.view.height / 2.0)
        
        frontCircle = BlueCircle(frame: CGRect(x: 0, y: 0, width: circleWidth, height: circleWidth), color: UIColor(hexString: frontCircleColor)!, lineWidth: lineWidth)
        frontCircle.center = CGPoint(x: (self.view.width / 2.0 + maxCircleDistance), y: self.view.height / 2.0)

        self.view.addSubview(backCircle)
        self.view.addSubview(frontCircle)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBAction func goAnimation(sender: AnyObject) {
        if (self.animationed) {
            return
        }
        self.animationed = true
        self.backCircleMoveToRight1()
        self.frontCircleMoveToLeft1()
    }
    
    
    private func backCircleMoveToRight1() {
        UIView.animateWithDuration(animationDuration / 2, animations: { () -> Void in
             self.backCircle.centerX = self.view.width / 2.0
            }) { (Bool) -> Void in
                self.backCircle.circleLayer.strokeColor = UIColor(hexString: self.frontCircleColor)!.CGColor
                self.backCircleMoveToRight2()
        }
    }
    
    private func backCircleMoveToRight2() {
        UIView.animateWithDuration(animationDuration / 2, animations: { () -> Void in
            self.backCircle.centerX = self.view.width / 2.0 + self.maxCircleDistance
            }) { (Bool) -> Void in
                self.backCircleMoveToLeft1()
        }
    }
    
    
    private func backCircleMoveToLeft1() {
        UIView.animateWithDuration(animationDuration / 2, animations: { () -> Void in
            self.backCircle.centerX = self.view.width / 2.0
            }) { (Bool) -> Void in
                self.backCircle.circleLayer.strokeColor = UIColor(hexString: self.backCircleColor)!.CGColor
                self.backCircleMoveToLeft2()
        }
    }
    
    private func backCircleMoveToLeft2() {
        UIView.animateWithDuration(animationDuration / 2, animations: { () -> Void in
            self.backCircle.centerX = self.view.width / 2.0 - self.maxCircleDistance
            
            }) { (Bool) -> Void in
                self.backCircleMoveToRight1()
        }
    }

    
    private func frontCircleMoveToLeft1() {
        UIView.animateWithDuration(animationDuration / 2, animations: { () -> Void in
            self.frontCircle.centerX = self.view.width / 2.0
            }) { (Bool) -> Void in
                self.frontCircle.circleLayer.strokeColor = UIColor(hexString: self.backCircleColor)!.CGColor
                self.frontCircleMoveToLeft2()
        }
    }
    
    private func frontCircleMoveToLeft2() {
        UIView.animateWithDuration(animationDuration / 2, animations: { () -> Void in
            self.frontCircle.centerX = self.view.width / 2.0 - self.maxCircleDistance
            }) { (Bool) -> Void in
                self.frontCircleMoveToRight1()
        }
    }
    
    private func frontCircleMoveToRight1() {
        UIView.animateWithDuration(animationDuration / 2, animations: { () -> Void in
            
            self.frontCircle.centerX = self.view.width / 2.0
            
            }) { (Bool) -> Void in
                self.frontCircle.circleLayer.strokeColor = UIColor(hexString: self.frontCircleColor)!.CGColor
                self.frontCircleMoveToRight2()
        }
        
        UIView.beginAnimations("scaleView1", context: nil)
        UIView.setAnimationDuration(animationDuration / 2.0)
        self.frontCircle.transform = CGAffineTransformScale(self.frontCircle.transform, 0.80, 0.80)
        UIView.commitAnimations()
    }
    
    
    private func frontCircleMoveToRight2() {
        UIView.animateWithDuration(animationDuration / 2, animations: { () -> Void in
            self.frontCircle.centerX = self.view.width / 2.0 + self.maxCircleDistance
            }, completion: { (Bool) -> Void in
                
                self.frontCircleMoveToLeft1()
        })
        UIView.beginAnimations("scaleView2", context: nil)
        UIView.setAnimationDuration(animationDuration / 2)
        self.frontCircle.transform = CGAffineTransformScale(self.frontCircle.transform, 100/80, 100/80)
        UIView.commitAnimations()
    }
}

