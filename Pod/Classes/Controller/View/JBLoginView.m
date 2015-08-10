//
//  JBLoginView.m
//  Pods
//
//  Created by Bartel on 02.08.15.
//
//

#import "JBLoginView.h"
#import "UIColor+HTMLColors.h"
#import <PureLayout/PureLayout.h>

@interface JBLoginView()

@property(nonatomic)NSMutableArray *constraintsToRemove;

@end

@implementation JBLoginView


-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        [self bootstrapView];
    }
    return self;
}

-(void)setUsernameField:(UITextField *)usernameField{
    self->_usernameField = usernameField;
    
    self.usernameField.backgroundColor = [UIColor whiteColor];
    self.usernameField.layer.cornerRadius = 3.0f;
    self.usernameField.leftViewMode = UITextFieldViewModeAlways;
    UIView* leftView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    self.usernameField.leftView = leftView1;
    self.usernameField.font = [UIFont fontWithName:self.fontName size:16.0f];
    self.usernameField.placeholder = NSLocalizedString(@"Username",@"username placeholder text");
}

-(void)setLoginButton:(UIButton *)loginButton{
    self->_loginButton = loginButton;
    
    self.loginButton.backgroundColor = self.darkColor;
    self.loginButton.layer.cornerRadius = 3.0f;
    self.loginButton.titleLabel.font = [UIFont fontWithName:self.boldFontName size:20.0f];
    [self.loginButton setTitle:NSLocalizedString(@"Login",@"Loginbutton Text") forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.5f] forState:UIControlStateHighlighted];
}

-(void)setPasswordField:(UITextField *)passwordField{
    self->_passwordField = passwordField;
    self.passwordField.layer.cornerRadius = 3.0f;
    self.passwordField.leftViewMode = UITextFieldViewModeAlways;
    UIView* leftView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    self.passwordField.leftView = leftView2;
    self.passwordField.font = [UIFont fontWithName:self.fontName size:16.0f];
    self.passwordField.placeholder = NSLocalizedString(@"Password",@"password placeholder text");
    self.passwordField.backgroundColor = [UIColor whiteColor];
    self.passwordField.secureTextEntry = YES;
}

-(void)setForgotButton:(UIButton *)forgotButton{
    self->_forgotButton = forgotButton;
    
    self.forgotButton.backgroundColor = [UIColor clearColor];
    self.forgotButton.titleLabel.font = [UIFont fontWithName:self.fontName size:12.0f];
    [self.forgotButton setTitle:NSLocalizedString(@"Forgot password?",@"forgot password button text") forState:UIControlStateNormal];
    [self.forgotButton setTitleColor:self.darkColor forState:UIControlStateNormal];
    [self.forgotButton setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.5] forState:UIControlStateHighlighted];

}

-(void)setTitleLabel:(UILabel *)titleLabel{
    self->_titleLabel = titleLabel;
    self.titleLabel.textColor =  [UIColor whiteColor];
    self.titleLabel.font =  [UIFont fontWithName:self.boldFontName size:24.0f];
}

-(void)setSubTitleLabel:(UILabel *)subTitleLabel{
    self->_subTitleLabel = subTitleLabel;

    self.subTitleLabel.textColor =  [UIColor whiteColor];
    self.subTitleLabel.font =  [UIFont fontWithName:self.fontName size:14.0f];
}

-(void)bootstrapView{
    self.mainColor = [UIColor colorWithCSS:@"#F18975"];
    self.darkColor = [UIColor colorWithCSS:@"#705853"];
    
    self.fontName = @"Optima-Italic";
    self.boldFontName = @"Optima-ExtraBlack";
    
    self.backgroundColor = self.mainColor;
    
}

