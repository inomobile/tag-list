//
//  TagViewItemConfigurator.swift
//  GitManager
//
//  Created by Антон Текутов on 29.01.2020.
//  Copyright © 2020 Антон Текутов. All rights reserved.
//

import UIKit

public class TagViewItemConfigurator: TagsListItemConfiguratorProtocol {
    
    public var borderMarginHorizontal: CGFloat = 5
    public var spacing: CGFloat = 2
    public var contentHeight: CGFloat = 25
    public var cellHeight: CGFloat = 30
    public var itemCornerRadius: CGFloat = 12.5
    public var sideImageCornerRadius: CGFloat = 12.5
    public var xButtonCornerRadius: CGFloat = 12.5
    
    public var sideImageEverytimeDisplaying: Bool = false
    public var xButtonEverytimeDisplaying: Bool = false
    public var maxWidth: CGFloat?
    public var titleFont = UIFont.systemFont(ofSize: 17)
    
    public var backgroundColor = UIColor.lightGray
    public var sideImageBackgroundColor: UIColor = .darkGray
    public var xButtonBackgroundColor: UIColor = .white
    public var textColor: UIColor = .white
    
    public var xButtonImage = UIImage(named: "close") ?? UIImage()
}
