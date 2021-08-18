# source 'https://github.com/CocoaPods/Specs.git'
# source 'https://cdn.cocoapods.org/'
# source 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'

install! 'cocoapods', :deterministic_uuids                => false
#install! 'cocoapods', :generate_multiple_pod_projects     => true
#install! 'cocoapods', :warn_for_unused_master_specs_repo  => false

#install! 'cocoapods', :deterministic_uuids => false, :warn_for_unused_master_specs_repo  => false

# applet_webcore=YES pod update

###################################################################################################################################

ENV['OLLVM']                      = 'NO'

ENV['IDEAFONT_HY']                = 'YES'
ENV['IDEAFONT_MSYH']              = 'NO'
ENV['IDEAFONT_ZEKTON']            = 'YES'
ENV['IDEAFONT']                   = 'YES'

#ENV['IDEA_MATERIAL_COMPONENTS']   = 'YES'

ENV['IDEA_YYKIT']                 = 'YES'
ENV['IDEA_AFNETWORKING']          = 'NO'
ENV['IDEA_FOUNDATION_EXTENSION']  = 'YES'

ENV['IDEA_SERVICE_FILE_SYNC']   = 'NO'

###################################################################################################################################

def miniwing_pod(pod_name, file = pod_name, type = 'remote', branch = 'master', modular_headers = true)
  case type
    when 'local'
      pod pod_name, :path => "../../MINIWING-PODs/#{file}",                :inhibit_warnings => false, :modular_headers => modular_headers
    when 'remote'
      pod pod_name, :git  => "git@github.com:miniwing/#{file}.git", :branch => "#{branch}",     :modular_headers => modular_headers
    else
  end
end

# git@github.com:miniwing/FoundationExtension.git
# https://github.com/miniwing/#{file}.git

###################################################################################################################################

workspace 'Idea.NetworkArch'

project 'NetworkArch/NetworkArch.xcodeproj'

use_frameworks!
#use_modular_headers!
inhibit_all_warnings!

platform :ios, '10.0'

###################################################################################################################################

def library
  
  pod 'APPDATA'                         , :path => 'APPDATA'

  if ENV['IDEA_FOUNDATION_EXTENSION'] == 'YES'
    miniwing_pod('FoundationExtension', file = 'FoundationExtension', type = 'remote', branch = 'master', modular_headers = true)
  end # IDEA_FOUNDATION_EXTENSION

  miniwing_pod('UIKitExtension', file = 'FoundationExtension', type = 'remote', branch = 'master', modular_headers = true)

  if ENV['IDEA_YYKIT'] == 'YES'
    pod 'YYKit'                         , :path => '../MINIWING-PODs/YYKit'
  end # IDEA_YYKIT

  if ENV['IDEA_AFNETWORKING'] == 'YES'
    pod 'AFNetworking'                  , :path => '../MINIWING-PODs/AFNetworking'            , :configurations => ['Debug']
#    pod 'AFNetworking'                  , :path => '../MINIWING-PODs/AFNetworking'
  else
    pod 'AFNetworking/Reachability'     , :path => '../MINIWING-PODs/AFNetworking'
  end # IDEA_AFNETWORKING

  if ENV['IDEAFONT'] == 'YES'
    pod 'IDEAFONT'                      , :path => '../MINIWING-PODs/IDEAFONT'
  end # IDEAFONT

  pod 'IDEAKit'                         , :path => '../MINIWING-PODs/IDEAKit'
  pod 'IDEAColor'                       , :path => '../MINIWING-PODs/IDEAColor'
  pod 'IDEAPalettes'                    , :path => '../MINIWING-PODs/IDEAPalettes'

  pod 'IDEAApplet'                      , :path => '../MINIWING-PODs/Idea.Applets'

end

###################################################################################################################################

target 'APPBase' do
  
  library

end

###################################################################################################################################

target 'NetworkArch' do
#  platform :ios, '10.0'
#  plugin 'cocoapods-hmap-prebuilt'
  
#  pod 'MMKV'

#  pod 'PromisesObjC'
#  pod 'Masonry'
#  pod 'Appirater'
#  pod 'ZKCycleScrollView'
#  pod 'NetUtils'
  
  pod 'RTRootNavigationController'

  if ENV['IDEA_MATERIAL_COMPONENTS'] == 'YES'
#    pod 'MaterialComponents'
#    pod 'MaterialComponents/Palettes'
#    pod 'MaterialComponents/AppBar'
#    pod 'MaterialComponents/ActivityIndicator'
  end # IDEA_MATERIAL_COMPONENTS
  
  pod 'MaterialComponents/Palettes'
  pod 'MaterialComponents/AppBar'
  pod 'MaterialComponents/ActivityIndicator'

#  pod 'FloatingPanel'

  #-------------------------------------------------------------------------------------------------------------------------------#
#  pod 'DoraemonKit'                                                                           , :configurations => ['Debug']
#  pod 'YKWoodpecker'                                                                          , :configurations => ['Debug']
  pod 'Reveal-SDK'                      , '~> 24'                                             , :configurations => ['Debug']
  #-------------------------------------------------------------------------------------------------------------------------------#
  pod 'APPDEBUG'                        , :path => 'APPDEBUG'                                 , :configurations => ['Debug']
