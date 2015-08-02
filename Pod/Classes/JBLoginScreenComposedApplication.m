//
//  JBLoginScreenComposedApplication.m
//  Pods
//
//  Created by Bartel on 30.07.15.
//
//

#import "JBLoginScreenComposedApplication.h"
#import "LoginWireframeControllerServiceProvider.h"

@implementation JBLoginScreenComposedApplication

-(id)      initWithWireframe:(NSObject<IVISPERWireframe> *)wireframe
            globalRepository:(NSObject<IVISPERComposedRepository> *)repository
      globalPersistenceStore:(NSObject<IVISPERComposedPersistenceStore> *)persistenceStore
                successRoute:(NSURL*)successRoute
          successRouteParams:(NSDictionary*)successRouteParams
                failureRoute:(NSURL*)failureRoute
          failureRouteParams:(NSDictionary*)failureRouteParams
         forgotPasswordRoute:(NSURL*)forgotPasswordRoute
   forgotPasswordRouteParams:(NSDictionary*)forgotPasswordRouteParams{
    
    self = [super init];
    
    if(self){
        self->_repository                   = repository;
        self->_persistenceStore             = persistenceStore;
        self->_successRoute                 = successRoute;
        self->_successRouteParams           = successRouteParams;
        self->_failureRoute                 = failureRoute;
        self->_failureRouteParams           = failureRouteParams;
        self->_forgotPasswordRoute          = forgotPasswordRoute;
        self->_forgotPasswordRouteParams    = forgotPasswordRouteParams;
        self->_globalWireframe              = wireframe;
    }
    
    return self;
}

-(NSString*)startingRoute{
    return @"/login";
}

-(void)bootstrapWireframe:(NSObject<IVISPERWireframe> *)wireframe
               repository:(NSObject<IVISPERComposedRepository> *)repository
         persistenceStore:(NSObject<IVISPERComposedPersistenceStore> *)persistenceStore{
    
    
    LoginWireframeControllerServiceProvider *controllerProvider = [[LoginWireframeControllerServiceProvider alloc]
                                                                   initWithLoginRoutePattern:self.startingRoute
                                                                   wireframe:self.globalWireframe
                                                                   successRoute:self.successRoute
                                                                   successRouteParams:self.successRouteParams
                                                                   failureRoute:self.failureRoute
                                                                   failureRouteParams:self.failureRouteParams
                                                                   forgotPasswordRoute:self.forgotPasswordRoute
                                                                   forgotPasswordRouteParams:self.forgotPasswordRouteParams];
    
    [self.globalWireframe addControllerServiceProvider:controllerProvider
                                          withPriority:0];
    [self.globalWireframe addRoutingOptionsServiceProvider:self withPriority:0];
    
    [self.globalWireframe addRoute:self.startingRoute];
}

-(NSObject<IVISPERRoutingOption>*)optionForRoutePattern:(NSString*)routePattern
                                             parameters:(NSDictionary*)dictionary
                                         currentOptions:(NSObject<IVISPERRoutingOption>*)currentOptions{
    if([routePattern isEqualToString:self.startingRoute] && !currentOptions){
        return [self.globalWireframe presentRootVCRoutingOption:YES];
    }
    return nil;
}
@end
