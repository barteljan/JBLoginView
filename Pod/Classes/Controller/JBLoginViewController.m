//
//  JBLoginViewController.m
//  Pods
//
//  Created by Bartel on 30.07.15.
//
//

#import "JBLoginViewController.h"
#import <VISPER/UIViewController+VISPER.h>
#import <PureLayout/PureLayout.h>

@interface JBLoginViewController ()
@property BOOL isMovedUp;
@property CGFloat keyboardHeight;
@property BOOL showTitle;
@end

@implementation JBLoginViewController
@dynamic view;

-(instancetype)initWithNibName:(NSString *)nibNameOrNil
                        bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self showTitle:YES];
    
    self.view.usernameField.delegate = self;
    self.view.passwordField.delegate = self;
    
    [self.view setNeedsUpdateConstraints];
}


-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    if(CGRectIntersectsRect(self.view.titleLabel.frame, self.view.usernameField.frame) || !self.showTitle){
        self.view.titleLabel.hidden = TRUE;
    }else{
        self.view.titleLabel.hidden = FALSE;
    }
    
    if(CGRectIntersectsRect(self.view.subTitleLabel.frame, self.view.usernameField.frame) || !self.showTitle){
        self.view.subTitleLabel.hidden = TRUE;
    }else{
        self.view.subTitleLabel.hidden = FALSE;
    }

}

-(void)showForgotPasswordButton:(BOOL)showButton{
    if(showButton){
        self.view.forgotButton.hidden = FALSE;
    }else{
        self.view.forgotButton.hidden = TRUE;
    }
}


-(void)showTitle:(BOOL)showTitle{
    self.showTitle = showTitle;
    [self.view setNeedsLayout];
}



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}


-(IBAction)forgotPassword:(id)sender{
    [self notifyPresentersOfView:self.view
                       withEvent:[self.visperServiceProvider createEventWithName:@"forgotPasswordButtonPressed"
                                                                          sender:self
                                                                            info:nil]];
}

-(IBAction)loginAction:(id)sender{
    [self notifyPresentersOfView:self.view
                       withEvent:[self.visperServiceProvider createEventWithName:@"loginButtonPressed"
                                                                          sender:self
                                                                            info:nil]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#define kOFFSET_FOR_KEYBOARD 120.0

-(void)keyboardWillShow:(NSNotification*)notification {
   
    self.keyboardHeight = [[notification.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size.height;

    //change bottom margin of so that the form covers the whole screen
    [self animateViewBottomMargin:self.keyboardHeight - 120.0];
}

-(void)keyboardWillHide:(NSNotification*)notification {
    self.keyboardHeight = 0;
    [self animateViewBottomMargin:self.keyboardHeight];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if(textField==self.view.passwordField){
        [textField resignFirstResponder];
    }else{
        [self.view.passwordField becomeFirstResponder];
    }
    return YES;
}

//method to move the view up/down whenever the keyboard is shown/dismissed
-(void)animateViewBottomMargin:(CGFloat)bottomMargin
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:2.0];
    
    self.view.bottomMargin = bottomMargin;
    
    [self.view setNeedsUpdateConstraints];
    //[self.view updateConstraints];
    
    [UIView commitAnimations];
    
}

-(NSString*)username{
    return self.view.usernameField.text;
}

-(NSString*)password{
    return self.view.passwordField.text;
}

-(void)setTitleText:(NSString*)titleText{
    self.view.titleLabel.text = titleText;
}

-(NSString*)titleText{
    return self.view.titleLabel.text;
}

-(void)setSubTitleText:(NSString*)text{
    self.view.subTitleLabel.text = text;
}

-(NSString*)subTitleText{
    return self.view.subTitleLabel.text;
}




@end
