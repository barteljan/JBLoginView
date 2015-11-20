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
#import "IJBLoginMessagePresenter.h"

@interface JBLoginViewFeature : VISPERFeature

@property (readonly,nonatomic) NSString *startingRoute;
@property (readonly,nonatomic) NSURL *successRoute;
@property (readonly,nonatomic) NSDictionary *successRouteParams;
@property (readonly,nonatomic) NSURL *forgotPasswordRoute;
@property (readonly,nonatomic) NSDictionary *forgotPasswordRouteParams;

@property(readonly,nonatomic) NSObject<IJBLoginMessagePresenter> *messagePresenter;


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
          messagePresenter:(NSObject<IJBLoginMessagePresenter>*)messagePresenter;


-(id)initWithStartingRoute:(NSString *)startingRoute
              successRoute:(NSURL *)successRoute
        successRouteParams:(NSDictionary *)successRouteParams
       forgotPasswordRoute:(NSURL *)forgotPasswordRoute
 forgotPasswordRouteParams:(NSDictionary*)forgotPasswordRouteParams
                   nibName:(NSString*)nibName
                    bundle:(NSBundle*)bundle;


-(id)initWithStartingRoute:(NSString *)startingRoute
              successRoute:(NSURL *)successRoute
        successRouteParams:(NSDictionary *)successRouteParams
       forgotPasswordRoute:(NSURL *)forgotPasswordRoute
 forgotPasswordRouteParams:(NSDictionary*)forgotPasswordRouteParams
                   nibName:(NSString*)nibName
                    bundle:(NSBundle*)bundle
          messagePresenter:(NSObject<IJBLoginMessagePresenter>*)messagePresenter;

@end
