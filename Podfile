# source 'https://github.com/CocoaPods/Specs.git'
# source 'https://cdn.cocoapods.org/'
# source 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'

install! 'cocoapods', :deterministic_uuids                => false
#install! 'cocoapods', :generate_multiple_pod_projects => true
#install! 'cocoapods', :warn_for_unused_master_specs_repo  => false

#install! 'cocoapods', :deterministic_uuids => false, :warn_for_unused_master_specs_repo  => false

# applet_webcore=YES pod update

workspace 'Idea.NetworkArch'

project 'NetworkArch/NetworkArch.xcodeproj'

use_frameworks!
#use_modular_headers!
inhibit_all_warnings!

platform :ios, '10.0'

###################################################################################################################################

def library
  
  pod 'FoundationExtension'
  pod 'UIKitExtension'
  
#  pod 'MBProgressHUD'
  
#  pod 'FMDB'

  pod 'YYKit'                           , :path => '../MINIWING-PODs/YYKit'
#  pod 'AFNetworking'                    , :path => '../MINIWING-PODs/AFNetworking'

  pod 'IDEAKit'                         , :path => '../MINIWING-PODs/IDEAKit'
  pod 'IDEAColor'                       , :path => '../MINIWING-PODs/IDEAColor'
  pod 'IDEAPalettes'                    , :path => '../MINIWING-PODs/IDEAPalettes'
  pod 'IDEANightVersion'                , :path => '../MINIWING-PODs/IDEANightVersion'
  pod 'IDEAFONT'                        , :path => '../MINIWING-PODs/IDEAFONT'

  pod 'APPDATA'                         , :path => 'APPDATA'

end

###################################################################################################################################

target 'APPBase' do
  
  library

end

###################################################################################################################################

target 'NetworkArch' do
#  platform :ios, '10.0'
#  plugin 'cocoapods-hmap-prebuilt'
  
#  pod 'PromisesObjC'
  
#  pod 'Masonry'
  
#  pod 'Appirater'  
  pod 'RTRootNavigationController'
#  pod 'ZKCycleScrollView'

#  pod 'FGRoute'

#  pod 'MaterialComponents'              , :path => 'LocalModule/MaterialComponents'
#  pod 'MDFInternationalization'         , :path => 'LocalModule/MaterialComponents'
#  pod 'MDFTextAccessibility'            , :path => 'LocalModule/MaterialComponents'
#  pod 'MotionAnimator'                  , :path => 'LocalModule/MaterialComponents'
#  pod 'MotionInterchange'               , :path => 'LocalModule/MaterialComponents'
  
  pod 'MaterialComponents/Palettes'
  pod 'MaterialComponents/AppBar'
  pod 'MaterialComponents/ActivityIndicator'

#  pod 'FloatingPanel'
#  pod 'FloatingPanel'                   , '~> 1.7.6'
#  pod 'FloatingPanel'                   , '~> 2.0.0'

#  pod 'HHTransition'
#  pod 'HHTransition'                    , '~> 2.0.0'

#  pod 'AFNetworking'

#  pod 'JXCategoryView'
#  pod 'JXPagingView/Pager'

  #-------------------------------------------------------------------------------------------------------------------------------#
  pod 'Reveal-SDK'                      , '~> 24' , :configurations => ['Debug']
  #-------------------------------------------------------------------------------------------------------------------------------#
  pod 'APPDEBUG'                        , :path => 'APPDEBUG'                                 , :configurations => ['Debug']
#  pod 'Reveal-SDK'                      , :path => '../MINIWING-PODs/Reveal'                  , :configurations => ['Debug']
#  pod 'AFNetworkActivityLogger'         , :path => '../MINIWING-PODs/AFNetworkActivityLogger' , :configurations => ['Debug']
  #-------------------------------------------------------------------------------------------------------------------------------#
#  pod 'APPDATA'                         , :path => 'APPDATA'
#  pod 'APPResources'                    , :path => 'APPResources'
  #-------------------------------------------------------------------------------------------------------------------------------#
