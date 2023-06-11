# source 'https://github.com/CocoaPods/Specs.git'
# source 'https://cdn.cocoapods.org/'
# source 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'

install!  'cocoapods',
          :deterministic_uuids                => false,
          :generate_multiple_pod_projects     => false

#install! 'cocoapods', :generate_multiple_pod_projects     => true
#install! 'cocoapods', :warn_for_unused_master_specs_repo  => false
#install! 'cocoapods', :deterministic_uuids => false, :warn_for_unused_master_specs_repo  => false

# applet_webcore=YES pod update

###################################################################################################################################

ENV['OLLVM']                              = 'NO'

ENV['IDEAFONT_HY']                        = 'NO'
ENV['IDEAFONT_MSYH']                      = 'NO'
ENV['IDEAFONT_ZEKTON']                    = 'NO'
ENV['IDEAFONT']                           = 'NO'

ENV['IDEA_MATERIAL_COMPONENTS']           = 'NO'
ENV['IDEA_MATERIAL_NAVIGATION_BAR']       = 'YES'

ENV['IDEA_TABBAR_CONTROLLER_TRANSITION']  = 'NO'

ENV['IDEA_AFNETWORKING']                  = 'NO'

ENV['IDEA_FOUNDATION_EXTENSION']          = 'YES'
ENV['IDEA_UIKIT_EXTENSION']               = 'YES'

ENV['IDEA_YYKIT']                         = 'YES'
ENV['IDEA_EVENT_KIT']                     = 'NO'

ENV['IDEA_SERVICE_FILE_SYNC']             = 'NO'

ENV['IDEA_NAVIGATION_BAR']                = 'NO'

ENV['IDEA_PAN_MODAL']                     = 'YES'

ENV['IDEA_FULLSCREEN_POP_GESTURE']        = 'YES'
ENV['IDEA_ROOT_NAVIGATION_CONTROLLER']    = 'NO'

ENV['OpenSSL']                            = 'NO'
ENV['SSZipArchive']                       = 'NO'

ENV['ADS_GOOGLE_MOBILE']                  = 'YES'
ENV['ADS_AUDIENCE_NETWORK']               = 'YES'
ENV['ADS_GOOGLE_MEDIATION_FACEBOOK']      = 'YES'

ENV['ios.deployment_target']              = '12.0'
ENV['watchos.deployment_target']          = '4.3'
ENV['osx.deployment_target']              = '10.15'
ENV['tvos.deployment_target']             = '12.0'

ENV['Debug.Keyboard']                     = 'NO'
ENV['IDEA_APPLET_DEBUG']                  = 'YES'

#ENV['IM_HOST']                            = 'T450'
#ENV['XCODE_VERSION']                      = '12.4'
#ENV['XCODE_VERSION']                      = '14.+'

###################################################################################################################################

def github_pod(pod_name, file = pod_name, type = 'remote', branch = 'master', configurations = ['Debug', 'Release'], modular_headers = true)
  #  puts "github_pod :: pod_name : #{pod_name} +++ configurations : #{configurations}"
  case type
    when 'local'
    pod pod_name, :path   => "../../MINIWING-PODs/#{file}",
                  :inhibit_warnings => true,
                  :modular_headers  => modular_headers,
                  :configurations   => configurations
    when 'remote'
    pod pod_name, :git    => "git@github.com:miniwing/#{file}.git",
                  :branch => "#{branch}",
                  :inhibit_warnings => true,
                  :modular_headers  => modular_headers,
                  :configurations   => configurations
    else
  end
end

def miniwing_pod(pod_name, type = 'remote', branch = 'master', configurations = ['Debug', 'Release'], modular_headers = true)
  #  puts "miniwing_pod :: pod_name : #{pod_name} +++ configurations : #{configurations}"
  case type
    when 'local'
    pod pod_name, :path   => "../../MINIWING-PODs/#{pod_name}",
                  :inhibit_warnings => true,
                  :modular_headers  => modular_headers,
                  :configurations   => configurations
    when 'remote'
    pod pod_name, :git    => "git@github.com:miniwing/MINIWING-PODs.git",
                  :branch => "#{branch}",
                  :inhibit_warnings => true,
                  :modular_headers  => modular_headers,
                  :configurations   => configurations
    else
  end
