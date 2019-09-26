#import <Flutter/Flutter.h>
#import <UIKit/UIKit.h>
#import "FlutterBBDAppDelegate.h"

@import GD.Runtime;

@interface FlutterPluginBbdBasePlugin : NSObject<FlutterPlugin, GDiOSDelegate>

@property (weak, nonatomic) FlutterBBDAppDelegate<FlutterBBDAuthorize> *appDelegate;
@property (assign, nonatomic, readonly) BOOL hasAuthorized;

+(instancetype)sharedInstance;
-(void)authorize;

@end