#  pod 'IDEAFONT'                        , :path => '../MINIWING-PODs/IDEAFONT'
#  pod 'IDEAFONT/HY'                     , :path => '../MINIWING-PODs/IDEAFONT'
#  pod 'IDEAFONT/Zekton'                 , :path => '../MINIWING-PODs/IDEAFONT'
#  pod 'IDEAResources'                   , :path => '../MINIWING-PODs/IDEAResources'
  #-------------------------------------------------------------------------------------------------------------------------------#
#  pod 'IDEARefresh'                     , :path => '../MINIWING-PODs/IDEARefresh'
#  pod 'IDEANibBridge'                   , :path => '../MINIWING-PODs/IDEANibBridge'
  pod 'IDEAUIKit'                       , :path => '../MINIWING-PODs/IDEAUIKit'
  pod 'IDEAUIVendor'                    , :path => '../MINIWING-PODs/IDEAUIVendor'
  pod 'IDEARoute'                       , :path => '../MINIWING-PODs/IDEARoute'
#  pod 'IDEAWaterDropView'               , :path => '../MINIWING-PODs/IDEAWaterDropView'
#  pod 'IDEANavigationBar'               , :path => '../MINIWING-PODs/IDEANavigationBar'
#  pod 'IDEASearchController'            , :path => '../MINIWING-PODs/IDEASearchController'

#  pod 'IDEAPageKit'                     , :path => '../MINIWING-PODs/IDEAPageKit'
#  pod 'IDEATransition'                  , :path => '../MINIWING-PODs/IDEATransition'
#  pod 'IDEAViewAnimator'                , :path => '../MINIWING-PODs/IDEAViewAnimator'
#  pod 'IDEASkeletonAnimated'            , :path => '../MINIWING-PODs/IDEASkeletonAnimated'
  pod 'IDEATabBarControllerTransition'  , :path => '../MINIWING-PODs/IDEATabBarControllerTransition'
#  pod 'IDEAFloatingPanel'               , :path => '../MINIWING-PODs/IDEAFloatingPanel'
#  pod 'IDEAPopController'               , :path => '../MINIWING-PODs/IDEAPopController'
#  pod 'IDEAPanModal'                    , :path => '../MINIWING-PODs/IDEAPanModal'
  #-------------------------------------------------------------------------------------------------------------------------------#
#  pod 'IDEAEffectSDK'                   , :path => '../MINIWING-PODs/IDEAEffectSDK'
#  pod 'IDEAMediaEditor'                 , :path => '../MINIWING-PODs/IDEAMediaEditor'
#  pod 'IDEAMediaPlayer'                 , :path => '../MINIWING-PODs/IDEAMediaPlayer'
  #-------------------------------------------------------------------------------------------------------------------------------#
#  pod 'IDEAApplet'                      , :git => 'https://github.com/miniwing/Idea.Applets.git'
#  pod 'IDEAAppletDebugger'              , :git => 'https://github.com/miniwing/Idea.Applets.git'
  pod 'IDEAApplet'                      , :path => '../MINIWING-PODs/Idea.Applets'
  pod 'IDEAAppletDebugger'              , :path => '../MINIWING-PODs/Idea.Applets'            , :configurations => ['Debug']
  #-------------------------------------------------------------------------------------------------------------------------------#

#  pod 'GoogleAnalytics'
#  pod 'Firebase'

  #-------------------------------------------------------------------------------------------------------------------------------#

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

#      config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'NO'
#      config.build_settings['DEBUG_INFORMATION_FORMAT']              = 'dwarf'
#      config.build_settings['SWIFT_VERSION']                  = '5.0'
      config.build_settings['ENABLE_BITCODE']                 = 'YES'

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
                                                                   ' SERVICE_INSPECTOR=1 ',
                                                                   ' SERVICE_MONITOR=0 ',
                                                                   ' SERVICE_TAPSPOT=0 ',
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

