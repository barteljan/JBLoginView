//
//  JBLoginView.h
//  Pods
//
//  Created by Bartel on 02.08.15.
//
//

#import <Foundation/Foundation.h>
#import "IJBLoginView.h"
@import UIKit;

@interface JBLoginView : UIView<IJBLoginView>

@property(nonatomic)UIColor *mainColor;
@property(nonatomic)UIColor *darkColor;
@property(nonatomic)NSString *fontName;
@property(nonatomic)NSString *boldFontName;

@property (nonatomic, weak) IBOutlet UITextField * usernameField;
@property (nonatomic, weak) IBOutlet UITextField * passwordField;
@property (nonatomic, weak) IBOutlet UIButton *loginButton;
@property (nonatomic, weak) IBOutlet UIButton * forgotButton;
@property (nonatomic, weak) IBOutlet UILabel * titleLabel;
@property (nonatomic, weak) IBOutlet UILabel * subTitleLabel;

@end
