//
//  ViewController.swift
//  TagsListExample
//
//  Created by Антон Текутов on 30.01.2020.
//  Copyright © 2020 Антон Текутов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let stack = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        view.backgroundColor = .white
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 30
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            stack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
        ])
        
        setupTitle()
        setupButtons()
    }
    
    private func setupTitle() {
        let substack = UIStackView()
        substack.axis = .vertical
        substack.alignment = .center
        stack.addArrangedSubview(substack)

        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TagsList"
        label.font = label.font.withSize(36)
        substack.addArrangedSubview(label)

        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Example"
        label.font = label.font.withSize(36)
        substack.addArrangedSubview(label)
    }

    private func setupButtons() {
        var button = UIButton()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.backgroundColor = .purple
        button.layer.cornerRadius = 20
        button.setTitle("DataSource Example", for: .normal)
        button.addTarget(self, action: #selector(openDataSourceExample), for: .touchUpInside)
        stack.addArrangedSubview(button)

        button = UIButton()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.backgroundColor = .purple
        button.layer.cornerRadius = 20
        button.setTitle("Array Example", for: .normal)
        button.addTarget(self, action: #selector(openArrayExample), for: .touchUpInside)
        stack.addArrangedSubview(button)

        button = UIButton()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.backgroundColor = .purple
        button.layer.cornerRadius = 20
        button.setTitle("TableView Example", for: .normal)
        button.addTarget(self, action: #selector(openTableViewExample), for: .touchUpInside)
        stack.addArrangedSubview(button)
    }

    @objc func openDataSourceExample() {
        navigationController?.pushViewController(DataSourceTagsListViewController(), animated: true)
    }

    @objc func openArrayExample() {
        navigationController?.pushViewController(ArrayTagsListViewController(), animated: true)
    }

    @objc func openTableViewExample() {
        navigationController?.pushViewController(TagsListTestTableViewController(), animated: true)
    }
}
