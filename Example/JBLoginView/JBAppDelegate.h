//
//  JBAppDelegate.h
//  JBLogin
//
//  Created by Jan Bartel on 07/30/2015.
//  Copyright (c) 2015 Jan Bartel. All rights reserved.
//

@import UIKit;
#import <VISPER/IVISPERWireframe.h>
#import "JBLoginViewFeature.h"
#import <VISPER/VISPERApplication.h>

@interface JBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (strong, nonatomic) VISPERApplication *visperApplication;

@end
