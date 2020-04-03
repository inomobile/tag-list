//
//  TagsListProtocol.swift
//  TagsListExample
//
//  Created by Антон Текутов on 13.02.2020.
//  Copyright © 2020 Антон Текутов. All rights reserved.
//

import UIKit

public enum ContentOrientation { case horizontal, verticalScrollable, verticalSizeToFit }

public protocol TagsListProtocol: UIView {    
    var tagsListDataSource: TagsListDataSource? { get set }
    var tagsListDelegate: TagsListDelegate? { get set }
    var itemsConfiguration: TagsListItemConfiguratorProtocol { get set }
    
    var minimumInteritemSpacing: CGFloat { get set }
    var minimumLineSpacing: CGFloat { get set }
    var contentOrientation: ContentOrientation { get set }
    var heightForVerticalContentOrientation: CGFloat? { get set }
    
    func insertCellByIndex(_ index: Int)
    func removeCellByIndex(_ index: Int)
    
    func reloadCollectionData()

    func calculateHeightForItems(_ items: [TagViewItem], width: CGFloat) -> CGFloat
    func calculateHeightForItems(_ items: [String], width: CGFloat) -> CGFloat
}
