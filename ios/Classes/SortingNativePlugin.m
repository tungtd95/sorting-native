#import "SortingNativePlugin.h"
#if __has_include(<sorting_native/sorting_native-Swift.h>)
#import <sorting_native/sorting_native-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "sorting_native-Swift.h"
#endif

@implementation SortingNativePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSortingNativePlugin registerWithRegistrar:registrar];
}
@end