end

###################################################################################################################################

workspace 'Idea.NetworkArch'

project   'NetworkArch/NetworkArch.xcodeproj'

use_frameworks! :linkage => :static
#use_frameworks! :linkage => :dynamic

use_modular_headers!
inhibit_all_warnings!

platform :ios, ENV['ios.deployment_target']

###################################################################################################################################

def library
  
  if ENV['IDEA_FOUNDATION_EXTENSION'] == 'YES'
    github_pod('FoundationExtension',       file = 'FoundationExtension',     type = 'local', branch = 'develop')
  end # IDEA_FOUNDATION_EXTENSION

  if ENV['IDEA_UIKIT_EXTENSION'] == 'YES'
    github_pod('UIKitExtension',            file = 'FoundationExtension',     type = 'local', branch = 'develop')
  end # IDEA_UIKIT_EXTENSION

  if ENV['IDEA_YYKIT'] == 'YES'
    github_pod('YYKit',                     file = 'YYKit',                   type = 'local', branch = 'develop')
  end # IDEA_YYKIT

  if ENV['IDEA_AFNETWORKING'] == 'YES'
    github_pod('AFNetworking',              file = 'AFNetworking',            type = 'local', branch = 'develop')
  else
    github_pod('AFNetworking/Reachability', file = 'AFNetworking',            type = 'local', branch = 'develop')
  end # IDEA_AFNETWORKING

  github_pod('IDEAApplet',                  file = 'IDEAApplet',              type = 'local', branch = 'develop')

  miniwing_pod('IDEAKit',             type = 'local', branch = 'develop')
  miniwing_pod('IDEAColor',           type = 'local', branch = 'develop')
  miniwing_pod('IDEAPalettes',        type = 'local', branch = 'develop')
  miniwing_pod('IDEATypeFace',        type = 'local', branch = 'develop')
  miniwing_pod('IDEANightVersion',    type = 'local', branch = 'develop')

  miniwing_pod('IDEALanScan',         type = 'local', branch = 'develop')

  if ENV['OLLVM'] == 'YES'
    miniwing_pod('ollvm',             type = 'local', branch = 'develop')
  end # OLLVM

#  pod 'MMLanScan'
#  pod 'PhoneNetSDK'
#  pod 'CocoaLumberjack'

end

###################################################################################################################################

