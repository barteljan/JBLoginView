//
//  JBLoginViewController.h
//  Pods
//
//  Created by Bartel on 30.07.15.
//
//

#import <UIKit/UIKit.h>
#import <VISPER/VISPERViewController.h>
#import <BSKeyboardControls/BSKeyboardControls.h>
#import "IJBLoginView.h"

@interface JBLoginViewController : VISPERViewController<UITextFieldDelegate,BSKeyboardControlsDelegate>

@property(nonatomic) IBOutlet UIView<IJBLoginView> *view;

@property(nonatomic) BSKeyboardControls *keyboardControls;

@property (strong, nonatomic) IBOutlet UIToolbar *keyboardBar;


@end
