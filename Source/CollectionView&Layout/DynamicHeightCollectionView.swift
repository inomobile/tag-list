//
//  DynamicHeightCollectionView.swift
//  TagsListExample
//
//  Created by Антон Текутов on 04.02.2020.
//  Copyright © 2020 Антон Текутов. All rights reserved.
//

import UIKit

class DynamicHeightCollectionView: UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }
}
