//
//  UIViewController+KeyboardHiding.swift
//  GitManager
//b

//  Created by Антон Текутов on 18.12.2019.
//  Copyright © 2019 Антон Текутов. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
