# TagsList

[![CI Status](https://img.shields.io/travis/Anton/TagsList.svg?style=flat)](https://travis-ci.org/Anton/TagsList)
[![Version](https://img.shields.io/cocoapods/v/TagsList.svg?style=flat)](https://cocoapods.org/pods/TagsList)
[![License](https://img.shields.io/cocoapods/l/TagsList.svg?style=flat)](https://cocoapods.org/pods/TagsList)
[![Platform](https://img.shields.io/cocoapods/p/TagsList.svg?style=flat)](https://cocoapods.org/pods/TagsList)


<p align="center">
<b>TagList</b> allows to add a list of highly customizable tags. You can set common tags parameters, add items with unique parameters
</p>


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.
Example project includes 3 parts:
- VC is `TagsListDataSource` + customisation of items
- Simple way to display string array (`DefaultTagsListDataSource`)
- Sample of using `TagsList` inside of `UITableViewCell` and calculating `TagsList` height


## Preview

| **Content orientation** | **Items deleting** | **Customisation features** |
|:-------:|:-------:|:-------:|
|<img src="DemoGif/TagList 1.gif" width="300">|<img src="DemoGif/TagList 2.gif" width="300">| <img src="DemoGif/TagList 3.gif" width="300">|

## Requirements

- iOS 11.0+
- Xcode 9.0


## Installation

TagsList is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TagsList'
```

Import `TagsList` into your swift source file

``` swift
import TagsList
```

Congratulations!

## Usage

### Common tags settings
First step to customise appearance of tags is configure `TagViewItemConfigurator`. It include common tags view settings and applies by default.
<details><summary> TagViewItemConfigurator properties </summary>
<br>

    borderMarginHorizontal
    spacing
    contentHeight
    cellHeight
    itemCornerRadius
    sideImageCornerRadius
    xButtonCornerRadius

    sideImageEverytimeDisplaying
    xButtonEverytimeDisplaying
    maxWidth
    titleFont

    backgroundColor
    sideImageBackgroundColor
    xButtonBackgroundColor
    textColor

    xButtonImage
</details>

### Ways of data representation

Next step is representation of your data. 
There are 2 ways: 
- Create `DefaultTagsListDataSource` and put your string array into
- Set `TagsList` property `tagsListDataSource` and implement methods of `TagsListDataSource` protocol

Choose first way if you need to represent array of strings quickly.
If you want to create tags with different representation I recomend you to use second way or create own TagsListDataSource

### Tags with different representation

If you need to show custom tags like on [Preview](#preview) use `TagViewItem`s array with second way of data representation.
<details><summary> TagViewItem properties </summary>
<br>

    title
    titleColor
    titleFont

    sideImage
    sideImageBackgroundColor

    xButtonDisplaying
    xButtonBackgroundColor
    xButtonImage

    backgroundColor
</details>

If you stil want to customise items after previous steps use `tagsListCellFinalConfiguration` method of `TagsListDataSource`

## Author

Mobile team of Inostudio.

## License

TagsList is available under the MIT license. See the LICENSE file for more info.
