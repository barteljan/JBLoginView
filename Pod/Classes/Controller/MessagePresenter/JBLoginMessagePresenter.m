//
//  JBLoginMessagePresenter.m
//  Pods
//
//  Created by bartel on 11.08.15.
//
//

#import "JBLoginMessagePresenter.h"

@import UIKit;

@interface JBLoginMessagePresenter()
@property (nonatomic) UIViewController<IJBLoginViewController> *controller;
@end

@implementation JBLoginMessagePresenter

-(id)initWithViewController:(UIViewController<IJBLoginViewController>*)controller{
    self = [super init];
    if(self){
        self->_controller = controller;
    }
    return self;
}



-(void)showErrorMessageWithTitle:(NSString*)title
                        callback:(void (^)())callback{
    
    [self.controller setTitleText:title];
    [self.controller setSubTitleText:@""];
    
    if(callback){
        callback();
    }
}
@end
