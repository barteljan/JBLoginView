//
//  JBLoginViewFeature.h
//  Pods
//
//  Created by Bartel on 30.07.15.
//
//

#import <Foundation/Foundation.h>
#import <VISPER/IVISPERFeature.h>
#import <VISPER/IVISPERWireframeRoutingOptionsServiceProvider.h>

@interface JBLoginViewFeature : NSObject<IVISPERFeature,IVISPERWireframeRoutingOptionsServiceProvider>

-(id)initWithWireframe:(NSObject <IVISPERWireframe> *)wireframe
          successRoute:(NSURL *)successRoute
    successRouteParams:(NSDictionary *)successRouteParams
   forgotPasswordRoute:(NSURL *)forgotPasswordRoute
forgotPasswordRouteParams:(NSDictionary*)forgotPasswordRouteParams;

-(void)bootstrapWireframe:(NSObject<IVISPERWireframe> *)wireframe
               interactor:(NSObject<IVISPERComposedInteractor> *)interactor;

-(NSString*)startingRoute;

@end
