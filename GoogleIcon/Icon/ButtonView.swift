//
//  ButtonView.swift
//  GoogleIcon
//
//  Created by ZhengWei on 16/8/29.
//  Copyright © 2016年 Bourbon. All rights reserved.
//

import UIKit

/**
 按钮图层的形状
 
 - Triangle: 左侧三角形
 - Circle:   中间圆形
 - Square:   右边方形
 */
enum ButtonType {
    case Triangle
    case Circle
    case Square
}
class ButtonView: UIView {
    var buttonType:ButtonType
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        let context = UIGraphicsGetCurrentContext()
        UIColor.whiteColor().setFill()
        
        switch buttonType {
        case .Triangle:
            CGContextMoveToPoint(context, rect.size.width/2, rect.size.height/2);
            CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
            CGContextAddLineToPoint(context, rect.size.width, 0);
            CGContextClosePath(context)
            break
        case .Circle:
            CGContextAddArc(context, rect.size.width/2, rect.size.height/2, rect.size.width/2, 0, CGFloat(M_PI*2), 1)
            break
        case .Square:
            CGContextAddRect(context, rect)
            break
        default: break
            
        }
        
        CGContextFillPath(context);
        
    }
 
    init(type:ButtonType){
        buttonType = type;
        var rect = CGRect.init(origin: CGPointZero, size: CGSizeMake(24, 24))
        if buttonType == .Triangle {
            rect = CGRect.init(x: 0, y: 0, width: 1.732 * 24, height: 24)
        }
        
        super.init(frame:rect)
        self.backgroundColor = UIColor.clearColor();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
