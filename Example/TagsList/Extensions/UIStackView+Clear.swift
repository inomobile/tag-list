//
//  UIStackView+Clear.swift
//  TagsListExample
//
//  Created by Антон Текутов on 18.02.2020.
//  Copyright © 2020 Антон Текутов. All rights reserved.
//

import UIKit

extension UIStackView {

    func removeAllArrangedSubviews() {
        for item in arrangedSubviews {
            removeArrangedSubview(item)
            item.removeFromSuperview()
        }
    }
}

