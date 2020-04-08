#
# Be sure to run `pod lib lint TagsList.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TagsList'
  s.version          = '0.1.0'
  s.summary          = 'TagsList is highly customizable collection of tags.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'TagList allows to add a list of highly customizable tags. You can set common tags parameters, add items with unique parameters. There are 2 ways to put data into TagsList: using dataSource methods or create DefaultTagsListDataSource and simply put array of strings into'
                       DESC

  s.homepage         =	'https://github.com/inomobile/tag-list'
  s.screenshots      =	'https://github.com/inomobile/tag-list/blob/master/Screenshots/CustomTags.png?raw=true', 											'https://github.com/inomobile/tag-list/blob/master/Screenshots/RegularTagsWithButton.png?raw=true', 											'https://github.com/inomobile/tag-list/blob/master/Screenshots/RegularTags.png?raw=true'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Inostudio mobile team (Anton Tekutov)' => 'a.tekutov@inostudio.com' }
  s.source           = { :git => 'https://github.com/inomobile/tag-list.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  s.source_files = 'Source/**/*'
  s.swift_version = '5.0'
  s.platforms = {
    "ios": "11.0"
  }
  
  s.frameworks = 'UIKit'
  
end
