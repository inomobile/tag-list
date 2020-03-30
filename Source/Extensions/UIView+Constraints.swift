//
//  UIView+Constraints.swift
//  GitManager
//
//  Created by Антон Текутов on 11.12.2019.
//  Copyright © 2019 Антон Текутов. All rights reserved.
//

import UIKit

extension UIView {
    func setMargin(left: CGFloat, top: CGFloat, right: CGFloat, bottom: CGFloat) {
        if let sup = superview {
            NSLayoutConstraint.activate([
                leftAnchor.constraint(equalTo: sup.leftAnchor, constant: left),
                topAnchor.constraint(equalTo: sup.topAnchor, constant: top),
                rightAnchor.constraint(equalTo: sup.rightAnchor, constant: -right),
                bottomAnchor.constraint(equalTo: sup.bottomAnchor, constant: -bottom)
            ])
        }
    }
    
    func setMargin(horizontal: CGFloat, vertical: CGFloat) {
        setMargin(left: horizontal, top: vertical, right: horizontal, bottom: vertical)
    }
    
    func setMargin(_ all: CGFloat) {
        setMargin(horizontal: all, vertical: all)
    }
    
    func setMargin(baseView: UILayoutGuide?, left: CGFloat, top: CGFloat, right: CGFloat, bottom: CGFloat) {
        if let sup = baseView {
            NSLayoutConstraint.activate([
                leftAnchor.constraint(equalTo: sup.leftAnchor, constant: left),
                topAnchor.constraint(equalTo: sup.topAnchor, constant: top),
                rightAnchor.constraint(equalTo: sup.rightAnchor, constant: -right),
                bottomAnchor.constraint(equalTo: sup.bottomAnchor, constant: -bottom)
            ])
        }
    }
    
    func setMargin(baseView: UILayoutGuide?, horizontal: CGFloat, vertical: CGFloat) {
        setMargin(baseView: baseView, left: horizontal, top: vertical, right: horizontal, bottom: vertical)
    }
    
    func setMargin(baseView: UILayoutGuide?, _ all: CGFloat) {
        setMargin(baseView: baseView, horizontal: all, vertical: all)
    }
    
    func setMargin(baseView: UIView?, left: CGFloat, top: CGFloat, right: CGFloat, bottom: CGFloat) {
        if let sup = baseView {
            NSLayoutConstraint.activate([
                leftAnchor.constraint(equalTo: sup.leftAnchor, constant: left),
                topAnchor.constraint(equalTo: sup.topAnchor, constant: top),
                rightAnchor.constraint(equalTo: sup.rightAnchor, constant: -right),
                bottomAnchor.constraint(equalTo: sup.bottomAnchor, constant: -bottom)
            ])
        }
    }
    
    func setMargin(baseView: UIView?, horizontal: CGFloat, vertical: CGFloat) {
        setMargin(baseView: baseView, left: horizontal, top: vertical, right: horizontal, bottom: vertical)
    }
    
    func setMargin(baseView: UIView?, _ all: CGFloat) {
        setMargin(baseView: baseView, horizontal: all, vertical: all)
    }
}
