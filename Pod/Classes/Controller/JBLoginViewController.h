//
//  JBLoginViewController.h
//  Pods
//
//  Created by Bartel on 30.07.15.
//
//

#import <UIKit/UIKit.h>
#import <VISPER/VISPERViewController.h>
#import "IJBLoginView.h"
#import "IJBLoginViewController.h"

@interface JBLoginViewController : VISPERViewController<UITextFieldDelegate,IJBLoginViewController>

@property(nonatomic) IBOutlet UIView<IJBLoginView> *view;

@end
