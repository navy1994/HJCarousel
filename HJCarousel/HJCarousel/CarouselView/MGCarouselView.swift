//
//  MGCarouselView.swift
//  SwiftDemo
//
//  Created by haijun on 2018/6/25.
//  Copyright © 2018年 wondertex. All rights reserved.
//

import UIKit

class MGCarouselView: UIView {
    
    typealias ClickCarouselBlock = (_ clickIndex:NSInteger)->()
    
    var clickBlock:ClickCarouselBlock!
    
    var items:Array<Any>?
    var collectionView:UICollectionView?
    var flowLayout:MGFlowLayout?
    
    var timer:Timer?
    var currentIndex:Int?
    var width:CGFloat?
    var edge:CGFloat?
    var offsetX:CGFloat?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initCollectionView()
    }
    
    
    func initCollectionView(){
        currentIndex = 0
        
        flowLayout = MGFlowLayout()
        flowLayout?.minimumLineSpacing = 0
        flowLayout?.itemSize = CGSize(width: self.frame.size.width-150, height: self.frame.size.height)
        width = self.frame.size.width
        edge = self.frame.size.width/2.0-(flowLayout?.itemSize.width)!/2.0
        
        collectionView = UICollectionView(frame: self.frame, collectionViewLayout: flowLayout!)
        collectionView?.backgroundColor = UIColor.white
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.dataSource = self as UICollectionViewDataSource
        collectionView?.delegate = self as UICollectionViewDelegate
        collectionView?.scrollsToTop = false
        collectionView?.contentInset = UIEdgeInsets(top: 0, left: self.edge!, bottom: 0, right: self.edge!)
        collectionView?.register(MGCarouselCell.classForCoder(), forCellWithReuseIdentifier: "cellId")
        self.addSubview(collectionView!)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension MGCarouselView:UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let _ = clickBlock{
            clickBlock(indexPath.row)
        }
    }
}
