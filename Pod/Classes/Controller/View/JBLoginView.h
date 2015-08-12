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

@property(nonatomic) UI_APPEARANCE_SELECTOR UIColor *mainColor;
@property(nonatomic) UI_APPEARANCE_SELECTOR UIColor *mainFontColor;
@property(nonatomic) UI_APPEARANCE_SELECTOR UIColor *darkColor;
@property(nonatomic) UI_APPEARANCE_SELECTOR UIColor *darkFontColor;
//@property(nonatomic) UI_APPEARANCE_SELECTOR NSString *fontName;
//@property(nonatomic) UI_APPEARANCE_SELECTOR NSString *boldFontName;


@property(nonatomic) UI_APPEARANCE_SELECTOR UIFont *titleFont;
@property(nonatomic) UI_APPEARANCE_SELECTOR UIFont *subTitleFont;
@property(nonatomic) UI_APPEARANCE_SELECTOR UIFont *usernameFont;
@property(nonatomic) UI_APPEARANCE_SELECTOR UIFont *passwordFont;
@property(nonatomic) UI_APPEARANCE_SELECTOR UIFont *loginButtonFont;
@property(nonatomic) UI_APPEARANCE_SELECTOR UIFont *forgetButtonFont;

@property (nonatomic, weak) IBOutlet UITextField * usernameField;
@property (nonatomic, weak) IBOutlet UITextField * passwordField;
@property (nonatomic, weak) IBOutlet UIButton *loginButton;
@property (nonatomic, weak) IBOutlet UIButton * forgotButton;
@property (nonatomic, weak) IBOutlet UILabel * titleLabel;
@property (nonatomic, weak) IBOutlet UILabel * subTitleLabel;

@property(nonatomic) CGFloat bottomMargin;


@end
