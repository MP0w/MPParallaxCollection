#
# Be sure to run `pod lib lint MPParallaxCollection.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MPParallaxCollection"
  s.version          = "0.1.0"
  s.summary          = "CollectionView with Parallax and PercentDriven animations"
  s.description      = <<-DESC
A collection view layout and a cell subclass usefull to made parallax of an image during the scrolling.
But even thanks to the delegate useful to make cool percent driven effect, in the example I used my [MPTextReveal](https://github.com/MP0w/MPTextReveal)
to show you how to use.
                       DESC
  s.homepage         = "https://github.com/MP0w/MPParallaxCollection"
  s.license          = 'BSD'
  s.author           = { "Alex Manzella" => "manzopower@icloud.com" }
  s.source           = { :git => "https://github.com/MP0w/MPParallaxCollection.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/manzopower'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Classes/'

  # s.dependency 'AFNetworking', '~> 2.3'
end