#  pod 'Reveal-SDK'                      , :path => '../MINIWING-PODs/Reveal'                  , :configurations => ['Debug']
#  pod 'AFNetworkActivityLogger'         , :path => '../MINIWING-PODs/AFNetworkActivityLogger' , :configurations => ['Debug']
  #-------------------------------------------------------------------------------------------------------------------------------#
  pod 'IDEAPing'                        , :path => '../MINIWING-PODs/IDEAPing'
  pod 'IDEARoute'                       , :path => '../MINIWING-PODs/IDEARoute'
  pod 'IDEANetUtils'                    , :path => '../MINIWING-PODs/IDEANetUtils'
#  pod 'IDEAThrottle'                    , :path => '../MINIWING-PODs/IDEAThrottle'
#  miniwing_pod('IDEAThrottle', file = 'IDEAThrottle', type = 'local', branch = 'develop', modular_headers = true)
#-------------------------------------------------------------------------------------------------------------------------------#
#  pod 'IDEAEventKit'                    , :path => '../MINIWING-PODs/IDEAEventKit'
  pod 'IDEAUIKit'                       , :path => '../MINIWING-PODs/IDEAUIKit'

#  pod 'IDEANightVersion'                , :path => '../MINIWING-PODs/IDEANightVersion'
  miniwing_pod('IDEANightVersion', file = 'IDEANightVersion', type = 'local', branch = 'develop', modular_headers = true)
#  pod 'IDEASkeletonAnimated'            , :path => '../MINIWING-PODs/IDEASkeletonAnimated'
  pod 'IDEAUIVendor'                    , :path => '../MINIWING-PODs/IDEAUIVendor'
  miniwing_pod('IDEATabBarControllerTransition', file = 'IDEATabBarControllerTransition', type = 'local', branch = 'develop', modular_headers = true)
  #-------------------------------------------------------------------------------------------------------------------------------#
#  miniwing_pod('IDEAEventBus', file = 'IDEAEventBus', type = 'local', branch = 'develop', modular_headers = true)
  #-------------------------------------------------------------------------------------------------------------------------------#
#  pod 'IDEAApplet'                      , :path => '../MINIWING-PODs/Idea.Applets'
  pod 'IDEAAppletDebugger'              , :path => '../MINIWING-PODs/Idea.Applets'            , :configurations => ['Debug']
  #-------------------------------------------------------------------------------------------------------------------------------#

#  pod 'GoogleAnalytics'
#  pod 'Firebase'

  #-------------------------------------------------------------------------------------------------------------------------------#

  library
  
end

###################################################################################################################################

target 'TodayClip' do

  pod 'Reveal-SDK'                      , '~> 24'                                             , :configurations => ['Debug']

  pod 'IDEAUIKit'                       , :path => '../MINIWING-PODs/IDEAUIKit'
  pod 'IDEAUIVendor'                    , :path => '../MINIWING-PODs/IDEAUIVendor'

  pod 'IDEARoute'                       , :path => '../MINIWING-PODs/IDEARoute'
  pod 'IDEAApplet'                      , :path => '../MINIWING-PODs/Idea.Applets'

  library
  
end

###################################################################################################################################

target 'TodayWidget' do
  
  pod 'Reveal-SDK'                      , '~> 24'                                             , :configurations => ['Debug']

#  pod 'MMKVAppExtension'

  pod 'IDEAUIKit'                       , :path => '../MINIWING-PODs/IDEAUIKit'
  pod 'IDEAUIVendor'                    , :path => '../MINIWING-PODs/IDEAUIVendor'

  pod 'IDEARoute'                       , :path => '../MINIWING-PODs/IDEARoute'
  pod 'IDEAApplet'                      , :path => '../MINIWING-PODs/Idea.Applets'

  library
  
end

###################################################################################################################################

target 'FleetingWidget' do

  pod 'Reveal-SDK'                      , '~> 24'                                             , :configurations => ['Debug']

#  pod 'MMKVAppExtension'

  library
  
end

###################################################################################################################################
pre_install do |installer|
  # workaround for https://github.com/CocoaPods/CocoaPods/issues/3289
  Pod::Installer::Xcode::TargetValidator.send(:define_method, :verify_no_static_framework_transitive_dependencies) {}
end
###################################################################################################################################
post_install do |installer|

#  puts "##### post_install start #####"
#
#  # 为了打印的日志方便查看，使用╟符号修饰
#  puts "╟ installer"
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
    
    target.build_configurations.each do |config|
      
#      if config.name == 'Release'
#        config.build_settings['GCC_VERSION']                  = 'com.apple.compilers.llvm.obfuscator.4_0';
#        config.build_settings['OTHER_CPLUSPLUSFLAGS']       ||= [
#                                                                  '$(OTHER_CFLAGS)',
#                                                                  "-mllvm",
#                                                                  "-fla",
#                                                                  "-mllvm",
#                                                                  "-sub",
#                                                                  "-mllvm",
#                                                                  "-bcf_loop=3",
#                                                                  "-mllvm",
#                                                                  "-split"
#                                                                ]
#      end

      config.build_settings['LD_RUNPATH_SEARCH_PATHS']        = ['$(FRAMEWORK_SEARCH_PATHS)']
      config.build_settings['WARNING_CFLAGS']                 = ['-Wdeprecated-declarations']
      
      if ENV['OLLVM'] == 'YES'
