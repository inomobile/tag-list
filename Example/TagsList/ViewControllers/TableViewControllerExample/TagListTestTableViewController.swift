//
//  TagsListTestTableViewController.swift
//  TagsListExample
//
//  Created by Антон Текутов on 07.02.2020.
//  Copyright © 2020 Антон Текутов. All rights reserved.
//

import UIKit

class TagsListTestTableViewController: UITableViewController {

    let randomStrings: [String] = [
        "Donec", "consectetur", "metus", "non", "sollicitudin", "condimentum",
        "Cras sodales lobortis neque at scelerisque", "Proin tempor eleifend massa", "Curabitur",
        "semper tortor eget", "vestibulum efficitur", "Vestibulum vel vehicula turpis",
        "Sed sit amet est placerat, pellentesque purus ut, interdum mi", "Donec", "vel",
        "tortor", "mi", "Donec vel sem vel mi hendrerit vestibulum",
        "at", "vel lorem", "Donec malesuada erat tortor, vitae varius lorem mattis sit amet"
    ]
    
    var cellsHeight: [CGFloat?]?

    override func viewDidLoad() {
        super.viewDidLoad()

        cellsHeight = [CGFloat?](repeating: nil, count: randomStrings.count)
        tableView.register(TagsListTableViewCell.self, forCellReuseIdentifier: "cellTagCollectionView")
        tableView.allowsSelection = false
        
        let button = UIBarButtonItem(title: "reload", style: .done, target: self, action: #selector(buttonAction))
        navigationItem.rightBarButtonItem = button
    }

    @objc func buttonAction() {
        tableView.reloadData()
    }
    
    func getItemsFromIndex(_ cellIndex: Int) -> [String] {
        var tags = [String]()
        for index in 0...cellIndex {
            tags.append(randomStrings[index])
        }
        return tags
    }

    // MARK: - Table view data source
	
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomStrings.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTagCollectionView", for: indexPath) as? TagsListTableViewCell ?? TagsListTableViewCell()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let tagViewCell = cell as? TagsListTableViewCell {
            tagViewCell.setTags(getItemsFromIndex(indexPath.row), height: (cellsHeight?[indexPath.row] ?? 20) - 20)
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let height = cellsHeight?[indexPath.row] {
            return height
        } else {
            let cellExample = TagsListTableViewCell()
            let height = cellExample.tagsListView.calculateHeightForItems(getItemsFromIndex(indexPath.row), width: UIScreen.main.bounds.width - 60) + 20
            cellsHeight?[indexPath.row] = ceil(height)
            return ceil(height)
        }
    }
}
