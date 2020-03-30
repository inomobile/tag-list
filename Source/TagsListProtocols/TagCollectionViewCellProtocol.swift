//
//  TagCollectionViewCellProtocol.swift
//  TagsListExample
//
//  Created by Антон Текутов on 13.02.2020.
//  Copyright © 2020 Антон Текутов. All rights reserved.
//

import UIKit

public protocol TagCollectionViewCellDelegate: class {
    var itemsConfiguration: TagsListItemConfiguratorProtocol { get set }
    
    func xButtonPressed(_ cell: UICollectionViewCell)
}

public protocol TagCollectionViewCellProtocol: UICollectionViewCell {
    var stack: UIStackView { get }
    var label: UILabel { get }
    var sideImageView: UIImageView { get }
    var xButton: UIButton { get }
}

public protocol TagCollectionViewCellConfigurationProtocol {
	func setup(cellDelegate: TagCollectionViewCellDelegate, tagViewItem: TagViewItem)
}
