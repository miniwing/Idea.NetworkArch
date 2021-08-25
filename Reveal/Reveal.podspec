Pod::Spec.new do |s|
  s.name        = "Reveal"
  s.version     = "24.12917"
  s.summary     = "Reveal iOS SDK"
  s.homepage    = "https://www.google.com"
  s.license     = "MIT"
  s.author      = { "Harry" => "miniwing.hz@gmail.com" }
  
  s.ios.deployment_target   = '10.0'
  s.source                  = { :path => "." }
  s.ios.vendored_frameworks = 'RevealServer.framework'
  s.ios.libraries           = 'z'

end
