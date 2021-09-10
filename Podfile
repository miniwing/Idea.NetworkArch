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

ENV['OLLVM']                      = 'NO'

ENV['IDEAFONT_HY']                = 'NO'
ENV['IDEAFONT_MSYH']              = 'NO'
ENV['IDEAFONT_ZEKTON']            = 'YES'
ENV['IDEAFONT']                   = 'YES'

#ENV['IDEA_MATERIAL_COMPONENTS']   = 'YES'

ENV['IDEA_AFNETWORKING']          = 'NO'

ENV['IDEA_FOUNDATION_EXTENSION']  = 'YES'
ENV['IDEA_UIKIT_EXTENSION']       = 'YES'

ENV['IDEA_YYKIT']                 = 'YES'

ENV['IDEA_SERVICE_FILE_SYNC']     = 'NO'

###################################################################################################################################

def github_pod(pod_name, file = pod_name, type = 'remote', branch = 'master', configurations = ['Debug', 'Release'], modular_headers = true)
#  puts "github_pod :: pod_name : #{pod_name} +++ configurations : #{configurations}"
  case type
    when 'local'
      pod pod_name, :path   => "../../MINIWING-PODs/#{file}",
                    :inhibit_warnings => true,
#                    :modular_headers  => modular_headers,
                    :configurations   => configurations
    when 'remote'
      pod pod_name, :git    => "git@github.com:miniwing/#{file}.git",
                    :branch => "#{branch}",
                    :inhibit_warnings => true,
#                    :modular_headers  => modular_headers,
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
#                    :modular_headers  => modular_headers,
                    :configurations   => configurations
    when 'remote'
      pod pod_name, :git    => "git@github.com:miniwing/MINIWING-PODs.git",
                    :branch => "#{branch}",
                    :inhibit_warnings => true,
#                    :modular_headers  => modular_headers,
                    :configurations   => configurations
    else
  end
end

###################################################################################################################################

workspace 'Idea.NetworkArch'

project 'NetworkArch/NetworkArch.xcodeproj'

use_frameworks!
#use_modular_headers!
inhibit_all_warnings!

platform :ios, '10.0'

###################################################################################################################################

def library
  
  if ENV['IDEA_FOUNDATION_EXTENSION'] == 'YES'
    github_pod('FoundationExtension', file = 'FoundationExtension', type = 'remote', branch = 'develop')
  end # IDEA_FOUNDATION_EXTENSION

  if ENV['IDEA_UIKIT_EXTENSION'] == 'YES'
    github_pod('UIKitExtension', file = 'FoundationExtension', type = 'remote', branch = 'develop')
  end # IDEA_FOUNDATION_EXTENSION

  if ENV['IDEA_YYKIT'] == 'YES'
    github_pod('YYKit', file = 'YYKit', type = 'remote', branch = 'develop')
  end # IDEA_YYKIT

  if ENV['IDEA_AFNETWORKING'] == 'YES'
    github_pod('AFNetworking', file = 'AFNetworking', type = 'remote', branch = 'develop')
  else
    github_pod('AFNetworking/Reachability', file = 'AFNetworking', type = 'remote', branch = 'develop')
  end # IDEA_AFNETWORKING

  if ENV['IDEAFONT'] == 'YES'
    miniwing_pod('IDEAFONT', type = 'remote', branch = 'develop')
  end # IDEAFONT

  miniwing_pod('IDEAKit', type = 'remote', branch = 'develop')
  miniwing_pod('IDEAColor', type = 'remote', branch = 'develop')
  miniwing_pod('IDEAPalettes', type = 'remote', branch = 'develop')

  if ENV['OLLVM'] == 'YES'
    miniwing_pod('ollvm', type = 'remote', branch = 'develop')
  end # OLLVM
  
  github_pod('IDEAApplet', file = 'IDEAApplet', type = 'remote', branch = 'develop')

  pod 'APPDATA' , :path => 'APPDATA'
  pod 'APPDEBUG', :path => 'APPDEBUG', :configurations => ['Debug']

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
  pod 'Appirater'
#  pod 'ZKCycleScrollView'
  
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
  #  pod 'DoraemonKit', :configurations => ['Debug']
  #  pod 'YKWoodpecker', :configurations => ['Debug']
  pod 'Reveal-SDK', '~> 24', :configurations => ['Debug']
  #-------------------------------------------------------------------------------------------------------------------------------#
  #-------------------------------------------------------------------------------------------------------------------------------#
  miniwing_pod('IDEAPing', type = 'remote', branch = 'develop')
  miniwing_pod('IDEARouter', type = 'remote', branch = 'develop')
  miniwing_pod('IDEANetUtils', type = 'remote', branch = 'develop')
#-------------------------------------------------------------------------------------------------------------------------------#
  miniwing_pod('IDEAUIKit', type = 'remote', branch = 'develop')
  miniwing_pod('IDEAUIVendor', type = 'remote', branch = 'develop')
  #-------------------------------------------------------------------------------------------------------------------------------#
  miniwing_pod('IDEANightVersion', type = 'remote', branch = 'develop')
  miniwing_pod('IDEATabBarControllerTransition', type = 'remote', branch = 'develop')
  #-------------------------------------------------------------------------------------------------------------------------------#
#  github_pod('IDEAApplet', file = 'IDEAApplet', type = 'remote', branch = 'develop')
  github_pod('IDEAAppletDebugger', file = 'IDEAApplet', type = 'remote', branch = 'develop', configurations = ['Debug'])
  #-------------------------------------------------------------------------------------------------------------------------------#

#  pod 'GoogleAnalytics'
#  pod 'Firebase'

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
  
  pod 'Reveal-SDK', '~> 24', :configurations => ['Debug']

#  pod 'MMKVAppExtension'

  miniwing_pod('IDEAUIKit', type = 'remote', branch = 'develop')
  miniwing_pod('IDEAUIVendor', type = 'remote', branch = 'develop')

  miniwing_pod('IDEARouter', type = 'remote', branch = 'develop')

  library
  
end

###################################################################################################################################

target 'FleetingWidget' do

  pod 'Reveal-SDK', '~> 24', :configurations => ['Debug']

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

      config.build_settings['LD_RUNPATH_SEARCH_PATHS']          = ['$(FRAMEWORK_SEARCH_PATHS)']
      config.build_settings['WARNING_CFLAGS']                   = [
                                                                    '-Wdeprecated-declarations',
                                                                    '-Wdocumentation-html',
                                                                    '-Wdocumentation',
                                                                    '-Wstrict-prototypes'
                                                                  ]
      config.build_settings['CLANG_WARN_DOCUMENTATION_COMMENTS']= 'NO'

      if ENV['OLLVM'] == 'YES'
        config.build_settings['LIBRARY_SEARCH_PATHS']         = ["$(SRCROOT)/../ollvm-libs"];
        config.build_settings['OTHER_LDFLAGS']                = ["-l\"clang_rt.ios\""];
#        config.build_settings['OTHER_CFLAGS']                 = ["-mllvm -sub -mllvm -fla -mllvm -bcf"];
      end # OLLVM
      
#      config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'NO'
      if config.name == 'Debug'
        config.build_settings['DEBUG_INFORMATION_FORMAT']     = 'dwarf'
      end
#      config.build_settings['SWIFT_VERSION']                  = '5.0'
      config.build_settings['ENABLE_BITCODE']                 = 'NO'
      if ENV['OLLVM'] == 'YES'
        config.build_settings['COMPILER_INDEX_STORE_ENABLE']  = 'NO'
      end # OLLVM

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

