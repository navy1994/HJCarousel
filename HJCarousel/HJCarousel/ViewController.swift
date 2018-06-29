//
//  ViewController.swift
//  HJCarousel
//
//  Created by haijun on 2018/6/29.
//  Copyright © 2018年 wondertex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "广告"
        
        self.view.backgroundColor = UIColor.gray
        
        let carouselView = MGCarouselView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200))
        carouselView.clickBlock = { (clickIndex) in
            print("点击了第\(clickIndex)个")
        }
        self.view.addSubview(carouselView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

