//
//  TagViewItem.swift
//  GitManager
//
//  Created by Антон Текутов on 28.01.2020.
//  Copyright © 2020 Антон Текутов. All rights reserved.
//

import UIKit

public class TagViewItem {
    public var title: String?
    public var titleColor: UIColor?
    public var titleFont: UIFont?

    public var sideImage: UIImage?
    public var sideImageBackgroundColor: UIColor?
    
    public var xButtonDisplaying: Bool = false
    public var xButtonBackgroundColor: UIColor?
    public var xButtonImage: UIImage?

    public var backgroundColor: UIColor?
    
    public init() {}
        
    public convenience init(_ title: String) {
        self.init()
        self.title = title
    }
}
