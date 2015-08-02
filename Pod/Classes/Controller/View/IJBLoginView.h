//
//  IJBLoginView.h
//  Pods
//
//  Created by Bartel on 02.08.15.
//
//

#import <Foundation/Foundation.h>
@import UIKit;

@protocol IJBLoginView <NSObject>

-(UITextField *) usernameField;
-(UITextField *) passwordField;
-(UIButton    *) loginButton;
-(UIButton    *) forgotButton;
-(UILabel     *) titleLabel;
-(UILabel     *) subTitleLabel;

@end
