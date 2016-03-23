#
# Be sure to run `pod lib lint SwaggerClient.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = "cloud-sdk-ios"
    s.version          = "1.0.0"

    s.summary          = "Boomtown Cloud API"
    s.description      = <<-DESC
                         RESTful cloud API
                         DESC

    s.platform     = :ios, '7.0'
    s.requires_arc = true

    s.framework    = 'SystemConfiguration'
    
    s.homepage     = "https://github.com/goboomtown/cloud-sdk-ios"
    s.license      = "MIT"
    s.source       = { :git => "https://github.com/goboomtown/cloud-sdk-ios", :tag => "#{s.version}" }
    s.author       = { "Larry Borsato" => "lborsato@gizmocreative.com" }

    s.source_files = 'sdk/**/*'
    s.public_header_files = 'sdk/**/*.h'

    s.dependency 'AFNetworking', '~> 2.3'
    s.dependency 'JSONModel', '~> 1.1'
    s.dependency 'ISO8601', '~> 0.3'
end

