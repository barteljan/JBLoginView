//
//  LoginWireframeControllerServiceProvider.h
//  Pods
//
//  Created by Bartel on 30.07.15.
//
//

#import <Foundation/Foundation.h>
#import <VISPER/IVISPERWireframeViewControllerServiceProvider.h>
#import <VISPER/IVISPERWireframe.h>

@interface LoginWireframeControllerServiceProvider : NSObject<IVISPERWireframeViewControllerServiceProvider>


-(id)initWithLoginRoutePattern:(NSString*)routePattern
                     wireframe:(NSObject<IVISPERWireframe>*)wireframe
                  successRoute:(NSURL*)successRoute
            successRouteParams:(NSDictionary*)successRouteParams
                  failureRoute:(NSURL*)failureRoute
            failureRouteParams:(NSDictionary*)failureRouteParams
           forgotPasswordRoute:(NSURL*)forgotPasswordRoute
     forgotPasswordRouteParams:(NSDictionary*)forgotPasswordRouteParams;

@end
