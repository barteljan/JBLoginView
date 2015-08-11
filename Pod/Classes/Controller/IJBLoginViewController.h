//
//  IJBLoginViewController.h
//  Pods
//
//  Created by bartel on 10.08.15.
//
//

#import <Foundation/Foundation.h>

@protocol IJBLoginViewController <NSObject>

-(NSString*)username;
-(NSString*)password;

-(void)showForgotPasswordButton:(BOOL)showButton;
-(void)showTitle:(BOOL)showTitle;

-(void)setTitleText:(NSString*)titleText;
-(NSString*)titleText;

-(void)setSubTitleText:(NSString*)titleText;
-(NSString*)subTitleText;

@end
