//
//  WhiteAnimationManager.swift
//  GoogleIcon
//
//  Created by ZhengWei on 16/8/30.
//  Copyright © 2016年 Bourbon. All rights reserved.
//

import UIKit

class WhiteAnimationManager: NSObject {

    static func createWhiteAnimation() -> CAAnimationGroup {
        
        let group = CAAnimationGroup.init()
        group.removedOnCompletion = false
        group.fillMode = kCAFillModeForwards
        group.duration = 3;
        
        let first = self.firstAnimation()
        let corner = self.changeLayer()
        let frame = self.changeFrame()
//        let reFrame = self.reChangeFrame()
        let forth = self.keepChangeLayer()
        
        
        group.animations = [first,corner,frame,forth]
        return group
    }
    
    static func firstAnimation()->CABasicAnimation{
        
        let animation = CABasicAnimation.init(keyPath: "transform.scale")
        animation.duration = 1
        animation.fromValue = 0
        animation.toValue = 1
        animation.beginTime = 0
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn)
        return animation
    }
    static func changeLayer() -> CABasicAnimation{
        let animation = CABasicAnimation.init(keyPath: "cornerRadius")
        animation.duration = 1
        animation.fromValue = 0
        animation.toValue = 37
        animation.beginTime = 0
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn)
        return animation
    }

    static func changeFrame() -> CABasicAnimation{
        let animation = CABasicAnimation.init(keyPath: "bounds")
        animation.fromValue = NSValue.init(CGRect: CGRect.init(x: 0, y: 0, width: 74, height: 74))
        animation.toValue = NSValue.init(CGRect: CGRect.init(x: 0, y: 0, width: 200, height: 74))
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn)
        animation.beginTime = 1
        animation.duration = 1
        return animation
    }
    static func reChangeFrame() -> CABasicAnimation{
        let animation = CABasicAnimation.init(keyPath: "bounds")
        animation.fromValue = NSValue.init(CGRect: CGRect.init(x: 0, y: 0, width: 200, height: 200))
        animation.toValue = NSValue.init(CGRect: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn)
        animation.beginTime = 2
        animation.duration = 1
        return animation

    }
    static func keepChangeLayer() -> CABasicAnimation{
        let animation = CABasicAnimation.init(keyPath: "transform.scale")
        animation.duration = 1
        animation.fromValue = 1
        animation.toValue = 0
        animation.beginTime = 2
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        return animation
    }

}
