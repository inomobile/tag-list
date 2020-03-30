//
//  TagsListTableViewCell.swift
//  TagsListExample
//
//  Created by Антон Текутов on 07.02.2020.
//  Copyright © 2020 Антон Текутов. All rights reserved.
//

import UIKit
import TagsList

class TagsListTableViewCell: UITableViewCell {

    var tagsListView = TagsList()
    let label = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
		setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(tagsListView)
        tagsListView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            label.widthAnchor.constraint(equalToConstant: 20),
            label.heightAnchor.constraint(equalToConstant: 20),
            tagsListView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            tagsListView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            tagsListView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
        ])
        tagsListView.itemsConfiguration.backgroundColor = .purple
        tagsListView.itemsConfiguration.sideImageEverytimeDisplaying = false
        tagsListView.itemsConfiguration.xButtonEverytimeDisplaying = true
        tagsListView.itemsConfiguration.maxWidth = contentView.frame.width * 0.9
        tagsListView.itemsConfiguration.borderMarginHorizontal = 10
        tagsListView.contentOrientation = .verticalScrollable
        tagsListView.backgroundColor = .white
    }

    func setTags(_ tags: [String], height: CGFloat) {
        let dataSource = DefaultTagsListDataSource(tagsListView)
        dataSource.setTags(tags)
        label.text = "\(tags.count)"
        tagsListView.heightForVerticalContentOrientation = height
    }
    
    func calculateHeight(_ items: [String]) -> CGFloat {
        let height = tagsListView.calculateHeightForItems(items, width: contentView.frame.width - 60) + 20
        return height
    }
}
