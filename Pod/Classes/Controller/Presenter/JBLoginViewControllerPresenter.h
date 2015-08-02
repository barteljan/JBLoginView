//
//  JBLoginViewControllerPresenter.h
//  Pods
//
//  Created by Bartel on 02.08.15.
//
//

#import <Foundation/Foundation.h>
#import <VISPER/VISPERViewControllerPresenter.h>
@interface JBLoginViewControllerPresenter : VISPERViewControllerPresenter


-(id)initWithWireframe:(NSObject<IVISPERWireframe>*)wireframe
     loginSuccessRoute:(NSURL*)successRoute
    successRouteParams:(NSDictionary*)successRouteParams
          failureRoute:(NSURL*)failureRoute
    failureRouteParams:(NSDictionary*)failureRouteParams
   forgotPasswordRoute:(NSURL*)forgotPasswordRoute
forgotPasswordRouteParams:(NSDictionary*)forgotPasswordRouteParams;

@end
