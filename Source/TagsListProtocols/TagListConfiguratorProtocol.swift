//
//  TagsListConfiguratorProtocol.swift
//  TagsListExample
//
//  Created by Антон Текутов on 13.02.2020.
//  Copyright © 2020 Антон Текутов. All rights reserved.
//

import UIKit

public protocol TagsListItemConfiguratorProtocol {
    
    var borderMarginHorizontal: CGFloat { get set }
    var spacing: CGFloat { get set }
    var contentHeight: CGFloat { get set }
    var cellHeight: CGFloat { get set }
    var itemCornerRadius: CGFloat { get set }
    var sideImageCornerRadius: CGFloat { get set }
    var xButtonCornerRadius: CGFloat { get set }
    
    var maxWidth: CGFloat? { get set }
    var sideImageEverytimeDisplaying: Bool { get set }
    var xButtonEverytimeDisplaying: Bool { get set }
    var titleFont: UIFont { get set }
    
    var backgroundColor: UIColor { get set }
    var sideImageBackgroundColor: UIColor { get set }
    var xButtonBackgroundColor: UIColor { get set }
    var textColor: UIColor { get set }
    
    var xButtonImage: UIImage { get set }
}

