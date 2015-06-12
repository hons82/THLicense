THLicense
===

[![Pod Version](http://img.shields.io/cocoapods/v/THLicense.svg?style=flat)](http://cocoadocs.org/docsets/THLicense/)
[![Pod Platform](http://img.shields.io/cocoapods/p/THLicense.svg?style=flat)](http://cocoadocs.org/docsets/THLicense/)
[![Pod License](http://img.shields.io/cocoapods/l/THLicense.svg?style=flat)](http://opensource.org/licenses/MIT)

These classes are supposed to be used inside your frameworks when you want to provide certain pro-features to customers that pay a license fee or limit the whole use od the framework to the simulator.

# Installation

### CocoaPods

Install with [CocoaPods](http://cocoapods.org) by adding the following to your Podfile:

``` ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'

use_frameworks!

pod 'THLicense', '~> 0.1.0'
```

**Note**: We follow http://semver.org for versioning the public API.

### Manually

That's a bit complex, as CommonCrypto is not (yet) available directly to swift. So what you need to do is
- copy the Files under ./THLicense/
- Create a CommonCrypto directory inside the project directory. 
- create a module.map file to allow us to use the CommonCrypto library as a module within Swift.

```
module CommonCrypto [system] {
    header "/usr/include/CommonCrypto/CommonCrypto.h"
    export *
}
```
- Add ```CommonCrypto```to the "Build Settings --> SwiftCompiler - Search Paths --> Import Paths"
# Usage

```Swift
// Set a License key (That will be provided by your customer)
THLicense.sharedLicense.setLicenseKey("db693f13bf2267c510a2e202afcca4067a16d8ed")
// Set a constant Salt
THLicense.sharedLicense.setSalt("123456")
// Only during development
//THLicense.sharedLicense.debugMode = true

// Check if the License is valid
if (THLicense.sharedLicense.isLicenseValid()) {
    // continue with your framework execution
}
```

If you put it in debug mode it will show you in the log the possible valid license keys. Currently it uses the bundleId and the salt to create the keys and checks are performed in the following order
- org.company.Appname + Salt
- org.company + Salt

In that way you can sell licenses to all APPs in a company or just for a single App

#Contributions

...are really welcome. Maybe there is a better way of doing this checks, or it needs additional settings, so I'd like to improve it with your help.

# License

Source code of this project is available under the standard MIT license. Please see [the license file](LICENSE.md).


