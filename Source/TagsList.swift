//
//  TagsList.swift
//  GitManager
//
//  Created by Антон Текутов on 28.01.2020.
//  Copyright © 2020 Антон Текутов. All rights reserved.
//

import UIKit

public class TagsList: UIView, TagsListProtocol {    
    
    private static let heightForVerlicalContentOrientationWarning = "\n\t!!! Warning !!!\nheightForVerlicalContentOrientation will not be used because contentOrientation not equal vertical!"
    
    // MARK: - Public variables
    
    public var itemsConfiguration: TagsListItemConfiguratorProtocol = TagViewItemConfigurator()
    public weak var tagsListDelegate: TagsListDelegate?
    public var tagsListDataSource: TagsListDataSource?
    
    var spacing: CGFloat = 5
    public var contentOrientation: ContentOrientation = .verticalScrollable {
        didSet {
            enableContentOrientation()
        }
    }
    public var heightForVerticalContentOrientation: CGFloat? {
        didSet {
            if contentOrientation == .verticalScrollable {
                enableContentOrientation()
            } else {
                print(TagsList.heightForVerlicalContentOrientationWarning)
            }
        }
    }
    public var minimumInteritemSpacing: CGFloat {
        get {
            return layout.minimumInteritemSpacing
        }
        set {
            layout.minimumInteritemSpacing = newValue
        }
    }
    public var minimumLineSpacing: CGFloat {
        get {
            return layout.minimumLineSpacing
        }
        set {
            layout.minimumLineSpacing = newValue
        }
    }
    override public var backgroundColor: UIColor? {
        get {
            return tagCollectionView.backgroundColor
        }
        set {
            tagCollectionView.backgroundColor = newValue
        }
    }
    
    // MARK: - Private variables

    private var layout: UICollectionViewFlowLayout!
    private var tagCollectionView: UICollectionView!
    private var heightConstraint: NSLayoutConstraint?
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        layout = TagsLayout()
        tagCollectionView = DynamicHeightCollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        enableContentOrientation()

        backgroundColor = .clear

        addSubview(tagCollectionView)
        tagCollectionView.setMargin(0)

