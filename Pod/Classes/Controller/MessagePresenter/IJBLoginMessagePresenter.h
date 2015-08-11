//
//  IJBLoginMessagePresenter.h
//  Pods
//
//  Created by bartel on 11.08.15.
//
//

#import <Foundation/Foundation.h>

@protocol IJBLoginMessagePresenter <NSObject>

-(void)showErrorMessageWithTitle:(NSString*)title
                        callback:(void (^)())callback;

@end
