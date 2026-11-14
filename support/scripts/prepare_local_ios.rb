# Generate a separate local signing project after configuring Flutter for lib/main.dart.
# Generated Runner.local projects are temporary; keep the upstream Runner project unchanged.
require 'xcodeproj'
require 'fileutils'
require 'rexml/document'
root = Dir.pwd
team = ARGV.fetch(0)
raise 'Invalid team identifier' unless team.match?(/\A[A-Z0-9]{10}\z/)
app_id = ARGV.fetch(1)
raise 'Invalid bundle identifier' unless app_id.match?(/\A[a-zA-Z0-9.-]+\z/)
without_multicast = ARGV.include?('--without-multicast')
local = File.join(root, 'app/ios/LocalInstall')
FileUtils.mkdir_p(local)
ios = File.join(root, 'app/ios')
original = File.join(ios, 'Runner.xcodeproj')
copy = File.join(ios, 'Runner.local.xcodeproj')
marker = File.join(copy, '.localsend-generated')
if File.exist?(copy)
  raise 'Refusing to replace an unmarked local project' unless File.file?(marker) && File.read(marker) == "localsend-local-ios-build\n"
  FileUtils.rm_rf(copy)
end
FileUtils.cp_r(original, copy)
File.write(marker, "localsend-local-ios-build\n")
p = Xcodeproj::Project.open(copy)
p.targets.each do |target|
  next unless ['Runner', 'ShareExtension'].include?(target.name)
  main = target.name == 'Runner'
  entitlement = Xcodeproj::Plist.read_from_path(File.join(ios, main ? 'Runner/Runner.entitlements' : 'ShareExtension/ShareExtension.entitlements'))
  entitlement['com.apple.security.application-groups'] = ['group.' + app_id]
  entitlement.delete('com.apple.developer.networking.multicast') if main && without_multicast
  ent_path = File.join(local, target.name + '.entitlements')
  Xcodeproj::Plist.write_to_path(entitlement, ent_path)
  target.build_configurations.each do |c|
    c.build_settings['DEVELOPMENT_TEAM'] = team
    c.build_settings['PRODUCT_BUNDLE_IDENTIFIER'] = main ? app_id : app_id + '.ShareExtension'
    c.build_settings['CODE_SIGN_STYLE'] = 'Automatic'
    c.build_settings['INFOPLIST_KEY_CFBundleDisplayName'] = 'LocalSend Nxt'
    c.build_settings['CODE_SIGN_ENTITLEMENTS'] = ent_path
    c.build_settings.delete('PROVISIONING_PROFILE_SPECIFIER')
    c.build_settings.delete('PROVISIONING_PROFILE')
    begin
      plist = Xcodeproj::Plist.read_from_path(File.join(ios, main ? 'Runner/Info.plist' : 'ShareExtension/Info.plist'))
      plist['CFBundleDisplayName'] = 'LocalSend Nxt'
      plist_path = File.join(local, target.name + '-Info.plist')
      Xcodeproj::Plist.write_to_path(plist, plist_path)
      c.build_settings['INFOPLIST_FILE'] = plist_path
      version = File.read(File.join(root, 'app/pubspec.yaml')).match(/^version:\s*(\S+)/)[1].split('+')
      c.build_settings['FLUTTER_BUILD_NAME'] = version[0]
      c.build_settings['FLUTTER_BUILD_NUMBER'] = version[1] || '1'
      c.build_settings['MARKETING_VERSION'] = version[0]
      c.build_settings['CURRENT_PROJECT_VERSION'] = version[1] || '1'
    end
  end
end
p.save
Dir.glob(File.join(copy, 'xcshareddata/xcschemes/*.xcscheme')).each do |s|
  File.write(s, File.read(s).gsub('container:Runner.xcodeproj', 'container:Runner.local.xcodeproj'))
end
workspace = File.join(ios, 'Runner.local.xcworkspace')
FileUtils.mkdir_p(workspace)
File.write(File.join(workspace, 'contents.xcworkspacedata'), File.read(File.join(ios, 'Runner.xcworkspace/contents.xcworkspacedata')).gsub('group:Runner.xcodeproj', 'group:Runner.local.xcodeproj'))
puts workspace
