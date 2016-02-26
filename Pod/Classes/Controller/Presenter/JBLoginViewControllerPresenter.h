//
//  JBLoginViewControllerPresenter.h
//  Pods
//
//  Created by Bartel on 02.08.15.
//
//

#import <Foundation/Foundation.h>
@import VISPER;
#import "IJBLoginMessagePresenter.h"

@interface JBLoginViewControllerPresenter : VISPERViewControllerPresenter

-(id)initWithWireframe:(NSObject<IVISPERWireframe>*)wireframe
            interactor:(NSObject<IVISPERCommandHandler> *)interactor
      messagePresenter:(NSObject<IJBLoginMessagePresenter>*)messagePresenter
     loginSuccessRoute:(NSURL*)successRoute
    successRouteParams:(NSDictionary*)successRouteParams
   forgotPasswordRoute:(NSURL*)forgotPasswordRoute
forgotPasswordRouteParams:(NSDictionary*)forgotPasswordRouteParams;

@end
