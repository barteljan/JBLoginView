//
//  IJBLoginMessagePresenter.h
//  Pods
//
//  Created by bartel on 11.08.15.
//
//

#import <Foundation/Foundation.h>
#import "IJBLoginViewController.h"

@protocol IJBLoginMessagePresenter <NSObject>

-(void)showMessageForError:(NSError*)error
                  callback:(void (^)())callback
              onController:(UIViewController<IJBLoginViewController>*)controller;

@end
