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
#import <VISPER/IVISPERInteractor.h>
@interface LoginWireframeControllerServiceProvider : NSObject<IVISPERWireframeViewControllerServiceProvider>


-(id)initWithLoginRoutePattern:(NSString*)routePattern
                     wireframe:(NSObject<IVISPERWireframe>*)wireframe
                    interactor:(NSObject<IVISPERInteractor> *)interactor
                  successRoute:(NSURL*)successRoute
            successRouteParams:(NSDictionary*)successRouteParams
           forgotPasswordRoute:(NSURL*)forgotPasswordRoute
     forgotPasswordRouteParams:(NSDictionary*)forgotPasswordRouteParams;

@end
