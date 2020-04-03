//
//  Delegate&DataSource.swift
//  TagsListExample
//
//  Created by Антон Текутов on 13.02.2020.
//  Copyright © 2020 Антон Текутов. All rights reserved.
//

import UIKit

public protocol TagsListDelegate: class {
    func tagsListCellTouched(_ TagsList: TagsListProtocol, index: Int)
    func tagsListCellXButtonTouched(_ TagsList: TagsListProtocol, index: Int)
}

public protocol TagsListDataSource: class {
    func tagsListItemsCount(_ TagsList: TagsListProtocol) -> Int
    func tagsListViewItem(_ TagsList: TagsListProtocol, index: Int) -> TagViewItem
    func tagsListCellFinalConfiguration(_ TagsList: TagsListProtocol, cell: TagCollectionViewCellProtocol, index: Int) -> TagCollectionViewCellProtocol
    func removeTagsListItem(_ index: Int)
}

extension TagsListDataSource {
    public func tagsListCellFinalConfiguration(_ TagsList: TagsListProtocol, cell: TagCollectionViewCellProtocol, index: Int) -> TagCollectionViewCellProtocol {
        return cell
    }
}

