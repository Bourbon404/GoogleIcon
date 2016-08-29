//
//  ViewController.swift
//  GoogleIcon
//
//  Created by ZhengWei on 16/8/29.
//  Copyright © 2016年 Bourbon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let icon = GoogleIcon.init(frame: CGRect.init(origin: CGPointZero, size: CGSizeMake(640, 74)))
        icon.center = self.view.center;
        self.view.addSubview(icon)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

