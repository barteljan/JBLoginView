//
//  ForgotPasswordViewController.m
//  JBLoginView
//
//  Created by Bartel on 03.08.15.
//  Copyright (c) 2015 Jan Bartel. All rights reserved.
//

#import "ForgotPasswordViewController.h"
#import <UIColor_HTMLColors/UIColor+HTMLColors.h>

@interface ForgotPasswordViewController ()

@end

@implementation ForgotPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithCSS:@"#F18975"];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
