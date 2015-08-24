//
//  JBLoginViewFeature.m
//  Pods
//
//  Created by Bartel on 30.07.15.
//
//

#import "JBLoginViewFeature.h"
#import "LoginWireframeControllerServiceProvider.h"
#import <VISPER/VISPER.h>

@interface JBLoginViewFeature ()

@property (nonatomic) NSString *startingRoute;
@property (nonatomic) NSURL *successRoute;
@property (nonatomic) NSDictionary *successRouteParams;

@property (nonatomic) NSURL *forgotPasswordRoute;
@property (nonatomic) NSDictionary *forgotPasswordRouteParams;



@end

@implementation JBLoginViewFeature

-(id)initWithStartingRoute:(NSString *)startingRoute
              successRoute:(NSURL *)successRoute
        successRouteParams:(NSDictionary *)successRouteParams
       forgotPasswordRoute:(NSURL *)forgotPasswordRoute
 forgotPasswordRouteParams:(NSDictionary*)forgotPasswordRouteParams{
    
    self = [super init];
    
    if(self){
        self->_successRoute                 = successRoute;
        self->_successRouteParams           = successRouteParams;
        self->_forgotPasswordRoute          = forgotPasswordRoute;
        self->_forgotPasswordRouteParams    = forgotPasswordRouteParams;
        self->_startingRoute                = startingRoute;
        [self addRoutePattern:startingRoute];
    }
    
    return self;
}

-(NSArray*)routePatterns{
    return [NSArray arrayWithObject:[self startingRoute]];
}


-(void)bootstrapWireframe:(NSObject<IVISPERWireframe> *)wireframe
               interactor:(NSObject<IVISPERComposedInteractor> *)interactor{
    
    [super bootstrapWireframe:wireframe
                   interactor:interactor];
    
    LoginWireframeControllerServiceProvider *controllerProvider = [[LoginWireframeControllerServiceProvider alloc]
                                                                   initWithLoginRoutePattern:self.startingRoute
                                                                   wireframe:wireframe
                                                                   interactor:interactor
                                                                   successRoute:self.successRoute
                                                                   successRouteParams:self.successRouteParams
                                                                   forgotPasswordRoute:self.forgotPasswordRoute
                                                                   forgotPasswordRouteParams:self.forgotPasswordRouteParams];
    
    [self.wireframe addControllerServiceProvider:controllerProvider
                                    withPriority:0];
}

-(NSObject<IVISPERRoutingOption>*)optionForRoutePattern:(NSString*)routePattern
                                             parameters:(NSDictionary*)dictionary
                                         currentOptions:(NSObject<IVISPERRoutingOption>*)currentOptions{
    if(currentOptions){
        return currentOptions;
    }
    
    if([routePattern isEqualToString:self.startingRoute] && !currentOptions){
        return [VISPER routingOptionPresentRootVC:YES];
    }
    return nil;
}
@end