target 'NetworkArch' do
#  platform :ios, '10.0'
#  plugin 'cocoapods-hmap-prebuilt'

  if ENV['IDEA_ROOT_NAVIGATION_CONTROLLER'] == 'YES'
    pod 'RTRootNavigationController'
    pod 'RTInteractivePush'
  end # IDEA_ROOT_NAVIGATION_CONTROLLER

  if ENV['IDEA_MATERIAL_COMPONENTS'] == 'YES'
    pod 'MaterialComponents'
    pod 'MotionInterchange'
  else
    if ENV['IDEA_MATERIAL_NAVIGATION_BAR'] == 'YES'
      pod 'MaterialComponents/NavigationBar'
      pod 'MaterialComponents/ActivityIndicator'
      pod 'MotionInterchange'
    end # IDEA_MATERIAL_NAVIGATION_BAR
  end # IDEA_MATERIAL_COMPONENTS
  
  #-------------------------------------------------------------------------------------------------------------------------------#
  if ENV['IDEA_APPLET_DEBUG'] == 'YES'
    github_pod('IDEAAppletDebugger',  file = 'IDEAApplet', type = 'local', branch = 'develop', configurations = ['Debug'])
  end # IDEA_APPLET_DEBUG
  #-------------------------------------------------------------------------------------------------------------------------------#
  if ENV['IDEA_FULLSCREEN_POP_GESTURE'] == 'YES'
    miniwing_pod('IDEAFullscreenPopGesture',                type = 'local',   branch = 'develop')
  end # IDEA_FULLSCREEN_POP_GESTURE
  
  if ENV['IDEA_PAN_MODAL'] == 'YES'
    miniwing_pod('IDEAPanModal',                            type = 'local',   branch = 'develop')
  end # IDEA_PAN_MODAL
  
  if ENV['IDEA_TABBAR_CONTROLLER_TRANSITION'] == 'YES'
    miniwing_pod('IDEATabBarControllerTransition',          type = 'local',   branch = 'develop')
  end # IDEA_TABBAR_CONTROLLER_TRANSITION
  #-------------------------------------------------------------------------------------------------------------------------------#
  miniwing_pod('IDEANibBridge',                             type = 'local',   branch = 'develop')
  miniwing_pod('IDEAUIKit',                                 type = 'local',   branch = 'develop')
  miniwing_pod('IDEAUIVendor',                              type = 'local',   branch = 'develop')
  miniwing_pod('IDEAUIRouter',                              type = 'local',   branch = 'develop')
  miniwing_pod('IDEAStartUp',                               type = 'local',   branch = 'develop')
  miniwing_pod('IDEAServiceManager',                        type = 'local',   branch = 'develop')
  miniwing_pod('IDEANightVersion',                          type = 'local',   branch = 'develop')
  #-------------------------------------------------------------------------------------------------------------------------------#
  miniwing_pod('IDEAPing',                                  type = 'local',   branch = 'develop')
  miniwing_pod('IDEARouter',                                type = 'local',   branch = 'develop')
  miniwing_pod('IDEANetUtils',                              type = 'local',   branch = 'develop')
  miniwing_pod('PhoneNetSDK',                               type = 'local',   branch = 'develop')
  #-------------------------------------------------------------------------------------------------------------------------------#
  pod 'MonitorService',     :path => 'NetworkArch/MonitorService'
  pod 'ImageProvider',      :path => 'NetworkArch/ImageProvider'
#  pod 'SecurityUtils',      :path => 'NetworkArch/SecurityUtils'
  pod 'SettingProvider',    :path => 'NetworkArch/SettingProvider'
  #-------------------------------------------------------------------------------------------------------------------------------#
  pod 'APPDriver',          :path => 'APPDriver'
  pod 'APPDATA' ,           :path => 'APPDATA'
  pod 'APPDEBUG',           :path => 'APPDEBUG',                            :configurations => ['Debug']
  #-------------------------------------------------------------------------------------------------------------------------------#
  pod 'ADs',                :path => 'NetworkArch/Phone/ADs'
  pod 'NetworkService',     :path => 'NetworkArch/Phone/NetworkService'
  pod 'INTRODUCTION',       :path => 'NetworkArch/Phone/INTRODUCTION'
  
  pod 'UISETTING',          :path => 'NetworkArch/Phone/UISETTING'
  pod 'HOME',               :path => 'NetworkArch/Phone/HOME'
  pod 'MONITOR',            :path => 'NetworkArch/Phone/MONITOR'
  #-------------------------------------------------------------------------------------------------------------------------------#
  pod 'Reveal-SDK', '~> 24' ,                                               :configurations => ['Debug']
  #-------------------------------------------------------------------------------------------------------------------------------#
  pod 'Appirater'
#  pod 'Aspects'
  #-------------------------------------------------------------------------------------------------------------------------------#
#  pod 'MIApm'
#  pod 'MISafeApp'
#  pod 'DoraemonKit',                                                        :configurations => ['Debug']
#  pod 'YKWoodpecker',                                                       :configurations => ['Debug']
  #-------------------------------------------------------------------------------------------------------------------------------#
#  pod 'GoogleAnalytics'
#  pod 'Firebase'

  if ENV['ADS_AUDIENCE_NETWORK'] == 'YES'
    if ENV['XCODE_VERSION'] == '12.4'
      pod 'FBAudienceNetwork',                '6.10.0'
    else
      pod 'FBAudienceNetwork'
    end
  end # ADS_AUDIENCE_NETWORK

  if ENV['ADS_GOOGLE_MOBILE'] == 'YES'
    if ENV['XCODE_VERSION'] == '12.4'
