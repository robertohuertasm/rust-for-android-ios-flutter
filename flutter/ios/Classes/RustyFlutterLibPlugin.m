#import "RustyFlutterLibPlugin.h"
#import <rusty_flutter_lib/rusty_flutter_lib-Swift.h>

@implementation RustyFlutterLibPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftRustyFlutterLibPlugin registerWithRegistrar:registrar];
}
@end