        tagCollectionView.translatesAutoresizingMaskIntoConstraints = false
        tagCollectionView.delegate = self
        tagCollectionView.dataSource = self
        tagCollectionView.register(TagsListCollectionViewCell.self, forCellWithReuseIdentifier: TagsListCollectionViewCell.identifier)  
        tagCollectionView.showsHorizontalScrollIndicator = false
    }
    
    // MARK: - Private methods
    
    private func enableContentOrientation() {
        heightConstraint?.isActive = false
        switch contentOrientation {
        case .horizontal:
            layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            heightConstraint = heightAnchor.constraint(equalToConstant: itemsConfiguration.cellHeight)
        case .verticalScrollable:
            layout = TagsLayout()
            layout.scrollDirection = .vertical
            heightConstraint = heightAnchor.constraint(equalToConstant: heightForVerticalContentOrientation ?? itemsConfiguration.cellHeight)
        case .verticalSizeToFit:
            layout = TagsLayout()
            layout.scrollDirection = .vertical
            heightConstraint = heightAnchor.constraint(equalTo: tagCollectionView.contentLayoutGuide.heightAnchor)
        }
        heightConstraint?.isActive = true
        tagCollectionView.collectionViewLayout = layout
    }
    
    private func insertCell(_ index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        tagCollectionView.insertItems(at: [indexPath])
    }
    
    private func calculateTagWidth(_ item: TagViewItem) -> CGFloat {
        var width: CGFloat = 0
        var tagPartsQuantity: CGFloat = 0
        if let text = item.title {
            //1 needs cause if cell width will be equal real min width label text will be compress
            width += text.width(with: item.titleFont ?? itemsConfiguration.titleFont) + 1
            tagPartsQuantity += 1
        }
        if (itemsConfiguration.sideImageEverytimeDisplaying || item.sideImage != nil) {
            width += itemsConfiguration.contentHeight
            tagPartsQuantity += 1
        }
        if itemsConfiguration.xButtonEverytimeDisplaying || item.xButtonDisplaying {
            width += itemsConfiguration.contentHeight
            tagPartsQuantity += 1
        }
        if tagPartsQuantity > 0 {
            width += 2 * itemsConfiguration.borderMarginHorizontal
            width += (tagPartsQuantity - 1) * itemsConfiguration.spacing
        }
        if let max = itemsConfiguration.maxWidth {
            width = min(width, max)
        }
        return width
    }
    
    // MARK: - Public methods
    
    public func reloadCollectionData() {
        tagCollectionView.reloadData()
    }
    
    public func getTagCellAtIndex(_ at: Int) -> TagCollectionViewCellProtocol? {
        let indexPath = IndexPath(row: at, section: 0)
        let cell = (tagCollectionView.dequeueReusableCell(withReuseIdentifier: TagsListCollectionViewCell.identifier, for: indexPath) as? TagsListCollectionViewCell)
        return cell
    }
    
    public func insertCellByIndex(_ index: Int) {
        if tagsListDataSource != nil {
            insertCell(index)
        }
    }
    
    public func removeCellByIndex(_ index: Int) {
        if tagsListDataSource != nil {
            let indexPath = IndexPath(row: index, section: 0)
            tagCollectionView.deleteItems(at: [indexPath])
        }
    }

    public func calculateHeightForItems(_ items: [TagViewItem], width: CGFloat) -> CGFloat {
        var height: CGFloat = 0
        var emptySpace: CGFloat = 0
        
        if items.isEmpty {
            return height
        }
        
        height -= minimumLineSpacing
        for item in items {
            let tagWidth = CGFloat(calculateTagWidth(item))
            if tagWidth <= emptySpace {
                emptySpace -= tagWidth + minimumInteritemSpacing
            } else {
                height += minimumLineSpacing + itemsConfiguration.cellHeight
                emptySpace = width - tagWidth - minimumInteritemSpacing
            }
        }
        return ceil(height)
    }

    public func calculateHeightForItems(_ items: [String], width: CGFloat) -> CGFloat {
        return calculateHeightForItems(items.compactMap { TagViewItem($0) }, width: width)
    }
}

// MARK: - TagCollectionViewCellDelegate

extension TagsList: TagCollectionViewCellDelegate {
    internal func xButtonPressed(_ cell: UICollectionViewCell) {
        if let indexPath = tagCollectionView.indexPath(for: cell) {
        	tagsListDelegate?.tagsListCellXButtonTouched(self, index: indexPath.row)
            if let source = tagsListDataSource {
                source.removeTagsListItem(indexPath.row)
            }
            tagCollectionView.deleteItems(at: [indexPath])
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension TagsList: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = tagsListDataSource!.tagsListViewItem(self, index: indexPath.row)
        return CGSize(width: ceil(calculateTagWidth(item)), height: ceil(itemsConfiguration.cellHeight))
    }
}

// MARK: - UICollectionViewDataSource

extension TagsList: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagsListDataSource?.tagsListItemsCount(self) ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = tagsListDataSource!.tagsListViewItem(self, index: indexPath.row)

        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: TagsListCollectionViewCell.identifier, for: indexPath) as? TagCollectionViewCellProtocol & TagCollectionViewCellConfigurationProtocol) ?? TagsListCollectionViewCell()
        cell.setup(cellDelegate: self, tagViewItem: item)
        
        return tagsListDataSource!.tagsListCellFinalConfiguration(self, cell: cell, index: indexPath.row)
    }
}

// MARK: - UICollectionViewDelegate

extension TagsList: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tagsListDelegate?.tagsListCellTouched(self, index: indexPath.row)
    }
}
