//
//  CreateCustomItemViewController.swift
//  TagsListExample
//
//  Created by Антон Текутов on 05.02.2020.
//  Copyright © 2020 Антон Текутов. All rights reserved.
//

import UIKit
import TagsList

class CustomItemViewController: UIViewController {
    var putNewCustomItem: ((_ newItem: TagViewItem) -> Void)?

    private let stack = UIStackView()
    private let color = UIColor.purple
    private let titleTextField = UITextField()
    private let backgroundColorView = UIView()
    private let titleColorView = UIView()
    private let imageColorView = UIView()
    private let buttonColorView = UIView()
    private let sideImageView = UIButton()
    private let xButtonImageView = UIButton()
    private let xButtonSwitch = UISwitch()
    private lazy var xButtonImagePicker = ImagePicker()
    private lazy var sideImageImagePicker = ImagePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        xButtonImagePicker.delegate = self
        sideImageImagePicker.delegate = self
        
        navigationItem.title = "Create custom item"
        view.backgroundColor = .white
        hideKeyboardWhenTappedAround()
        
        setupStackAndScroll()
        setupTitleInput()
        setupColorInputs()
        setupImagesInputs()
        setupOtherInputs()
        setupSubmitButton()
    }
    
    private func setupStackAndScroll() {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scroll)
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scroll.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        scroll.addSubview(stack)
        stack.setMargin(30)
        stack.centerXAnchor.constraint(equalTo: scroll.centerXAnchor).isActive = true
        stack.widthAnchor.constraint(equalTo: scroll.widthAnchor, multiplier: 0.8).isActive = true
    }
    
    private func setupTitleInput() {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Create custom item"
        label.textAlignment = .center
        label.textColor = color
        stack.addArrangedSubview(label)
        
        label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "Title"
        label.textColor = color
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(titleTextField)
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 30))
        leftView.backgroundColor = .clear
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.leftView = leftView
        titleTextField.leftViewMode = .always
        titleTextField.contentVerticalAlignment = .center
        titleTextField.layer.borderColor = color.cgColor
        titleTextField.layer.cornerRadius = 15
        titleTextField.layer.borderWidth = 2
        titleTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        titleTextField.placeholder = "Type tag titel here"
        titleTextField.returnKeyType = .done
    }
    
    private func setupColorInputs() {
        var substack = UIStackView()
        substack.axis = .horizontal
        substack.spacing = 10
        stack.addArrangedSubview(substack)
        setColorPreviewStyle(view: backgroundColorView)
        substack.addArrangedSubview(backgroundColorView)
        setupLabel(text: "Item background color", stack: substack)
        setupColorSlider(stack: stack).addTarget(self, action: #selector(backgroundColorChanged), for: .valueChanged)
        
        substack = UIStackView()
        substack.axis = .horizontal
        substack.spacing = 10
        stack.addArrangedSubview(substack)
        setColorPreviewStyle(view: titleColorView)
        substack.addArrangedSubview(titleColorView)
        setupLabel(text: "Title color", stack: substack)
        setupColorSlider(stack: stack).addTarget(self, action: #selector(titleColorChanged), for: .valueChanged)

        substack = UIStackView()
        substack.axis = .horizontal
        substack.spacing = 10
        stack.addArrangedSubview(substack)
        setColorPreviewStyle(view: imageColorView)
        substack.addArrangedSubview(imageColorView)
		setupLabel(text: "Side image color", stack: substack)
        setupColorSlider(stack: stack).addTarget(self, action: #selector(imageColorChanged), for: .valueChanged)

        substack = UIStackView()
        substack.axis = .horizontal
        substack.spacing = 10
        stack.addArrangedSubview(substack)
        setColorPreviewStyle(view: buttonColorView)
        substack.addArrangedSubview(buttonColorView)
        setupLabel(text: "xButton color", stack: substack)
        setupColorSlider(stack: stack).addTarget(self, action: #selector(buttonColorChanged), for: .valueChanged)
    }
    
    private func setupImagesInputs() {
        var substack = UIStackView()
        substack.axis = .horizontal
        substack.spacing = 10
        stack.addArrangedSubview(substack)
        setColorPreviewStyle(view: sideImageView)
        sideImageView.backgroundColor = .cyan
        sideImageView.addTarget(self, action: #selector(setSideImage), for: .touchUpInside)
        substack.addArrangedSubview(sideImageView)
        var label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "Side image"
        label.textColor = color
        substack.addArrangedSubview(label)

        substack = UIStackView()
        substack.axis = .horizontal
        substack.spacing = 10
        stack.addArrangedSubview(substack)
        setColorPreviewStyle(view: xButtonImageView)
        xButtonImageView.backgroundColor = .clear
        xButtonImageView.setImage(UIImage(named: "close"), for: .normal)
        xButtonImageView.addTarget(self, action: #selector(setXButtonImage), for: .touchUpInside)
        substack.addArrangedSubview(xButtonImageView)
        label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "xButton image"
        label.textColor = color
        substack.addArrangedSubview(label)
    }

    private func setupOtherInputs() {
        let switchStack = UIStackView()
        switchStack.axis = .horizontal
        switchStack.spacing = 10
        stack.addArrangedSubview(switchStack)
        xButtonSwitch.translatesAutoresizingMaskIntoConstraints = false
        switchStack.addArrangedSubview(xButtonSwitch)
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "Always show xButton"
        label.textColor = color
        switchStack.addArrangedSubview(label)
    }

    private func setupSubmitButton() {
        let submitButton = UIButton()
        stack.addArrangedSubview(submitButton)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        submitButton.backgroundColor = .white
        submitButton.layer.borderColor = color.cgColor
        submitButton.layer.borderWidth = 2
        submitButton.setTitleColor(color, for: .normal)
        submitButton.layer.cornerRadius = 20
        submitButton.setTitle("Add tag", for: .normal)
        submitButton.addTarget(self, action: #selector(sendCustomItem), for: .touchUpInside)
    }

    private func setupLabel(text: String, stack: UIStackView) {
		let label = UILabel()
        label.font = label.font.withSize(20)
        label.text = text
        label.textColor = color
        stack.addArrangedSubview(label)
    }

    private func setupColorSlider(stack: UIStackView) -> UISlider {
		let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 6
        stack.addArrangedSubview(slider)
        return slider
    }

    @objc func setXButtonImage(sender: UIButton!) {
        xButtonImagePicker.present(parent: self, sourceType: .photoLibrary)
    }
    
    @objc func setSideImage(sender: UIButton!) {
        sideImageImagePicker.present(parent: self, sourceType: .photoLibrary)
    }
    
    @objc func backgroundColorChanged(slider: UISlider!) {
        if let value = slider?.value {
            backgroundColorView.backgroundColor = colorFromSlider(value)
        }
    }
    
    @objc func titleColorChanged(slider: UISlider!) {
        if let value = slider?.value {
            titleColorView.backgroundColor = colorFromSlider(value)
        }
    }
    
    @objc func imageColorChanged(slider: UISlider!) {
        if let value = slider?.value {
            imageColorView.backgroundColor = colorFromSlider(value)
        }
    }
    
    @objc func buttonColorChanged(slider: UISlider!) {
        if let value = slider?.value {
            buttonColorView.backgroundColor = colorFromSlider(value)
        }
    }
    
    @objc func sendCustomItem() {
        let item = TagViewItem()
        item.title = titleTextField.text
        item.backgroundColor = backgroundColorView.backgroundColor
        item.titleColor = titleColorView.backgroundColor
        item.sideImageBackgroundColor = imageColorView.backgroundColor
        item.xButtonBackgroundColor = buttonColorView.backgroundColor
        item.sideImage = sideImageView.imageView?.image
        item.xButtonImage = xButtonImageView.imageView?.image
        item.xButtonDisplaying = xButtonSwitch.isOn
        putNewCustomItem?(item)
        navigationController?.popViewController(animated: true)
    }
    
    private func colorFromSlider(_ value: Float) -> UIColor {
        let maxColorValue: Float = 0.9
        let minColorValue: Float = 0.2
        
        var red = minColorValue, green = minColorValue, blue = minColorValue
        switch value {
        case 0...1:
            red = maxColorValue
            green = minColorValue + (maxColorValue - minColorValue) * value
            blue = minColorValue
        case 1...2:
            red = maxColorValue - (maxColorValue - minColorValue) * (value - 1)
            green = maxColorValue
            blue = minColorValue
        case 2...3:
            red = minColorValue
            green = maxColorValue
            blue = minColorValue + (maxColorValue - minColorValue) * (value - 2)
        case 3...4:
            red = minColorValue
            green = maxColorValue - (maxColorValue - minColorValue) * (value - 3)
            blue = maxColorValue
        case 4...5:
            red = minColorValue + (maxColorValue - minColorValue) * (value - 4)
            green = minColorValue
            blue = maxColorValue
        case 5...6:
            red = maxColorValue
            green = minColorValue
            blue = maxColorValue - (maxColorValue - minColorValue) * (value - 5)
        default:
            break
        }
        return UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
    }
    
    private func setColorPreviewStyle(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = colorFromSlider(0)
        view.heightAnchor.constraint(equalToConstant: 30).isActive = true
        view.widthAnchor.constraint(equalToConstant: 30).isActive = true
        view.layer.cornerRadius = 15
    }
}

extension CustomItemViewController: ImagePickerDelegate {

    func imagePickerDelegate(didSelect image: UIImage, delegatedForm: ImagePicker) {
        if delegatedForm == xButtonImagePicker {
            xButtonImageView.setImage(image, for: .normal)
        }
        if delegatedForm == sideImageImagePicker {
            sideImageView.setImage(image, for: .normal)
        }
        delegatedForm.dismiss()
    }

    func imagePickerDelegate(didCancel delegatedForm: ImagePicker) { delegatedForm.dismiss() }
    
    func imagePickerDelegate(canUseCamera accessIsAllowed: Bool, delegatedForm: ImagePicker) {}
    
    func imagePickerDelegate(canUseGallery accessIsAllowed: Bool, delegatedForm: ImagePicker) {}
}
