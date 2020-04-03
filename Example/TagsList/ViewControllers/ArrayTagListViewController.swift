//
//  ArrayTagsListViewController.swift
//  TagsListExample
//
//  Created by Антон Текутов on 06.02.2020.
//  Copyright © 2020 Антон Текутов. All rights reserved.
//

import UIKit
import TagsList

class ArrayTagsListViewController: TagsListTestViewController {

    var randomStrings: [String] = [
        "Donec", "consectetur", "metus", "non", "sollicitudin", "condimentum",
        "Cras sodales lobortis neque at scelerisque", "Proin tempor eleifend massa", "Curabitur",
        "semper tortor eget", "vestibulum efficitur", "Vestibulum vel vehicula turpis",
        "Sed sit amet est placerat, pellentesque purus ut, interdum mi", "Donec", "vel",
        "tortor", "mi", "Donec vel sem vel mi hendrerit vestibulum",
        "at", "vel lorem", "Donec malesuada erat tortor, vitae varius lorem mattis sit amet"
    ]
    var dataSource: DefaultTagsListDataSource!

    override func setNavigationTitle() {
        navigationItem.title = "DataSourceExample"
    }

    override func setTagsListData() {
        dataSource = DefaultTagsListDataSource(tagsListView)
        dataSource.setTags(randomStrings)

        tagsListView.tagsListDelegate = self
    }

    override func putNewStringTag(tag: String) {
        dataSource.appendTag(tag)
    }

    override func putNewCustomTag(tag: TagViewItem) {
        dataSource.appendTag(tag)
    }
}

extension ArrayTagsListViewController: TagsListDelegate {
    func tagsListCellTouched(_ TagsList: TagsListProtocol, index: Int) {
        print("\nCell with index: \(index) was touched")
    }

    func tagsListCellXButtonTouched(_ TagsList: TagsListProtocol, index: Int) {
        print("\nxButton from cell with tag index: \(index) was touched")
    }
}
