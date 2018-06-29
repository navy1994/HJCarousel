//
//  MGCarouselCell.swift
//  SwiftDemo
//
//  Created by haijun on 2018/6/25.
//  Copyright © 2018年 wondertex. All rights reserved.
//

import UIKit
import SnapKit

class MGCarouselCell: UICollectionViewCell {

    lazy var aImageView:UIImageView = {
        let imageV = UIImageView()
        imageV.image = UIImage(named: "kt")
        return imageV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //self.backgroundColor = UIColor.red
        
        self.addSubview(aImageView)
        
        aImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
            make.height.equalTo(100)
            make.centerY.equalTo(self)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
