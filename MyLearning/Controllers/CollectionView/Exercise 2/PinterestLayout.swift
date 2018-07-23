//
//  PinterestLayout.swift
//  MyLearning
//
//  Created by Hien Nguyen on 5/3/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//

import UIKit

protocol PinterestLayoutDelegate {
    
    func collectionCustomView(collectionView: UICollectionView, heightForItemAtIndexPath indexPath: NSIndexPath,
                              withWidth: CGFloat) -> CGFloat
    
    func collectionCustomView(collectionView: UICollectionView,
                              heightForAnnotationAtIndexPath indexPath: NSIndexPath, withWidth width: CGFloat) -> CGFloat
}

class PinterestLayout: UICollectionViewLayout {
    
    var delegate: PinterestLayoutDelegate!
    
    var numberOfColumns = 3
    var cellPadding: CGFloat = 6.0
    
    private var cache = [UICollectionViewLayoutAttributes]()
    
    private var contentHeight: CGFloat = 0.0
    private var contentWidth: CGFloat {
        let insets = collectionView!.contentInset
        return UIScreen.main.bounds.width - (insets.left + insets.right)
    }
    
    override func prepare() {
        
        if cache.isEmpty {
            
            let columnWidth = contentWidth / CGFloat(numberOfColumns)
            var xOffset = [CGFloat]()
            for column in 0 ..< numberOfColumns {
                xOffset.append(CGFloat(column) * columnWidth)
            }
            var column = 0
            var yOffset = [CGFloat](repeating: 0, count: numberOfColumns)
            
//       Tính toán kích thước và vị trí của từng cell trong CollectionView
            for item in 0 ..< collectionView!.numberOfItems(inSection: 0) {
                
                let indexPath = NSIndexPath(item: item, section: 0)
                
                let width = columnWidth - cellPadding * 2
                let itemHeight = delegate.collectionCustomView(collectionView: collectionView!, heightForItemAtIndexPath: indexPath,
                                                               withWidth: width)
                let annotationHeight = delegate.collectionCustomView(collectionView: collectionView!,
                                                                     heightForAnnotationAtIndexPath: indexPath, withWidth: width)
                
                
                
                let height = cellPadding + itemHeight + annotationHeight + cellPadding
                let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
                let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
                
                //Bổ sung  cell mới
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath as IndexPath)
                attributes.frame = insetFrame
                cache.append(attributes)
                
                //Tính toán lại chiều cao Content Size của CollectionView
                contentHeight = max(contentHeight, frame.maxY)
                yOffset[column] = yOffset[column] + height
                
                column = column >= (numberOfColumns - 1) ? 0 : column + 1
            }
        }
    }
    
    override var collectionViewContentSize: CGSize {
//        Trả về ContentSize của CollectionView dựa vào cache đã được tính toán ở hàm prepare
        return CGSize(width: contentWidth, height: contentHeight)
    }
//    Xác định các cell sẽ được hiển trên khung nhìn của CollectionView khi được scroll tới
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {    
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
//        Duyệt các đối tượng trong attributes để tìm ra các cell nằm trong khung nhìn rect
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                layoutAttributes.append(attributes)
            }
        }
        return layoutAttributes
    }
}


