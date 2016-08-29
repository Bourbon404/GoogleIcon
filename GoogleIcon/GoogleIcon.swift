//
//  GoogleIcon.swift
//  GoogleIcon
//
//  Created by ZhengWei on 16/8/29.
//  Copyright © 2016年 Bourbon. All rights reserved.
//

import UIKit
class GoogleIcon: UIView {
    
    lazy var triangleButton:ButtonView = {
        let triangle = ButtonView.init(type: ButtonType.Triangle)
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(self.clickButtonView(_:)))
        triangle.userInteractionEnabled = true
        triangle.addGestureRecognizer(tapGesture)
        return triangle
    }()
    
    lazy var circleButton:ButtonView = {
        let circle = ButtonView.init(type: ButtonType.Circle)
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(self.clickButtonView(_:)))
        circle.userInteractionEnabled = true
        circle.addGestureRecognizer(tapGesture)

        return circle
    }()
    
    lazy var squareButton:ButtonView = {
        let square = ButtonView.init(type: ButtonType.Square)
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(self.clickButtonView(_:)))
        square.userInteractionEnabled = true
        square.addGestureRecognizer(tapGesture)
        return square
    }()
    
    lazy var upCircleLayer:CircleLayer = {
        let circle = CircleLayer.init()
        circle.backgroundColor = UIColor.init(red: 232/255.0, green: 62/255.0, blue: 74/255.0, alpha: 1).CGColor
        return circle
    }()
    
    lazy var downCircleLayer:CircleLayer = {
        let circle = CircleLayer.init()
        circle.backgroundColor = UIColor.init(red: 242/255.0, green: 192/255.0, blue: 59/255.0, alpha: 1).CGColor
        return circle
    }()
    
    lazy var leftCircleLayer:CircleLayer = {
        let circle = CircleLayer.init()
        circle.backgroundColor = UIColor.init(red: 48/255.0, green: 108/255.0, blue: 182/255.0, alpha: 1).CGColor
        return circle
    }()
    
    lazy var rightCircleLayer:CircleLayer = {
        let circle = CircleLayer.init()
        circle.backgroundColor = UIColor.init(red: 33/255.0, green: 172/255.0, blue: 67/255.0, alpha: 1).CGColor
        return circle
    }()
    
    lazy var whiteLayer:WhitePlaceLayer = {
        let white = WhitePlaceLayer.init()
        return white
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.darkGrayColor()
        
        //添加四个圆圈
        let centerPoint = self.center;
        let tmpSpace:CGFloat = 12.0
        
        self.upCircleLayer.position = CGPointMake(centerPoint.x,centerPoint.y-tmpSpace);
        self.layer.addSublayer(self.upCircleLayer)
        
        self.downCircleLayer.position = CGPointMake(centerPoint.x, centerPoint.y+tmpSpace)
        self.layer.addSublayer(self.downCircleLayer)
        
        self.leftCircleLayer.position = CGPointMake(centerPoint.x-tmpSpace, centerPoint.y)
        self.layer.addSublayer(self.leftCircleLayer)
        
        self.rightCircleLayer.position = CGPointMake(centerPoint.x+tmpSpace, centerPoint.y)
        self.layer.addSublayer(self.rightCircleLayer)
        
        //添加中间白色浮层
        self.layer.addSublayer(self.whiteLayer)
        
        //创建三个按钮
        self.triangleButton.center = CGPointMake(frame.width/4, frame.height/2)
        self.addSubview(self.triangleButton)
        
        self.circleButton.center = CGPointMake((frame.width/4) * 2, frame.height/2)
        self.addSubview(self.circleButton)
        
        self.squareButton.center = CGPointMake((frame.width/4) * 3, frame.height/2);
        self.addSubview(self.squareButton)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //点击和长按方法
    func clickButtonView(view:ButtonView) {

        
        self.moveCircle()
    }
    
    func longPressButtonView(view:ButtonView) {
        
    }
    
    //移动四个圆圈
    func moveCircle(){
        self.upCircleLayer.addAnimation(CirlceAnimationManager.createAnimation(self.upCircleLayer.position, type: PositionType.up), forKey: "up")
        self.downCircleLayer.addAnimation(CirlceAnimationManager.createAnimation(self.downCircleLayer.position, type: PositionType.down), forKey: "down")
        self.leftCircleLayer.addAnimation(CirlceAnimationManager.createAnimation(self.leftCircleLayer.position, type: PositionType.left), forKey: "left")
        self.rightCircleLayer.addAnimation(CirlceAnimationManager.createAnimation(self.rightCircleLayer.position, type: PositionType.right), forKey: "right")
        self.circleButton.layer.addAnimation(CirlceAnimationManager.createScaleAnimation(), forKey: "scale")
        
    }

    
}
