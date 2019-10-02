#import "FlutterPluginBbdBasePlugin.h"
#import <flutter_plugin_bbd_base/flutter_plugin_bbd_base-Swift.h>
#import <UIKit/UIKit.h>

@interface FlutterPluginBbdBasePlugin ()

@property (nonatomic, assign) BOOL hasAuthorized;

-(instancetype)init;

@end

@implementation FlutterPluginBbdBasePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterPluginBbdBasePlugin registerWithRegistrar:registrar];
}

+ (instancetype)sharedInstance {

    static FlutterPluginBbdBasePlugin *gdiOSDelegate = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        gdiOSDelegate = [[FlutterPluginBbdBasePlugin alloc] init];
    });
    return gdiOSDelegate;
                            
}

-(void)authorize {
    NSLog(@"log build authorize");
    [[GDiOS sharedInstance] authorize:[FlutterPluginBbdBasePlugin sharedInstance]];
}

- (instancetype)init {
    self = [super init];
    if (self) {

        // Do any additional setup
                                
    }
    return self;
}

- (void)setAppDelegate:(FlutterBBDAppDelegate<FlutterBBDAuthorize> *)appDelegate {
    _appDelegate = appDelegate;
}

#pragma mark - BlackBerry Dynamics SDK Delegate Methods
- (void)handleEvent:(GDAppEvent *)anEvent {
NSLog(@"log build handleEvent");
    /* Called from BlackBerry Dynamics SDK when events occur, such as system startup. */
    switch (anEvent.type)
    {
        case GDAppEventAuthorized:
        {
            [self onAuthorized:anEvent];
            break;
        }
        case GDAppEventNotAuthorized:
        {
            [self onNotAuthorized:anEvent];
            break;
        }
        case GDAppEventRemoteSettingsUpdate:
        {
            //A change to application-related configuration or policy settings.
            break;
        }
        case GDAppEventServicesUpdate:
        {
            //A change to services-related configuration.
            break;
        }
        case GDAppEventPolicyUpdate:
        {
            //A change to one or more application-specific policy settings has been received.
            break;
        }
        case GDAppEventEntitlementsUpdate:
        {
            //A change to the entitlements data has been received.
            break;
        }
        default:
        {
            NSLog(@"log build Unhandled Event");
            break;
        }
    }
}

- (void)onNotAuthorized:(GDAppEvent *)anEvent {

    NSLog(@"log build onNotAuhtorized");
    /* Handle the BlackBerry Dynamics SDK not authorized event. */
    switch (anEvent.code) {
        case GDErrorActivationFailed:
        case GDErrorProvisioningFailed:
        case GDErrorPushConnectionTimeout:
        case GDErrorSecurityError:
        case GDErrorAppDenied:
        case GDErrorAppVersionNotEntitled:
        case GDErrorBlocked:
        case GDErrorWiped:
        case GDErrorRemoteLockout:
        case GDErrorPasswordChangeRequired: {
            // an condition has occured denying authorization, an application may wish to log these events
            NSLog(@"onNotAuthorized %@", anEvent.message);
            break;
        }
        case GDErrorIdleLockout: {
            // idle lockout is benign & informational
            break;
        }
        default:
            NSAssert(false, @"Unhandled not authorized event");
            break;
    }
}


- (void)onAuthorized:(GDAppEvent *)anEvent {

    NSLog(@"log build onAuthorized");
    /* Handle the BlackBerry Dynamics SDK authorized event. */
    switch (anEvent.code) {
        case GDErrorNone: {
            if (!self.hasAuthorized) {
                // launch application UI here
                NSString *storyboardName = nil;
                storyboardName = @"Main";
        
                UIStoryboard *uiStoryboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
                UIViewController *uiViewController = [uiStoryboard instantiateInitialViewController];
                
                UIWindow *mainWindow = [[UIApplication sharedApplication] delegate].window;
                mainWindow.rootViewController = uiViewController;
                
                //Neccessary to register all Flutter-Plugins
                [_appDelegate didAuthorize];
                
                self.hasAuthorized = YES;
            }
            break;
        }
        default:
            NSAssert(false, @"Authorized startup with an error");
            break;
    }
}

@end
