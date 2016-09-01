//
//  WhitePlaceLayer.swift
//  GoogleIcon
//
//  Created by ZhengWei on 16/8/29.
//  Copyright © 2016年 Bourbon. All rights reserved.
//

import UIKit

class WhitePlaceLayer: CALayer {

    override init() {
        super.init()
        self.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.2).CGColor
        self.masksToBounds = true
        self.cornerRadius = 37
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
