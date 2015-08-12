//
//  JBLoginView.m
//  Pods
//
//  Created by Bartel on 02.08.15.
//
//

#import "JBLoginView.h"
#import <PureLayout/PureLayout.h>

@interface JBLoginView(){
    BOOL _didStyleUI;
}

@property(nonatomic)NSMutableArray *constraintsToRemove;



@end

@implementation JBLoginView


-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
      
    }
    return self;
}


-(void)setMainColor:(UIColor *)mainColor{
    self->_mainColor = mainColor;
    
    //style self
    self.backgroundColor = self.mainColor;
}


-(void)setTitleFont:(UIFont *)titleFont{
    self->_titleFont = titleFont;
    self.titleLabel.font = titleFont;
}

-(void)setSubTitleFont:(UIFont *)subTitleFont{
    self->_subTitleFont = subTitleFont;
    self.subTitleLabel.font = subTitleFont;
}

-(void)setUsernameFont:(UIFont *)usernameFont{
    self->_usernameFont = usernameFont;
    self.usernameField.font = usernameFont;
}

-(void)setPasswordFont:(UIFont *)passwordFont{
    self->_passwordFont = passwordFont;
    self.passwordField.font = passwordFont;
}

-(void)setLoginButtonFont:(UIFont *)loginButtonFont{
    self->_loginButtonFont = loginButtonFont;
    self.loginButton.titleLabel.font = loginButtonFont;
}

-(void)setForgetButtonFont:(UIFont *)forgetButtonFont{
    self->_forgetButtonFont = forgetButtonFont;
    self.forgotButton.titleLabel.font = forgetButtonFont;
}

/*
-(void)setFontName:(NSString *)fontName{
    self->_fontName = fontName;
    
    //style subtitle label
    self.subTitleLabel.font =  [UIFont fontWithName:self.fontName size:14.0f];
    
    
    //style username field
    self.usernameField.font = [UIFont fontWithName:self.fontName size:16.0f];
    
    
    //style password field
    self.passwordField.font = [UIFont fontWithName:self.fontName size:16.0f];
    
    
    
    //style forgot button
    self.forgotButton.titleLabel.font = [UIFont fontWithName:self.fontName size:12.0f];
    
}

-(void)setBoldFontName:(NSString *)boldFontName{
    self->_boldFontName = boldFontName;
    
    //style title label
    self.titleLabel.font =  [UIFont fontWithName:self.boldFontName size:24.0f];
    
    
    //style login button
    self.loginButton.titleLabel.font = [UIFont fontWithName:self.boldFontName size:20.0f];
}

*/

-(void)setDarkColor:(UIColor *)darkColor{
    self->_darkColor = darkColor;
    
    //style login button
    self.loginButton.backgroundColor = self.darkColor;
    
    //style forgot button
    [self.forgotButton setTitleColor:self.darkColor forState:UIControlStateNormal];
}


-(void)setDarkFontColor:(UIColor *)darkFontColor{
    self->_darkFontColor = darkFontColor;

    //style login button
    [self.loginButton setTitleColor:darkFontColor forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[darkFontColor colorWithAlphaComponent:0.5] forState:UIControlStateHighlighted];
}


-(void)setMainFontColor:(UIColor *)mainFontColor{
    self->_mainFontColor = mainFontColor;
    
    //style title label
    [self.titleLabel setTextColor:mainFontColor];
    
    //style subtitle label
    [self.subTitleLabel setTextColor:mainFontColor];
}

-(void)styleUI{
    
    //style title label
    self.titleLabel.textColor =  [UIColor whiteColor];
    
    //style subtitle label
    self.subTitleLabel.textColor =  [UIColor whiteColor];
    
    //style username field
    self.usernameField.backgroundColor = [UIColor whiteColor];
    self.usernameField.layer.cornerRadius = 3.0f;
    self.usernameField.leftViewMode = UITextFieldViewModeAlways;
    UIView* leftView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    self.usernameField.leftView = leftView1;

    self.usernameField.placeholder = NSLocalizedString(@"Username",@"username placeholder text");
    
    //style password label
    self.passwordField.layer.cornerRadius = 3.0f;
    self.passwordField.leftViewMode = UITextFieldViewModeAlways;
    UIView* leftView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    self.passwordField.leftView = leftView2;
    self.passwordField.placeholder = NSLocalizedString(@"Password",@"password placeholder text");
    self.passwordField.backgroundColor = [UIColor whiteColor];
    self.passwordField.secureTextEntry = YES;
    
    //style login button
    self.loginButton.layer.cornerRadius = 3.0f;
    [self.loginButton setTitle:NSLocalizedString(@"Login",@"Loginbutton Text") forState:UIControlStateNormal];
    
    
    //style forgot button
    self.forgotButton.backgroundColor = [UIColor clearColor];
    [self.forgotButton setTitle:NSLocalizedString(@"Forgot password?",@"forgot password button text") forState:UIControlStateNormal];
    [self.forgotButton setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.5] forState:UIControlStateHighlighted];
    
    _didStyleUI = TRUE;
}

-(void)updateConstraints{
    [super updateConstraints];
    
    if(!_didStyleUI){
        [self styleUI];
    }
    
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
    
    
    [self.forgotButton autoAlignAxis:ALAxisVertical toSameAxisOfView:self];
    
    if (!UIInterfaceOrientationIsLandscape([self orientation])) {
        NSLayoutConstraint *constraint = [self.forgotButton autoPinEdge:ALEdgeBottom
                                                                 toEdge:ALEdgeBottom
                                                                 ofView:self
                                                             withOffset:-100-self.bottomMargin];
        [self.constraintsToRemove addObject:constraint];
    }else{
        NSLayoutConstraint *constraint = [self.forgotButton autoPinEdge:ALEdgeBottom
                                                                 toEdge:ALEdgeBottom
                                                                 ofView:self
                                                             withOffset:-10-self.bottomMargin];
        [self.constraintsToRemove addObject:constraint];
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
