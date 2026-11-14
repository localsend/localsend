require 'xcodeproj'
root = ARGV[0]
p = Xcodeproj::Project.new("#{root}/PickerDriver.xcodeproj")
host = p.new_target(:application, 'PickerHost', :ios, '16.0')
host.build_configurations.each do |c|
  c.build_settings['PRODUCT_BUNDLE_IDENTIFIER']='org.localsend.qa.PickerHost'
  c.build_settings['GENERATE_INFOPLIST_FILE']='YES'
  c.build_settings['CODE_SIGNING_ALLOWED']='NO'
  c.build_settings['SWIFT_VERSION']='5.0'
end
File.write("#{root}/Host.swift", "import UIKit\n@main class Host: UIResponder, UIApplicationDelegate {}\n")
host.source_build_phase.add_file_reference(p.main_group.new_file('Host.swift'))
test = p.new_target(:ui_test_bundle, 'PickerTests', :ios, '16.0')
test.add_dependency(host)
test.source_build_phase.add_file_reference(p.main_group.new_file('PickerTests.swift'))
test.build_configurations.each do |c|
  c.build_settings['PRODUCT_BUNDLE_IDENTIFIER']='org.localsend.qa.PickerTests'
  c.build_settings['GENERATE_INFOPLIST_FILE']='YES'
  c.build_settings['TEST_TARGET_NAME']='PickerHost'
  c.build_settings['CODE_SIGNING_ALLOWED']='NO'
  c.build_settings['SWIFT_VERSION']='5.0'
end
p.save
scheme = Xcodeproj::XCScheme.new
scheme.add_build_target(host)
scheme.add_build_target(test)
scheme.add_test_target(test)
scheme.save_as(p.path, 'PickerDriver', true)
