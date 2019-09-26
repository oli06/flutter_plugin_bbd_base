//
//  FlutterBBDAppDelegate4.h
//  flutter_plugin_bbd_base
//
//  Created by Oliver Zernikow on 24.09.19.
//

#import <Flutter/Flutter.h>

@interface FlutterBBDAppDelegate : FlutterAppDelegate

@end

@protocol FlutterBBDAuthorize <NSObject>

@required -(void)didAuthorize;

@end