#        config.build_settings['HEADER_SEARCH_PATHS']          = ["$(SRCROOT)/../ollvm-libs"];
        config.build_settings['LIBRARY_SEARCH_PATHS']         = ["$(SRCROOT)/../ollvm-libs"];
        config.build_settings['OTHER_LDFLAGS']                = ["-l\"clang_rt.ios\""];
      end # OLLVM
      
#      config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'NO'
      if config.name == 'Debug'
        config.build_settings['DEBUG_INFORMATION_FORMAT']     = 'dwarf'
      end
#      config.build_settings['SWIFT_VERSION']                  = '5.0'
      config.build_settings['ENABLE_BITCODE']                 = 'NO'
      config.build_settings['COMPILER_INDEX_STORE_ENABLE']    = 'NO'

#      config.build_settings['EMBEDDED_CONTENT_CONTAINS_SWIFT']                      = 'NO'
#      config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES']                = 'NO'
#      config.build_settings['CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES']= 'YES'

      config.build_settings['MACOSX_DEPLOYMENT_TARGET']       = '10.10'
      config.build_settings['TVOS_DEPLOYMENT_TARGET']         = '10.0'
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET']     = '10.0'
      config.build_settings['WATCHOS_DEPLOYMENT_TARGET']      = '4.3'
#      if config.build_settings['MACOSX_DEPLOYMENT_TARGET'].to_f < 10.13
#         config.build_settings['MACOSX_DEPLOYMENT_TARGET']    = '10.13'
#      end

      config.build_settings.delete('CODE_SIGNING_ALLOWED')
      config.build_settings.delete('CODE_SIGNING_REQUIRED')

      config.build_settings['WARNING_CFLAGS']                 = [
                                                                  '$(inherited)',
                                                                  '-Wnonnull',
                                                                  '-Wdocumentation',
                                                                  '-Wnullability-completeness'
                                                                ]

      if target.name == 'IDEAColor'
        config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
                                                                    '$(inherited)',
                                                                    'UICOLOR_SYSTEM=0'
                                                                  ]
      end

      if target.name == 'IDEAUIVendor'
        config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
                                                                    '$(inherited)',
                                                                    'APP_NAVIGATION_BAR_BACKGROUND_IMAGE=0'
                                                                  ]
      end

      if target.name == 'IDEAKit'
        config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
                                                                   '$(inherited)',
                                                                   'APP_SCHEME=\@\"NetworkArch://\"',
                                                                   'APP_BUNDLE_IDENTIFIER=\@\"com.idea.NetworkArch\"',
                                                                   'APP_BUNDLE_IDENTIFIER_GROUP=\@\"group.com.idea.NetworkArch\"',
                                                                   'APP_BUNDLE_IDENTIFIER_WIDGET=\@\"com.idea.NetworkArch.Widget\"',
                                                                   'APP_ID=1568321747',
#                                                                   'IDEAKIT_AFNETWORKING_OPERATIONS=1',
                                                                   'FY_TRANSITION=0',
                                                                   'NS_EVIL_TRANSFORM=0'
                                                                   ]
      end

      if target.name == 'IDEAUIKit'
        config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
                                                                   '$(inherited)',
                                                                   'HV_TABLE_VIEW=0',
                                                                   'MB_SLIDER_VIEW=0',
                                                                   'MK_MAP_VIEW_ZOOM_LEVEL=0',
                                                                   'UI_CAMERA_BUTTON=0',
                                                                   'UI_CHART_VIEW=0',
                                                                   'UI_CYCLE_SCROLL_VIEW=0',
                                                                   'UI_DROP_REFRESH=0',
                                                                   'UI_SEVEN_SWITCH=0',
                                                                   'UI_WATER_DROP_VIEW=0'
                                                                   ]
      end

#      if target.name == 'IDEAExtension'
#        config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
#                                                                   '$(inherited)',
#                                                                   'APP_SCHEME=\@\"NetworkArch://\"',
#                                                                   'APP_BUNDLE_IDENTIFIER=\@\"com.idea.NetworkArch\"',
#                                                                   'APP_BUNDLE_IDENTIFIER_GROUP=\@\"group.com.idea.NetworkArch\"',
#                                                                   'APP_BUNDLE_IDENTIFIER_WIDGET=\@\"com.idea.NetworkArch.Widget\"',
#                                                                   ]
#      end

      if target.name == 'IDEAWaterDropView'
        config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
                                                                   '$(inherited)',
                                                                   'IDEA_WATER_DROP_VIEW=1'
                                                                   ]
      end

      if target.name == 'IDEAAppletDebugger'
        config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
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

      if target.name == 'IDEAFONT'
        config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
                                                                   '$(inherited)',
                                                                   'IDEA_FONT_BOLD=0'
                                                                   ]
      end

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

