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
#import <VISPER/VISPERFeature.h>

@interface JBLoginViewFeature : VISPERFeature

@property (readonly,nonatomic) NSString *startingRoute;
@property (readonly,nonatomic) NSURL *successRoute;
@property (readonly,nonatomic) NSDictionary *successRouteParams;
@property (readonly,nonatomic) NSURL *forgotPasswordRoute;
@property (readonly,nonatomic) NSDictionary *forgotPasswordRouteParams;


-(id)initWithStartingRoute:(NSString *)startingRoute
          successRoute:(NSURL *)successRoute
    successRouteParams:(NSDictionary *)successRouteParams
   forgotPasswordRoute:(NSURL *)forgotPasswordRoute
forgotPasswordRouteParams:(NSDictionary*)forgotPasswordRouteParams;

-(id)initWithStartingRoute:(NSString *)startingRoute
              successRoute:(NSURL *)successRoute
        successRouteParams:(NSDictionary *)successRouteParams
       forgotPasswordRoute:(NSURL *)forgotPasswordRoute
 forgotPasswordRouteParams:(NSDictionary*)forgotPasswordRouteParams
                   nibName:(NSString*)nibName
                    bundle:(NSBundle*)bundle;
@end
