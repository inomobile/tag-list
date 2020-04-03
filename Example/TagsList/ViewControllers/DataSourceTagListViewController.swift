//
//  DataSourceTagsListViewController.swift
//  TagsListExample
//
//  Created by Антон Текутов on 06.02.2020.
//  Copyright © 2020 Антон Текутов. All rights reserved.
//

import TagsList

class DataSourceTagsListViewController: TagsListTestViewController {
    
    var randomStrings: [String] = [
        "Donec", "consectetur", "metus", "non", "sollicitudin", "condimentum",
        "Cras sodales lobortis neque at scelerisque", "Proin tempor eleifend massa", "Curabitur",
        "semper tortor eget", "vestibulum efficitur", "Vestibulum vel vehicula turpis",
        "Sed sit amet est placerat, pellentesque purus ut, interdum mi", "Donec", "vel",
        "tortor", "mi", "Donec vel sem vel mi hendrerit vestibulum",
        "at", "vel lorem", "Donec malesuada erat tortor, vitae varius lorem mattis sit amet"
    ]
    var items = [TagViewItem]()

    override func setNavigationTitle() {
        navigationItem.title = "DataSourceExample"
    }
    
    // MARK: - Items Generation

    override func setTagsListData() {
        items = randomStrings.compactMap({ TagViewItem($0) })
        for index in 0...items.count {
            if index % 2 == 0 {
                items[index].sideImage = getItemImage(index)
                items[index].backgroundColor = getItemBackgroundColor(index)
            }
        }
        items.insert(createCustomMinecraftItem(), at: items.count / 2)
        
        tagsListView.tagsListDataSource = self
        tagsListView.tagsListDelegate = self
    }
    
    private func createCustomMinecraftItem() -> TagViewItem {
        let item = TagViewItem("Minecraft")
        item.titleFont = UIFont (name: "Copperplate", size: 20)
        item.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        item.sideImage = #imageLiteral(resourceName: "obsidian")
        item.sideImageBackgroundColor = UIColor.clear
        item.xButtonImage = #imageLiteral(resourceName: "diamondPickaxe")
        item.xButtonBackgroundColor = UIColor.clear
        return item
    }
    
    private func getItemImage(_ index: Int) -> UIImage {
        switch index % 5 {
        case 0: 
            return #imageLiteral(resourceName: "sun")
        case 1: 
            return #imageLiteral(resourceName: "neptune")
        case 2: 
            return #imageLiteral(resourceName: "mars")
        case 3: 
            return #imageLiteral(resourceName: "earth")
        default:
            return #imageLiteral(resourceName: "moon")
        }
    }

    private func getItemBackgroundColor(_ index: Int) -> UIColor {
        switch index % 5 {
        case 0: 
            return #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        case 1: 
            return #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        case 2: 
            return #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        case 3: 
            return #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        default: 
            return #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        }
    }
    
    // MARK: - Methods for adding user items

    override func putNewStringTag(tag: String) {
        items.append(TagViewItem(tag))
        tagsListView.insertCellByIndex(self.items.count - 1)
    }

    override func putNewCustomTag(tag: TagViewItem) {
        items.append(tag)
        tagsListView.insertCellByIndex(self.items.count - 1)
    }
}

// MARK: - TagsListDataSource

extension DataSourceTagsListViewController: TagsListDataSource {

    func tagsListItemsCount(_ TagsList: TagsListProtocol) -> Int {
        return items.count
    }

    func tagsListViewItem(_ TagsList: TagsListProtocol, index: Int) -> TagViewItem {
        let item = items[index]
        return item
    }

    func removeTagsListItem(_ index: Int) {
        items.remove(at: index)
    }
    
    func tagsListCellFinalConfiguration(_ TagsList: TagsListProtocol, cell: TagCollectionViewCellProtocol, index: Int) -> TagCollectionViewCellProtocol {
        let item = items[index]
        if item.title == "Minecraft" {
            cell.xButton.layer.cornerRadius = 0
            cell.sideImageView.layer.cornerRadius = 0
            cell.layer.cornerRadius = 0
        }
        return cell
    }
}

// MARK: - TagsListDelegate

extension DataSourceTagsListViewController: TagsListDelegate {
    func tagsListCellTouched(_ TagsList: TagsListProtocol, index: Int) {
        print("\nCell with index: \(index) was touched")
    }

    func tagsListCellXButtonTouched(_ TagsList: TagsListProtocol, index: Int) {
        print("\nxButton from cell with tag index: \(index) was touched")
    }
}
