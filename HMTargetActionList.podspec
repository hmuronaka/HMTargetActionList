Pod::Spec.new do |spec|
  spec.name         = 'HMTargetActionList'
  spec.version      = '1.0.1'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/hmuronaka/HMTargetActionList'
  spec.authors      = { 'Hiroaki Muronaka' => 'capriccio27@gmail.com' }
  spec.summary      = 'HMTargetActionList'
  spec.source       = { :git => 'https://github.com/hmuronaka/HMTargetActionList.git', :tag => '1.0.1' }
  spec.source_files = 'HMTargetActionList/Class/**/*.{h,m}'
  spec.requires_arc = true
  #spec.dependency "GCDWebServer", "~> 3.0"
  #spec.dependency "GCDWebServer/WebDAV", "~> 3.0" 
end

