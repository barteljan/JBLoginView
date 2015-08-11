//
//  JBLoginViewControllerPresenter.h
//  Pods
//
//  Created by Bartel on 02.08.15.
//
//

#import <Foundation/Foundation.h>
#import <VISPER/VISPERViewControllerPresenter.h>
#import <VISPERComposedApplication/IVISPERRepository.h>
#import "IJBLoginMessagePresenter.h"

@interface JBLoginViewControllerPresenter : VISPERViewControllerPresenter

-(id)initWithWireframe:(NSObject<IVISPERWireframe>*)wireframe
            repository:(NSObject <IVISPERRepository> *)repository
      messagePresenter:(NSObject<IJBLoginMessagePresenter>*)messagePresenter
     loginSuccessRoute:(NSURL*)successRoute
    successRouteParams:(NSDictionary*)successRouteParams
   forgotPasswordRoute:(NSURL*)forgotPasswordRoute
forgotPasswordRouteParams:(NSDictionary*)forgotPasswordRouteParams;

@end
