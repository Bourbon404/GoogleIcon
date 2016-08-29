//
//  CircleLayer.swift
//  GoogleIcon
//
//  Created by ZhengWei on 16/8/29.
//  Copyright © 2016年 Bourbon. All rights reserved.
//

import UIKit
class CircleLayer: CALayer {
    
    override init() {
        super.init()
        self.frame = CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: 14, height: 14))
        self.cornerRadius = 7
        self.masksToBounds = true
    }
    
    override init(layer: AnyObject) {
        super.init(layer: layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