#      pod 'Google-Mobile-Ads-SDK',            '9.3.0'
      pod 'Google-Mobile-Ads-SDK',            '9.3.0'
    else
      pod 'Google-Mobile-Ads-SDK'
    end
  end # ADS_GOOGLE_MOBILE

  if ENV['ADS_GOOGLE_MEDIATION_FACEBOOK'] == 'YES'
    if ENV['XCODE_VERSION'] == '12.4'
      pod 'GoogleMobileAdsMediationFacebook', '6.10.0.0'
    else
      pod 'GoogleMobileAdsMediationFacebook'
    end
  end # ADS_GOOGLE_MEDIATION_FACEBOOK

  #-------------------------------------------------------------------------------------------------------------------------------#

  library

end

###################################################################################################################################

#target 'TodayClip' do
#
# pod 'Reveal-SDK', '~> 24', :configurations => ['Debug']
#
#  library
#
#end

###################################################################################################################################

target 'TodayWidget' do
  
  if ENV['ROOT_NAVIGATION_CONTROLLER'] == 'YES'
    pod 'RTRootNavigationController'
    pod "RTInteractivePush"
  end # IDEA_ROOT_NAVIGATION_CONTROLLER
  
  miniwing_pod('IDEAUIKit',       type = 'local',   branch = 'develop')
  miniwing_pod('IDEAUIVendor',    type = 'local',   branch = 'develop')
  miniwing_pod('IDEANibBridge',   type = 'local',   branch = 'develop')

  miniwing_pod('IDEARouter',      type = 'local',   branch = 'develop')

  #-------------------------------------------------------------------------------------------------------------------------------#

  pod 'ImageProvider',      :path => 'NetworkArch/ImageProvider'

  #-------------------------------------------------------------------------------------------------------------------------------#
  pod 'Reveal-SDK', '~> 24' ,                                               :configurations => ['Debug']
  #-------------------------------------------------------------------------------------------------------------------------------#

  library
  
end

###################################################################################################################################

#target 'MonitorWidget' do
#  
#  if ENV['ROOT_NAVIGATION_CONTROLLER'] == 'YES'
#    pod 'RTRootNavigationController'
#    pod "RTInteractivePush"
#  end # IDEA_ROOT_NAVIGATION_CONTROLLER
#  
#  miniwing_pod('IDEAUIKit',       type = 'local',   branch = 'develop')
#  miniwing_pod('IDEAUIVendor',    type = 'local',   branch = 'develop')
#  miniwing_pod('IDEANibBridge',   type = 'local',   branch = 'develop')
#
#  miniwing_pod('IDEARouter',      type = 'local',   branch = 'develop')
#
#  #-------------------------------------------------------------------------------------------------------------------------------#
#
#  pod 'ImageProvider',      :path => 'NetworkArch/ImageProvider'
#
#  #-------------------------------------------------------------------------------------------------------------------------------#
#  pod 'Reveal-SDK', '~> 24' ,                                               :configurations => ['Debug']
#  #-------------------------------------------------------------------------------------------------------------------------------#
#
#  library
#  
#end

###################################################################################################################################

target 'FleetingWidget' do

  #-------------------------------------------------------------------------------------------------------------------------------#
  pod 'Reveal-SDK', '~> 24' ,                                               :configurations => ['Debug']
  #-------------------------------------------------------------------------------------------------------------------------------#

  library
  
end

###################################################################################################################################
pre_install do |installer|
  # workaround for https://github.com/CocoaPods/CocoaPods/issues/3289
  Pod::Installer::Xcode::TargetValidator.send(:define_method, :verify_no_static_framework_transitive_dependencies) {}
end
###################################################################################################################################

#NEED_STATIC = Array [
#                      'APPDEBUG', 'APPLETs', 'ContentProvider',
#                      'LOGIN', 'MSG', 'FRIENDs', 'FRIENDs', 'EXPLORE', 'ME',
#                      'SETTING', 'UISETTING'
#                     ]

