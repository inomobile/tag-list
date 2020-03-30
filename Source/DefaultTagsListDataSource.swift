//
//  DefaultTagsListDataSource.swift
//  TagsListExample
//
//  Created by Антон Текутов on 17.02.2020.
//  Copyright © 2020 Антон Текутов. All rights reserved.
//

import Foundation

public class DefaultTagsListDataSource {
    
    private let TagsList: TagsListProtocol
    private var items = [TagViewItem]()
    var tagsCount: Int {
        return items.count
    }
    
    public init(_ TagsList: TagsListProtocol) {
        self.TagsList = TagsList
        TagsList.TagsListDataSource = self
    }
    
    // MARK: - Array actions encapsulation
    
    public func getTagByIndex(_ index: Int) -> TagViewItem? {
        if index >= 0 && index <= items.count {
            return items[index]
        } else {
            return nil
        }
    }
    
    public func appendTag(_ newElement: TagViewItem) {
        items.append(newElement)
        TagsList.insertCellByIndex(items.count - 1)
    }
    
    public func insertTag(_ newElement: TagViewItem, at: Int) {
        if at >= 0 && at <= items.count {
            items.insert(newElement, at: at)
            TagsList.insertCellByIndex(at)
        }
    }	
    
    public func setTags(_ itemsArray: [TagViewItem]) {
        items = itemsArray
        TagsList.reloadCollectionData()
    }
    
    public func removeTag(at: Int) {
        if at >= 0 && at < items.count {
            items.remove(at: at)
            TagsList.removeCellByIndex(at)
        }
    }
    
    public func removeAllTags() {
        items.removeAll()
        TagsList.reloadCollectionData()
    }
}

// MARK: - Actions with string items 

extension DefaultTagsListDataSource {
    
    public func appendTag(_ newElement: String) {
        appendTag(TagViewItem(newElement))
    }
    
    public func setTags(_ itemsArray: [String]) {
        items.removeAll()
        items = itemsArray.compactMap({ TagViewItem($0) })
        TagsList.reloadCollectionData()
    }
    
    public func insertTag(_ newElement: String, at: Int) {
        insertTag(TagViewItem(newElement), at: at)
    }
}

// MARK: - TagsListDataSource 

extension DefaultTagsListDataSource: TagsListDataSource {
    public func tagsListItemsCount(_ TagsList: TagsListProtocol) -> Int {
        return items.count
    }
    
    public func tagsListViewItem(_ TagsList: TagsListProtocol, index: Int) -> TagViewItem {
        let item = items[index]
        return item
    }
    
    public func removeTagsListItem(_ index: Int) {
        items.remove(at: index)
    }
}
