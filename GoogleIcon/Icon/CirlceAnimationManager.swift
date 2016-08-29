//
//  CirlceAnimationManager.swift
//  GoogleIcon
//
//  Created by ZhengWei on 16/8/29.
//  Copyright © 2016年 Bourbon. All rights reserved.
//

import UIKit

enum PositionType {
    case up
    case down
    case left
    case right
}

class CirlceAnimationManager: NSObject {

    static func createAnimation(position:CGPoint,type:PositionType) -> CAAnimationGroup {
        let first = CABasicAnimation.init(keyPath: "position")
        first.fromValue = NSValue.init(CGPoint: position)
        var point = CGPointZero
        switch type {
        case .up:
            point = CGPointMake(position.x, position.y-14)
            break
        case .down:
            point = CGPointMake(position.x, position.y+14)
            break
        case .left:
            point = CGPointMake(position.x-14, position.y)
            break
        case .right:
            point = CGPointMake(position.x+14, position.y)
            break
            
        default:
            break
        }
        first.toValue = NSValue.init(CGPoint: point)
        first.duration = 1
        first.beginTime = 0
        first.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn)
        
        
        let second = self.createMoveAnimation(point, type: type)
        let third  = self.circleGoBackAnimation(second.toValue!.CGPointValue, type: type)
        let forth  = self.circleFontAnimation(third.toValue!.CGPointValue, type: type)
        
        let group = CAAnimationGroup.init()
        group.duration = 4
        group.animations = [first,second,third,forth]
        group.removedOnCompletion = false
        group.fillMode = kCAFillModeForwards
        return group
    }
    static func createMoveAnimation(position:CGPoint,type:PositionType) -> CABasicAnimation {
        let animation = CABasicAnimation.init(keyPath: "position")
        animation.fromValue = NSValue.init(CGPoint: position)
        animation.duration = 1
        animation.beginTime = 1
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn)
        switch type {
        case .up:
            animation.toValue = NSValue.init(CGPoint: CGPointMake(position.x - 28, position.y + 26))
            break
        case .down:
            animation.toValue = NSValue.init(CGPoint: CGPointMake(position.x + 28, position.y - 26))
            break
        case .left:
            animation.toValue = NSValue.init(CGPoint: CGPointMake(position.x - 42, position.y))
            break
        case .right:
            animation.toValue = NSValue.init(CGPoint: CGPointMake(position.x + 42, position.y))
            break
        default:
            break
        }
        
        return animation
    }
    
    static func circleGoBackAnimation(position:CGPoint,type:PositionType) -> CABasicAnimation {
        let animation = CABasicAnimation.init(keyPath: "position")
        animation.fromValue = NSValue.init(CGPoint: position)
        animation.duration = 1
        animation.beginTime = 2
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn)
        var point = CGPointZero
        switch type {
        case .up:
            point = CGPointMake(position.x+28, position.y)
            break
        case .down:
            point = CGPointMake(position.x-28, position.y)
            break
        case .left:
            point = CGPointMake(position.x+42+24, position.y)
            break
        case .right:
            point = CGPointMake(position.x-42-26, position.y)
            break
            
        default:
            break
        }
        animation.toValue = NSValue.init(CGPoint: point)
        return animation
    }
    
    static func circleFontAnimation(position:CGPoint,type:PositionType) -> CABasicAnimation{
        let animation = CABasicAnimation.init(keyPath: "position")
        animation.fromValue = NSValue.init(CGPoint: position)
        animation.duration = 1
        animation.beginTime = 3
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn)
        var point = CGPointZero
        switch type {
        case .up:
            point = CGPointMake(position.x, position.y-12)
            break
        case .down:
            point = CGPointMake(position.x, position.y+12)
            break
        case .left:
            point = CGPointMake(position.x-12, position.y)
            break
        case .right:
            point = CGPointMake(position.x+12, position.y)
            break
            
        default:
            break
        }
        animation.toValue = NSValue.init(CGPoint: point)
        return animation
    }
    
    //中间空白动画
    static func createScaleAnimation() -> CAAnimationGroup {
        let animation = CABasicAnimation.init(keyPath: "transform.scale")
        animation.duration = 1
        animation.beginTime = 0
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn)
        animation.toValue = NSValue.init(CATransform3D: CATransform3DMakeScale(14/24, 14/24, 1))
        
        let third  = self.goBackScaleAnimation()
        let second = self.saveScaleAnimation()
        
        let group = CAAnimationGroup.init()
        group.removedOnCompletion = false
        group.fillMode = kCAFillModeForwards
        group.animations = [animation,second,third]
        group.duration = 4
        return group
    }
    static func saveScaleAnimation() -> CABasicAnimation{
        let animation = CABasicAnimation.init(keyPath: "transform.scale")
        animation.duration = 1
        animation.beginTime = 1
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn)
        animation.fromValue = NSValue.init(CATransform3D: CATransform3DMakeScale(14/24, 14/24, 1))
        animation.toValue = NSValue.init(CATransform3D: CATransform3DMakeScale(14/24, 14/24, 1))
        return animation
    }
    static func goBackScaleAnimation() -> CABasicAnimation{
        let animation = CABasicAnimation.init(keyPath: "transform.scale")
        animation.duration = 1
        animation.beginTime = 2
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn)
        animation.fromValue = NSValue.init(CATransform3D: CATransform3DMakeScale(14/24, 14/24, 1))
        animation.toValue = NSValue.init(CATransform3D: CATransform3DMakeScale(1, 1, 1))
        return animation
    }
}
