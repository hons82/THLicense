Pod::Spec.new do |s|
	s.name					= 'THLicense'
	s.version				= '0.0.1'
	s.summary				= 'Validate licenses inside a framework'
	s.description			= <<-DESC
These classes are supposed to be used inside your frameworks when you want to provide certain pro-features to customers that pay a license fee or limit the whole use od the framework to the simulator.
DESC
	s.homepage				= 'https://github.com/hons82/THLicense'
	s.license				= { :type => 'MIT', :file => 'LICENSE.md' }
	s.author				= { 'Hannes Tribus' => 'hons82@gmail.com' }
	s.source				= { :git => 'https://github.com/hons82/THLicense.git', :tag => "v#{s.version}" }
	s.platform				= :ios, '8.0'
	s.requires_arc			= true
	s.default_subspec		= 'Core'
	s.header_mappings_dir	= 'THLicense'

	s.subspec 'Core' do |c|
		c.source_files		= 'THLicense/*.{h,swift}'
		c.dependency		  'THLicense/Hashing'
	end
	s.subspec 'Hashing' do |h|
		h.source_files		= 'THLicense/Hashing/*.swift'
		h.resources			= ["CommonCrypto/*.map"]
		h.xcconfig			= {'SWIFT_INCLUDE_PATHS' => '${PODS_ROOT}/THLicense/CommonCrypto'}
	end
end