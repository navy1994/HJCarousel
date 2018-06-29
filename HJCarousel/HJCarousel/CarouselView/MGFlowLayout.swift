//
//  MGFlowLayout.swift
//  SwiftDemo
//
//  Created by haijun on 2018/6/25.
//  Copyright © 2018年 wondertex. All rights reserved.
//

import UIKit

class MGFlowLayout: UICollectionViewFlowLayout {

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true;
    }
    
    override func prepare() {
        super.prepare()
        self.collectionView?.decelerationRate = UIScrollViewDecelerationRateFast;
        self.scrollDirection = .horizontal;
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        var offSetAdjustment:CGFloat = CGFloat(MAXFLOAT)
        
        let horizotalCenter = proposedContentOffset.x + (self.collectionView?.bounds.size.width)! / 2
        
        let targetRect:CGRect = CGRect(x: proposedContentOffset.x, y: 0, width: (self.collectionView?.bounds.size.width)!, height: (self.collectionView?.bounds.size.height)!)
        
        let array = super.layoutAttributesForElements(in: targetRect)
        
        for attributes in array! {
            let currentCenterX = attributes.center.x
            
            if CGFloat(abs(currentCenterX-horizotalCenter))<CGFloat(abs(offSetAdjustment)){
                offSetAdjustment = CGFloat(currentCenterX-horizotalCenter)
            }
        }
        
        return CGPoint(x: proposedContentOffset.x+offSetAdjustment, y: proposedContentOffset.y)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let arr = super.layoutAttributesForElements(in: rect)
        
        let centerX = (self.collectionView?.contentOffset.x)! + (self.collectionView?.frame.size.width)!*0.5
        
        for attributes in arr! {
            let gapX:CGFloat = CGFloat(abs(attributes.center.x - centerX))
            
            let scale = 1 - gapX / (self.collectionView?.frame.size.width)!*0.3
            
            attributes.transform = CGAffineTransform(scaleX: scale, y: scale);
            
        }
        return arr
    }
}
