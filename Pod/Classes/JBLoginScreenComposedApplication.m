//
//  JBLoginScreenComposedApplication.m
//  Pods
//
//  Created by Bartel on 30.07.15.
//
//

#import "JBLoginScreenComposedApplication.h"
#import "LoginWireframeControllerServiceProvider.h"

@interface JBLoginScreenComposedApplication()

@property (nonatomic) NSObject<IVISPERWireframe> *wireframe;
@property (nonatomic) NSObject<IVISPERComposedPersistenceStore> *persistenceStore;
@property (nonatomic) NSObject<IVISPERComposedRepository> *repository;

@property (nonatomic) NSURL *successRoute;
@property (nonatomic) NSDictionary *successRouteParams;

@property (nonatomic) NSURL *forgotPasswordRoute;
@property (nonatomic) NSDictionary *forgotPasswordRouteParams;

@end

@implementation JBLoginScreenComposedApplication

-(id)initWithWireframe:(NSObject <IVISPERWireframe> *)wireframe
               repository:(NSObject <IVISPERComposedRepository> *)repository
         persistenceStore:(NSObject <IVISPERComposedPersistenceStore> *)persistenceStore
             successRoute:(NSURL *)successRoute
       successRouteParams:(NSDictionary *)successRouteParams
      forgotPasswordRoute:(NSURL *)forgotPasswordRoute
forgotPasswordRouteParams:(NSDictionary*)forgotPasswordRouteParams{
    
    self = [super init];
    
    if(self){
        self->_repository                   = repository;
        self->_persistenceStore             = persistenceStore;
        self->_successRoute                 = successRoute;
        self->_successRouteParams           = successRouteParams;
        self->_forgotPasswordRoute          = forgotPasswordRoute;
        self->_forgotPasswordRouteParams    = forgotPasswordRouteParams;
        self->_wireframe = wireframe;
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
                                                                   wireframe:wireframe
                                                                   repository:repository
                                                                   successRoute:self.successRoute
                                                                   successRouteParams:self.successRouteParams
                                                                   forgotPasswordRoute:self.forgotPasswordRoute
                                                                   forgotPasswordRouteParams:self.forgotPasswordRouteParams];
    
    [self.wireframe addControllerServiceProvider:controllerProvider
                                    withPriority:0];
    [self.wireframe addRoutingOptionsServiceProvider:self withPriority:0];
    
    [self.wireframe addRoute:self.startingRoute];
}

-(NSObject<IVISPERRoutingOption>*)optionForRoutePattern:(NSString*)routePattern
                                             parameters:(NSDictionary*)dictionary
                                         currentOptions:(NSObject<IVISPERRoutingOption>*)currentOptions{
    if([routePattern isEqualToString:self.startingRoute] && !currentOptions){
        return [self.wireframe presentRootVCRoutingOption:YES];
    }
    return nil;
}
@end
