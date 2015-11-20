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
@end

@implementation JBLoginMessagePresenter

-(void)showMessageForError:(NSError*)error
                  callback:(void (^)())callback
              onController:(UIViewController<IJBLoginViewController>*)controller{
    
    NSString *title = [error localizedDescription];
    
    [controller setTitleText:title];
    [controller setSubTitleText:@""];
    
    if(callback){
        callback();
    }
}
@end
