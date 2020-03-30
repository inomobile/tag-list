//
//  DataSourseViewController.swift
//  TagsListExample
//
//  Created by Антон Текутов on 04.02.2020.
//  Copyright © 2020 Антон Текутов. All rights reserved.
//

import UIKit
import TagsList

class TagsListTestViewController: UIViewController {
    
    var tagsListView: TagsListProtocol = TagsList()
    let contentOrientationLabel = UILabel()
    let scroll = UIScrollView()
    let color = UIColor.purple

    private var alertController: UIAlertController?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        view.backgroundColor = .white
        setNavigationTitle()

        setupPlaceForTagsList()
        setupTagsList()
        setTagsListData()
        setupMenu()
    }

    internal func setNavigationTitle() {
        navigationItem.title = "TagsListTestViewController"
    }

    internal func setTagsListData() {

    }
    
    internal func putNewStringTag(tag: String) {

    }

    internal func putNewCustomTag(tag: TagViewItem) {

    }

    private func setupPlaceForTagsList() {
        view.addSubview(scroll)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scroll.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scroll.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)
        ])
        scroll.isScrollEnabled = true
        scroll.alwaysBounceVertical = true

        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 10
        scroll.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
            stack.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 30),
            stack.trailingAnchor.constraint(equalTo: scroll.trailingAnchor, constant: -30),
            stack.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 20)
        ])

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Content orientation:"
        stack.addArrangedSubview(label)
        contentOrientationLabel.translatesAutoresizingMaskIntoConstraints = false
        contentOrientationLabel.text = String(describing: tagsListView.contentOrientation)
        stack.addArrangedSubview(contentOrientationLabel)
    }

    private func setupTagsList() {
        scroll.addSubview(tagsListView)
        tagsListView.translatesAutoresizingMaskIntoConstraints = false
        tagsListView.backgroundColor = .white
        tagsListView.layer.borderColor = UIColor.darkGray.cgColor
        tagsListView.layer.borderWidth = 2
        NSLayoutConstraint.activate([
            tagsListView.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
            tagsListView.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 30),
            tagsListView.trailingAnchor.constraint(equalTo: scroll.trailingAnchor, constant: -30),
            tagsListView.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 50),
            tagsListView.bottomAnchor.constraint(equalTo: scroll.bottomAnchor, constant: -30)
        ])
        tagsListView.itemsConfiguration.sideImageEverytimeDisplaying = false
        tagsListView.itemsConfiguration.xButtonEverytimeDisplaying = true
        tagsListView.itemsConfiguration.maxWidth = view.frame.width - 70
        tagsListView.heightForVerticalContentOrientation = 200
    }

    private func setupMenu() {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.topAnchor.constraint(equalTo: scroll.bottomAnchor)
        ])
        label.backgroundColor = color
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = "Menu"
        label.textColor = .white

        let menuScroll = UIScrollView()
        menuScroll.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuScroll)
        NSLayoutConstraint.activate([
            menuScroll.topAnchor.constraint(equalTo: label.bottomAnchor),
            menuScroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuScroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuScroll.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)
        ])

        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        menuScroll.addSubview(stack)
        stack.setMargin(horizontal: 40, vertical: 30)
        stack.widthAnchor.constraint(equalToConstant: view.frame.width - 80).isActive = true
        stack.centerXAnchor.constraint(equalTo: scroll.centerXAnchor).isActive = true
        
        setupButtons(stack: stack)
        setupTagViewSettingsSwitches(stack: stack)

        label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "itemsConfiguration"
        label.textAlignment = .center
        label.textColor = color
        stack.addArrangedSubview(label)

        setupItemsConfigSwitches(stack: stack)
        setupItemsConfigSteppers(stack: stack)
    }

    private func setupButtons(stack: UIStackView) {
        let addButtonsStack = UIStackView()
        addButtonsStack.axis = .horizontal
        addButtonsStack.spacing = 10
        addButtonsStack.distribution = .fillEqually
        stack.addArrangedSubview(addButtonsStack)

        var addButton = UIButton()
        addButtonsStack.addArrangedSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addButton.backgroundColor = .white
        addButton.layer.borderColor = color.cgColor
        addButton.layer.borderWidth = 2
        addButton.setTitleColor(color, for: .normal)
        addButton.layer.cornerRadius = 20
        addButton.setTitle("Add normal tag", for: .normal)
        addButton.addTarget(self, action: #selector(addTag), for: .touchUpInside)

        addButton = UIButton()
        addButtonsStack.addArrangedSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addButton.backgroundColor = .white
        addButton.layer.borderColor = color.cgColor
        addButton.layer.borderWidth = 2
        addButton.setTitleColor(color, for: .normal)
        addButton.layer.cornerRadius = 20
        addButton.setTitle("Add custom tag", for: .normal)
        addButton.addTarget(self, action: #selector(addCustomTag), for: .touchUpInside)

        let button = UIButton()
        stack.addArrangedSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.backgroundColor = color
        button.layer.cornerRadius = 20
        button.setTitle("Change ContentOrientation", for: .normal)
        button.addTarget(self, action: #selector(changeContentOrientation), for: .touchUpInside)
    }

    private func setupTagViewSettingsSwitches(stack: UIStackView) {
        var stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 50
        stepper.value = Double(tagsListView.minimumInteritemSpacing)
        stepper.addTarget(self, action: #selector(minimumInteritemSpacingStepperValueChanged), for: .valueChanged)
        stack.addArrangedSubview(makeStepperHorisontalStack(stepper: stepper, title: "minimumInteritemSpacing"))

        stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 50
        stepper.value = Double(tagsListView.minimumLineSpacing)
        stepper.addTarget(self, action: #selector(minimumLineSpacingStepperValueChanged), for: .valueChanged)
        stack.addArrangedSubview(makeStepperHorisontalStack(stepper: stepper, title: "minimumLineSpacing"))
    }

    private func setupItemsConfigSwitches(stack: UIStackView) {
        var switchStack = UIStackView()
        switchStack.axis = .horizontal
        switchStack.spacing = 10
        stack.addArrangedSubview(switchStack)
        var imagesSwitch = UISwitch()
        imagesSwitch.translatesAutoresizingMaskIntoConstraints = false
        imagesSwitch.isOn = tagsListView.itemsConfiguration.sideImageEverytimeDisplaying
        switchStack.addArrangedSubview(imagesSwitch)
        imagesSwitch.addTarget(self, action: #selector(imagesSwitchChanged), for: UIControl.Event.valueChanged)
        var label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "Always show side images"
        label.textColor = color
        switchStack.addArrangedSubview(label)

        switchStack = UIStackView()
        switchStack.axis = .horizontal
        switchStack.spacing = 10
        stack.addArrangedSubview(switchStack)
        imagesSwitch = UISwitch()
        imagesSwitch.translatesAutoresizingMaskIntoConstraints = false
        imagesSwitch.isOn = tagsListView.itemsConfiguration.xButtonEverytimeDisplaying
        switchStack.addArrangedSubview(imagesSwitch)
        imagesSwitch.addTarget(self, action: #selector(xButtonsSwitchChanged), for: UIControl.Event.valueChanged)
        label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "Always show xButtons"
        label.textColor = color
        switchStack.addArrangedSubview(label)
    }

    private func setupItemsConfigSteppers(stack: UIStackView) {
        var stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 50
        stepper.value = Double(tagsListView.itemsConfiguration.borderMarginHorizontal)
        stepper.addTarget(self, action: #selector(borderMarginHorisontalStepperValueChanged), for: .valueChanged)
        stack.addArrangedSubview(makeStepperHorisontalStack(stepper: stepper, title: "borderMarginHorisontal"))

        stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 50
        stepper.value = Double(tagsListView.itemsConfiguration.spacing)
        stepper.addTarget(self, action: #selector(spacingStepperValueChanged), for: .valueChanged)
        stack.addArrangedSubview(makeStepperHorisontalStack(stepper: stepper, title: "spacing"))

        stepper = UIStepper()
        stepper.minimumValue = 20
        stepper.maximumValue = 70
        stepper.value = Double(tagsListView.itemsConfiguration.cellHeight)
        stepper.addTarget(self, action: #selector(cellHeightStepperValueChanged), for: .valueChanged)
        stack.addArrangedSubview(makeStepperHorisontalStack(stepper: stepper, title: "cellHeight"))

        stepper = UIStepper()
        stepper.minimumValue = 20
        stepper.maximumValue = 70
        stepper.value = Double(tagsListView.itemsConfiguration.contentHeight)
        stepper.addTarget(self, action: #selector(contentHeightStepperValueChanged), for: .valueChanged)
        stack.addArrangedSubview(makeStepperHorisontalStack(stepper: stepper, title: "contentHeight"))
    }

    private func makeStepperHorisontalStack(stepper: UIStepper, title: String) -> UIStackView {
        let stepperStack = UIStackView()
        stepperStack.axis = .horizontal
        stepperStack.spacing = 10
        stepperStack.addArrangedSubview(stepper)
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.text = title
        label.textColor = color
        stepperStack.addArrangedSubview(label)
        return stepperStack
    }

    // MARK: - steppers actions
    @objc func minimumInteritemSpacingStepperValueChanged(stepper: UIStepper!) {
        tagsListView.minimumInteritemSpacing = CGFloat(stepper.value)
    }

    @objc func minimumLineSpacingStepperValueChanged(stepper: UIStepper!) {
        tagsListView.minimumLineSpacing = CGFloat(stepper.value)
    }

    @objc func borderMarginHorisontalStepperValueChanged(stepper: UIStepper!) {
        tagsListView.itemsConfiguration.borderMarginHorizontal = CGFloat(stepper.value)
        tagsListView.reloadCollectionData()
    }

    @objc func spacingStepperValueChanged(stepper: UIStepper!) {
        tagsListView.itemsConfiguration.spacing = CGFloat(stepper.value)
        tagsListView.reloadCollectionData()
    }

    @objc func contentHeightStepperValueChanged(stepper: UIStepper!) {
        tagsListView.itemsConfiguration.contentHeight = CGFloat(stepper.value)
        tagsListView.reloadCollectionData()
    }

    @objc func cellHeightStepperValueChanged(stepper: UIStepper!) {
        tagsListView.itemsConfiguration.cellHeight = CGFloat(stepper.value)
        tagsListView.reloadCollectionData()
    }

    // MARK: - switch actions
    @objc func imagesSwitchChanged(mySwitch: UISwitch) {
        tagsListView.itemsConfiguration.sideImageEverytimeDisplaying = mySwitch.isOn
        tagsListView.reloadCollectionData()
    }

    @objc func xButtonsSwitchChanged(mySwitch: UISwitch) {
        tagsListView.itemsConfiguration.xButtonEverytimeDisplaying = mySwitch.isOn
        tagsListView.reloadCollectionData()
    }

    // MARK: - Button actions.
    @objc internal func addTag() {
        let alertController = UIAlertController(title: nil, message: "Append Tag", preferredStyle: .alert)
        self.alertController = alertController
        alertController.addTextField(configurationHandler: { (textField) in
            textField.returnKeyType = .next
            textField.delegate = self
            textField.becomeFirstResponder()
        })
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Append", style: .default, handler: { (_) in
            if let textArray = alertController.textFields?.compactMap({ $0.text }).filter({ $0 != "" }) {
                for item in textArray {
                    self.putNewStringTag(tag: item)
                }
            }
        }))
        self.present(alertController, animated: true, completion: nil)
    }

    @objc func addCustomTag() {
        let controller = CustomItemViewController()
        controller.putNewCustomItem = putNewCustomTag(tag:)
        navigationController?.pushViewController(controller, animated: true)
    }

    @objc func changeContentOrientation() {
        switch tagsListView.contentOrientation {
        case .horizontal:
            tagsListView.contentOrientation = .verticalScrollable
        case .verticalScrollable:
            tagsListView.contentOrientation = .verticalSizeToFit
        case .verticalSizeToFit:
            tagsListView.contentOrientation = .horizontal
        }
        contentOrientationLabel.text = String(describing: tagsListView.contentOrientation)
    }
}

extension TagsListTestViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let alertController = self.alertController {
            alertController.addTextField(configurationHandler: { (textField) in
                textField.returnKeyType = .next
                textField.delegate = self
                textField.becomeFirstResponder()
            })
        }
        return false
    }
}

