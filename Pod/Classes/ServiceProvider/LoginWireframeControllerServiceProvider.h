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
#import <VISPERComposedApplication/IVISPERRepository.h>
@interface LoginWireframeControllerServiceProvider : NSObject<IVISPERWireframeViewControllerServiceProvider>


-(id)initWithLoginRoutePattern:(NSString*)routePattern
                     wireframe:(NSObject<IVISPERWireframe>*)wireframe
                    repository:(NSObject <IVISPERRepository> *)repository
                  successRoute:(NSURL*)successRoute
            successRouteParams:(NSDictionary*)successRouteParams
                  failureRoute:(NSURL*)failureRoute
            failureRouteParams:(NSDictionary*)failureRouteParams
           forgotPasswordRoute:(NSURL*)forgotPasswordRoute
     forgotPasswordRouteParams:(NSDictionary*)forgotPasswordRouteParams;

@end