post_install do |installer|
  
  #  puts "##### post_install start #####"
  #
  #  # 为了打印的日志方便查看，使用 ╟ 符号修饰
  #  puts " ╟  installer"
  #  # 获取属性名称列表，并遍历
  #  installer.instance_variables.each do |variableName|
  #      # 打印属性名称
  #      puts "  ╟ #{variableName}"
  #      if variableName == '@generated_projects'
  #        variableName.targets.each do |target|
  #          puts "    ╟ #{target}"
  #        end
  #      end
  #  end
  
  #  installer.all_project.targets.each do |target|
  #    puts "===================>target name #{target.name}"
  #  end
  
  installer.pods_project.build_configurations.each do |config|
    config.build_settings.delete('CODE_SIGNING_ALLOWED')
    config.build_settings.delete('CODE_SIGNING_REQUIRED')
  end
  
  installer.pods_project.targets.each do |target|
    
    #    puts "===================>target name #{target.name}"
    
    #    NEED_STATIC.each do |staticTarget|
    #      if target.name == staticTarget
    #        target.build_configurations.each do |config|
    #          #将mach-o改为静态库
    #          config.build_settings['MACH_O_TYPE'] = "staticlib"
    #
    #        end
    #      end
    #    end
    
    target.build_configurations.each do |config|
      
#      if config.name == 'Release'
#        config.build_settings['GCC_VERSION']                         = 'com.apple.compilers.llvm.obfuscator.4_0';
#        config.build_settings['OTHER_CPLUSPLUSFLAGS']                ||= [
#                                                                           '$(OTHER_CFLAGS)',
#                                                                           "-mllvm",
#                                                                           "-fla",
#                                                                           "-mllvm",
#                                                                           "-sub",
#                                                                           "-mllvm",
#                                                                           "-bcf_loop=3",
#                                                                           "-mllvm",
#                                                                           "-split"
#                                                                       ]
#      end
      
      config.build_settings['LD_RUNPATH_SEARCH_PATHS']                = [ '$(FRAMEWORK_SEARCH_PATHS)' ]
      config.build_settings['WARNING_CFLAGS']                         = [
                                                                          '$(inherited)',
                                                                          '-Wnonnull',
                                                                          '-Wdocumentation',
                                                                          '-Wstrict-prototypes',
                                                                          '-Wdocumentation-html',
                                                                          '-Wdeprecated-declarations',
                                                                          '-Wnullability-completeness',
                                                                          '-Wno-nonnull',
                                                                          '-Wno-documentation',
                                                                          '-Wno-int-conversion',
                                                                          '-Wno-unused-variable',
                                                                          '-Wno-strict-prototypes',
#                                                                          '-Wno-implicit-retain-self',
                                                                          '-Wno-deprecated-declarations',
                                                                          '-Wno-nullability-completeness',
                                                                          '-Wno-nullability-completeness',
                                                                          '-Wno-nullability-completeness-on-arrays'
                                                                        ]
      config.build_settings['CLANG_WARN_DOCUMENTATION_COMMENTS']          = 'NO'
      
      config.build_settings['MACOSX_DEPLOYMENT_TARGET']               = ENV['osx.deployment_target']
      config.build_settings['TVOS_DEPLOYMENT_TARGET']                 = ENV['tvos.deployment_target']
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET']             = ENV['ios.deployment_target']
      config.build_settings['WATCHOS_DEPLOYMENT_TARGET']              = ENV['watchos.deployment_target']

      if ENV['OLLVM'] == 'YES'
        config.build_settings['LIBRARY_SEARCH_PATHS']                 = ["$(SRCROOT)/../ollvm-libs"];
        config.build_settings['OTHER_LDFLAGS']                        = ['-l"clang_rt.ios"'];
#        config.build_settings['OTHER_CFLAGS']                         = ["-mllvm -sub -mllvm -fla -mllvm -bcf"];
      end # OLLVM
      
      if config.name == 'Debug'
        config.build_settings['DEBUG_INFORMATION_FORMAT']             = 'dwarf'
      end
      
#      config.build_settings['SWIFT_VERSION']                          = '5.0'
      config.build_settings['ENABLE_BITCODE']                         = 'NO'
      
      if ENV['OLLVM'] == 'YES'
        config.build_settings['COMPILER_INDEX_STORE_ENABLE']          = 'NO'
      end # OLLVM
      