-(void)updateConstraints{
    [super updateConstraints];
    
    if(self.constraintsToRemove && [self.constraintsToRemove count] > 0){
        [self.constraintsToRemove autoRemoveConstraints];
        self.constraintsToRemove = nil;
    }
    
    self.constraintsToRemove = [NSMutableArray array];
    
    NSArray *constraints;

    //title
    if (UIInterfaceOrientationIsPortrait([self orientation])) {
        constraints =
        [self.titleLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(46,35,0,35)
                                                  excludingEdge:ALEdgeBottom];

        [self.constraintsToRemove addObjectsFromArray:constraints];
    }else{
        constraints =
        [self.titleLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(15,35,0,35)
                                                  excludingEdge:ALEdgeBottom];
        [self.constraintsToRemove addObjectsFromArray:constraints];
    }

   
    
    
    //subtitle
    [self.subTitleLabel autoPinEdge:ALEdgeTop
                             toEdge:ALEdgeBottom
                             ofView:self.titleLabel
                         withOffset:0.0];
    [self.subTitleLabel autoPinEdge:ALEdgeLeft
                             toEdge:ALEdgeLeft
                             ofView:self.titleLabel
                         withOffset:0];
    [self.subTitleLabel autoPinEdge:ALEdgeRight
                             toEdge:ALEdgeRight
                             ofView:self.titleLabel
                         withOffset:0];
    
    //password textfield
    [self.usernameField autoPinEdge:ALEdgeBottom
                             toEdge:ALEdgeTop
                             ofView:self.passwordField
                         withOffset:-18.0];
    [self.usernameField autoPinEdge:ALEdgeLeft
                             toEdge:ALEdgeLeft
                             ofView:self.titleLabel
                         withOffset:0];
    [self.usernameField autoPinEdge:ALEdgeRight
                             toEdge:ALEdgeRight
                             ofView:self.titleLabel
                         withOffset:0];
    [self.usernameField autoSetDimension:ALDimensionHeight
                                  toSize:41.0];

    
    //password textfield
    [self.passwordField autoPinEdge:ALEdgeBottom
                             toEdge:ALEdgeTop
                             ofView:self.loginButton
                         withOffset:-18.0];
    [self.passwordField autoPinEdge:ALEdgeLeft
                           toEdge:ALEdgeLeft
                           ofView:self.titleLabel
                       withOffset:0];
    [self.passwordField autoPinEdge:ALEdgeRight
                           toEdge:ALEdgeRight
                           ofView:self.titleLabel
                       withOffset:0];
    [self.passwordField autoSetDimension:ALDimensionHeight
                                  toSize:41.0];

    
    //login button
    [self.loginButton autoPinEdge:ALEdgeBottom
                           toEdge:ALEdgeTop
                           ofView:self.forgotButton
                       withOffset:-5];
    [self.loginButton autoPinEdge:ALEdgeLeft
                             toEdge:ALEdgeLeft
                             ofView:self.titleLabel
                         withOffset:0];
    [self.loginButton autoPinEdge:ALEdgeRight
                             toEdge:ALEdgeRight
                             ofView:self.titleLabel
                         withOffset:0];
    [self.loginButton autoSetDimension:ALDimensionHeight
                                toSize:62];
    
    //forget button
    
    if (!UIInterfaceOrientationIsLandscape([self orientation])) {
        constraints =
        [self.forgotButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 35, 100, 35)
                                                    excludingEdge:ALEdgeTop];
        [self.constraintsToRemove addObjectsFromArray:constraints];
    }else{
        constraints =
        [self.forgotButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 35, 10, 35)
                                                    excludingEdge:ALEdgeTop];
        [self.constraintsToRemove addObjectsFromArray:constraints];
    }

}

- (UIInterfaceOrientation)orientation{
    
    CGSize sizeInPoints = [UIScreen mainScreen].bounds.size;
    
    UIInterfaceOrientation result;
    
    if(sizeInPoints.width <= sizeInPoints.height){
        result = UIInterfaceOrientationPortrait;
    }else{
        result = UIInterfaceOrientationLandscapeLeft;
    }
    
    return result;
}

@end
