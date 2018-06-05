# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

def test_pods
    pod 'OHHTTPStubs/Swift'
    pod 'Quick'
    pod 'Nimble'
    pod 'iOSSnapshotTestCase'
    pod 'Nimble-Snapshots'
end

target 'MixMakers' do
  use_frameworks!

  pod 'Cards', :git => 'https://github.com/andyk144/Cards.git'
  pod 'Nuke', '~> 6.0'
  pod 'NVActivityIndicatorView'
  pod "SearchTextField"

  target 'MixMakersTests' do
    inherit! :search_paths
    test_pods
  end

  target 'MixMakersUITests' do
    inherit! :search_paths
  end
end
