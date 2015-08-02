//
//  JBLoginViewControllerPresenter.m
//  Pods
//
//  Created by Bartel on 02.08.15.
//
//

#import "JBLoginViewControllerPresenter.h"
#import "IJBLoginView.h"

@interface JBLoginViewControllerPresenter()

@property(nonatomic)NSURL *successRoute;
@property(nonatomic)NSDictionary *successRouteParams;
@property(nonatomic)NSURL *failureRoute;
@property(nonatomic)NSDictionary *failureRouteParams;
@property (nonatomic) NSURL *forgotPasswordRoute;
@property (nonatomic) NSDictionary *forgotPasswordRouteParams;

@end

@implementation JBLoginViewControllerPresenter

-(id)initWithWireframe:(NSObject<IVISPERWireframe>*)wireframe
     loginSuccessRoute:(NSURL*)successRoute
    successRouteParams:(NSDictionary*)successRouteParams
          failureRoute:(NSURL*)failureRoute
    failureRouteParams:(NSDictionary*)failureRouteParams
   forgotPasswordRoute:(NSURL*)forgotPasswordRoute
forgotPasswordRouteParams:(NSDictionary*)forgotPasswordRouteParams{
    self = [super initWithWireframe:wireframe];
    if(self){
        self->_successRoute       = successRoute;
        self->_successRouteParams = successRouteParams;
        self->_failureRoute       = failureRoute;
        self->_failureRouteParams = failureRouteParams;
        self->_forgotPasswordRoute       = forgotPasswordRoute;
        self->_forgotPasswordRouteParams = forgotPasswordRouteParams;
    }
    return self;
}


-(BOOL)isResponsibleForView:(UIView *)view
             withController:(UIViewController *)controller
                    onEvent:(NSObject<IVISPERViewEvent> *)event{
    if([view conformsToProtocol:@protocol(IJBLoginView)]){
        return YES;
    }
    
    return NO;
}

-(void)viewEvent:(NSObject<IVISPERViewEvent> *)event
        withView:(UIView *)view
   andController:(UIViewController *)viewController{
    [super viewEvent:event withView:view andController:viewController];
    
    if([event.name isEqualToString:@"loginButtonPressed"]){
        [self loginAction];
    }else if([event.name isEqualToString:@"forgotPasswordButtonPressed"]){
        [self forgotPasswordAction];
    }
}

-(void)loginAction{
    NSObject<IVISPERRoutingOption> *option = [self.wireframe presentRootVCRoutingOption:YES];
    [self.wireframe routeURL:self.successRoute
              withParameters:self.successRouteParams
                     options:option];
}

-(void)forgotPasswordAction{
    NSObject<IVISPERRoutingOption> *option = [self.wireframe pushRoutingOption:YES];
    [self.wireframe routeURL:self.forgotPasswordRoute
              withParameters:self.forgotPasswordRouteParams
                     options:option];
}

@end
