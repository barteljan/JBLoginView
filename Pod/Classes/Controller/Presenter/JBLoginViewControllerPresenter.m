//
//  JBLoginViewControllerPresenter.m
//  Pods
//
//  Created by Bartel on 02.08.15.
//
//

#import "JBLoginViewControllerPresenter.h"
#import "IJBLoginViewController.h"
#import <JBLoginDataCommands/JBLoginLoginAsUserCommand.h>


@interface JBLoginViewControllerPresenter()

@property (nonatomic) NSURL *successRoute;
@property (nonatomic) NSDictionary *successRouteParams;
@property (nonatomic) NSURL *failureRoute;
@property (nonatomic) NSDictionary *failureRouteParams;
@property (nonatomic) NSURL *forgotPasswordRoute;
@property (nonatomic) NSDictionary *forgotPasswordRouteParams;
@property (nonatomic) NSObject <IVISPERRepository> *repository;

@end

@implementation JBLoginViewControllerPresenter

-(id)initWithWireframe:(NSObject<IVISPERWireframe>*)wireframe
            repository:(NSObject <IVISPERRepository> *)repository
     loginSuccessRoute:(NSURL*)successRoute
    successRouteParams:(NSDictionary*)successRouteParams
          failureRoute:(NSURL*)failureRoute
    failureRouteParams:(NSDictionary*)failureRouteParams
   forgotPasswordRoute:(NSURL*)forgotPasswordRoute
forgotPasswordRouteParams:(NSDictionary*)forgotPasswordRouteParams{
    self = [super initWithWireframe:wireframe];
    if(self){
        self->_repository                = repository;
        self->_successRoute              = successRoute;
        self->_successRouteParams        = successRouteParams;
        self->_failureRoute              = failureRoute;
        self->_failureRouteParams        = failureRouteParams;
        self->_forgotPasswordRoute       = forgotPasswordRoute;
        self->_forgotPasswordRouteParams = forgotPasswordRouteParams;
    }
    return self;
}


-(BOOL)isResponsibleForView:(UIView *)view
             withController:(UIViewController *)controller
                    onEvent:(NSObject<IVISPERViewEvent> *)event{
    if([controller conformsToProtocol:@protocol(IJBLoginViewController)]){
        return YES;
    }
    
    return NO;
}

-(void)viewEvent:(NSObject<IVISPERViewEvent> *)event
        withView:(UIView *)view
   andController:(UIViewController *)viewController{
    [super viewEvent:event withView:view andController:viewController];
    
    if([event.name isEqualToString:@"loginButtonPressed"]){
        [self loginButtonPressedWithController:(UIViewController<IJBLoginViewController>*)viewController];
    }else if([event.name isEqualToString:@"forgotPasswordButtonPressed"]){
        [self forgotPasswordAction];
    }
}

-(void)loginButtonPressedWithController:(UIViewController<IJBLoginViewController>*)controller{
    
    if(![controller conformsToProtocol:@protocol(IJBLoginViewController)]){
        @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"controller does not conform to protocol: IJBLoginViewController" userInfo:@{@"controller":controller}];
    }
    
    JBLoginLoginAsUserCommand *command = [[JBLoginLoginAsUserCommand alloc] initWithUsername:controller.username password:controller.password];
    
    [self.repository getDataForCommand:command completion:^BOOL(NSString *identifier, NSObject *object, NSError *__autoreleasing *error) {
        
        if(error==nil){
            NSObject<IVISPERRoutingOption> *option = [self.wireframe presentRootVCRoutingOption:YES];
        
            [self.wireframe routeURL:self.successRoute
                      withParameters:self.successRouteParams
                             options:option];
        }
        
        return TRUE;
    }];
}

-(void)forgotPasswordAction{
    NSObject<IVISPERRoutingOption> *option = [self.wireframe pushRoutingOption:YES];
    [self.wireframe routeURL:self.forgotPasswordRoute
              withParameters:self.forgotPasswordRouteParams
                     options:option];
}

@end
