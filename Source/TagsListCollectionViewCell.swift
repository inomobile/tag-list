//
//  TagsListViewCell.swift
//  GitManager
//
//  Created by Антон Текутов on 22.01.2020.
//  Copyright © 2020 Антон Текутов. All rights reserved.
//

import UIKit

public class TagsListCollectionViewCell: UICollectionViewCell, TagCollectionViewCellProtocol, TagCollectionViewCellConfigurationProtocol {
    
    static let identifier: String = "TagItemCell"
    
    private weak var tagsList: TagCollectionViewCellDelegate!
    private var config: TagsListItemConfiguratorProtocol {
        guard let configuration = tagsList?.itemsConfiguration
            else { return TagViewItemConfigurator() }
        return configuration
    }
    
    public var stack = UIStackView()
    public let label = UILabel()
    public let sideImageView = UIImageView()
    public let xButton = UIButton()
    
    var sideImageWidthConstraint: NSLayoutConstraint!
    var xButtonWidthConstraint: NSLayoutConstraint!
    var stackHeightConstraint: NSLayoutConstraint!
    var stackLeadingConstraint: NSLayoutConstraint!
    var stackTrailingConstraint: NSLayoutConstraint! 
    
    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup() {
        stack.axis = .horizontal
        stack.spacing = config.spacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stack)
        
        sideImageView.translatesAutoresizingMaskIntoConstraints = false
        sideImageView.contentMode = .scaleAspectFill
        sideImageView.clipsToBounds = true
        stack.addArrangedSubview(sideImageView)

        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        stack.addArrangedSubview(label)

        xButton.translatesAutoresizingMaskIntoConstraints = false
        xButton.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)

        stack.addArrangedSubview(xButton)
        
        sideImageWidthConstraint = sideImageView.widthAnchor.constraint(equalToConstant: config.contentHeight)        
        xButtonWidthConstraint = xButton.widthAnchor.constraint(equalToConstant: config.contentHeight)        
        stackHeightConstraint = stack.heightAnchor.constraint(equalToConstant: config.contentHeight)
        stackLeadingConstraint = stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: config.borderMarginHorizontal)
        stackTrailingConstraint = stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -config.borderMarginHorizontal)
        
        NSLayoutConstraint.activate([
            sideImageWidthConstraint,
            xButtonWidthConstraint,
            stackHeightConstraint,
            stackLeadingConstraint,
            stackTrailingConstraint,
            stack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    // MARK: - Setup content
    
    internal func setup(cellDelegate: TagCollectionViewCellDelegate, tagViewItem: TagViewItem) {
        tagsList = cellDelegate
        
        backgroundColor = tagViewItem.backgroundColor ?? config.backgroundColor
        layer.cornerRadius = config.itemCornerRadius
                
        sideImageView.isHidden = true
        label.isHidden = true
        xButton.isHidden = true
        
        stack.spacing = config.spacing
        stackHeightConstraint.constant = config.contentHeight
        stackLeadingConstraint.constant = config.borderMarginHorizontal
        stackTrailingConstraint.constant = -config.borderMarginHorizontal
        
        sideImageView.image = nil
        
        if config.sideImageEverytimeDisplaying || (tagViewItem.sideImage != nil) {
            setupSideImageView(tagViewItem)
        }
        if tagViewItem.title != nil {
            setupLabel(tagViewItem)
        }
        if config.xButtonEverytimeDisplaying || (tagViewItem.xButtonDisplaying) {
            setupXButton(tagViewItem)
        }
    }
    
    private func setupSideImageView(_ tagViewItem: TagViewItem) {
        sideImageView.isHidden = false
        sideImageView.backgroundColor = tagViewItem.sideImageBackgroundColor ?? config.sideImageBackgroundColor
        sideImageView.image = tagViewItem.sideImage
        sideImageView.layer.cornerRadius = config.sideImageCornerRadius
        
        sideImageWidthConstraint?.constant = config.contentHeight
    }
    
    private func setupLabel(_ tagViewItem: TagViewItem) {
        label.text = tagViewItem.title
        label.textColor = tagViewItem.titleColor ?? config.textColor
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        label.font = tagViewItem.titleFont ?? config.titleFont
        label.isHidden = false
    }
    
    private func setupXButton(_ tagViewItem: TagViewItem) {
        xButton.layer.backgroundColor = tagViewItem.xButtonBackgroundColor?.cgColor ?? config.xButtonBackgroundColor.cgColor
        xButton.isHidden = false
        xButton.layer.cornerRadius = config.xButtonCornerRadius

        xButton.setBackgroundImage(tagViewItem.xButtonImage ?? config.xButtonImage, for: .normal)
        xButton.layer.masksToBounds = true
        xButton.imageView?.layer.cornerRadius = config.xButtonCornerRadius
        
        xButtonWidthConstraint?.constant = config.contentHeight
    }
    
    // MARK: - xButtonTapped action
    
    @objc private func buttonTouched() {
        tagsList?.xButtonPressed(self)
    }
}
