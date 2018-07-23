//
//  File.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/4/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

protocol PrintestLayoutDelegate {
    func collectionView(collectionView: UICollectionView, weightForPhotoAtIndexPath indexPath: NSIndexPath) -> CGFloat
    func getNumberOfRow() -> Int
}

class PinterestLayoutHorizontal: UICollectionViewLayout {
    let attributeArray = NSMutableDictionary()
    var contentSize: CGSize!
    var delegate: PrintestLayoutDelegate!
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepare()
    {
        super.prepare()
        self.attributeArray.removeAllObjects()
        let numberOfColumn: Int = self.delegate.getNumberOfRow();
        let padding: CGFloat = 15.0;
        
        let collectionViewHeight = self.collectionView?.frame.size.height
        let itemWidth: CGFloat = (collectionViewHeight! - padding * CGFloat((numberOfColumn + 1))) / CGFloat(numberOfColumn)
        var contentWidth: CGFloat = 0.0;
        var columnArray = [CGFloat](repeating: 0.0, count: numberOfColumn);
        
        for i in 0 ... (self.collectionView?.numberOfItems(inSection: 0))! - 1 {
            var tempX: CGFloat = 0.0
            var tempY: CGFloat = 0.0
            let indexPath = NSIndexPath(item: i, section: 0)
            let itemHeight: CGFloat = delegate.collectionView(collectionView: (self.collectionView)!, weightForPhotoAtIndexPath: indexPath)
            
            var minHeight: CGFloat = 0.0;
            var minIndex: Int = 0;
            
            if (numberOfColumn > 0) {
                minHeight = columnArray[0]
            }
            for colIndex in 0..<numberOfColumn {
                if (minHeight > columnArray[colIndex]) {
                    minHeight = columnArray[colIndex]
                    minIndex = colIndex
                }
            }
            
            tempX = padding + (itemWidth + padding) * CGFloat(minIndex);
            tempY = minHeight + padding;
            columnArray[minIndex] = tempY + itemHeight;
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath as IndexPath);
            attributes.frame = CGRect(x: tempY, y: tempX, width: itemHeight, height: itemWidth);
            self.attributeArray.setObject(attributes, forKey: indexPath)
            
            
            let newContentHeight: CGFloat = tempY + padding + itemHeight + padding;
            if (newContentHeight > contentWidth) {
                contentWidth = newContentHeight;
            }
        }
        
        self.contentSize = CGSize(width: contentWidth, height: (self.collectionView?.frame.size.height)! - 100);
    }
    
    override var collectionViewContentSize: CGSize
    {
        return self.contentSize
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attributes in self.attributeArray {
            if (attributes.value as! UICollectionViewLayoutAttributes).frame.intersects(rect) {
                layoutAttributes.append((attributes.value as! UICollectionViewLayoutAttributes))
            }
        }
        return layoutAttributes
    }
}