#      config.build_settings['EMBEDDED_CONTENT_CONTAINS_SWIFT']        = 'NO'
#      config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES']  = 'NO'
#      config.build_settings['CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES']  = 'YES'

      config.build_settings.delete('CODE_SIGNING_ALLOWED')
      config.build_settings.delete('CODE_SIGNING_REQUIRED')
            
#      if target.name == 'Protobuf'
#        config.build_settings['GCC_PREPROCESSOR_DEFINITIONS']         ||= [
#                                                                            '$(inherited)',
#                                                                            'GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS=1'
#                                                                          ]
#      end
      
      if target.name == 'IDEAColor'
        config.build_settings['GCC_PREPROCESSOR_DEFINITIONS']         ||= [
                                                                            '$(inherited)',
                                                                            'UICOLOR_SYSTEM=0'
                                                                          ]
      end
      
      if target.name == 'IDEAUIVendor'
        config.build_settings['GCC_PREPROCESSOR_DEFINITIONS']         ||= [
                                                                            '$(inherited)',
                                                                            'APP_NAVIGATION_BAR_BACKGROUND_IMAGE=0'
                                                                          ]
      end
      
      if target.name == 'IDEAKit'
        config.build_settings['GCC_PREPROCESSOR_DEFINITIONS']         ||= [
                                                                            '$(inherited)',
                                                                            'APP_SCHEME=\"NetworkArch://\"',
                                                                            'APP_BUNDLE_IDENTIFIER=\"com.idea.NetworkArch\"',
                                                                            'APP_BUNDLE_IDENTIFIER_GROUP=\"group.com.idea.NetworkArch\"',
                                                                            'APP_BUNDLE_IDENTIFIER_WIDGET=\"com.idea.NetworkArch.Widget\"',
                                                                            'APP_ID=\"1579612932\"'
                                                                          ]
      end

      if target.name == 'IDEAUIKit'
        config.build_settings['GCC_PREPROCESSOR_DEFINITIONS']         ||= [
                                                                            '$(inherited)',
                                                                            'HV_TABLE_VIEW=0',
                                                                            'MB_SLIDER_VIEW=0',
                                                                            'MK_MAP_VIEW_ZOOM_LEVEL=0',
                                                                            'UI_CAMERA_BUTTON=0',
                                                                            'UI_CHART_VIEW=0',
                                                                            'UI_CYCLE_SCROLL_VIEW=0',
                                                                            'UI_DROP_REFRESH=0',
                                                                            'UI_SEVEN_SWITCH=0',
                                                                          ]
      end

      if target.name == 'IDEAAppletDebugger'
        config.build_settings['GCC_PREPROCESSOR_DEFINITIONS']         ||= [
                                                                            '$(inherited)',
                                                                            ' SERVICE_BORDER=0 ',
                                                                            ' SERVICE_CONSOLE=0 ',
                                                                            ' SERVICE_GESTURE=0 ',
                                                                            ' SERVICE_GRIDS=0 ',
                                                                            ' SERVICE_INSPECTOR=0 ',
                                                                            ' SERVICE_MONITOR=0 ',
                                                                            ' SERVICE_FILE_SYNC=0 ',
                                                                            ' SERVICE_TAPSPOT=0 ',
                                                                            ' SERVICE_THEME=1 ',
                                                                            ' SERVICE_WIFI=0 '
                                                                          ]
      end

      config.build_settings['GCC_PREPROCESSOR_DEFINITIONS']           ||= [
                                                                            '$(inherited)',
                                                                            'TRANSITION_ANIMATION_BOUNCE=30',
                                                                            'GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS=1'
                                                                          ]

    end
  end
end

#post_install do |installer_representation|
#  installer_representation.pods_project.targets.each do |target|
#    if target.name == 'DJIWidget'
#      target.build_configurations.each do |config|
#        config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= ['$(inherited)', 'ENABLED_LIVESTREAM_AUDIO_INPUT=1']
#      end
#    end
#  end
#end

###################################################################################################################################

