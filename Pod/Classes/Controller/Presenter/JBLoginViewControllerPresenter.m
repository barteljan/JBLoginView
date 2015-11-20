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
#import <JBLoginDataCommands/JBLoginGetTitleCommand.h>
#import <JBLoginDataCommands/IJBLoginGetTitleResponse.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <VISPER/VISPER.h>


@interface JBLoginViewControllerPresenter()

@property (nonatomic) NSURL *successRoute;
@property (nonatomic) NSDictionary *successRouteParams;
@property (nonatomic) NSURL *forgotPasswordRoute;
@property (nonatomic) NSDictionary *forgotPasswordRouteParams;
@property (nonatomic) NSObject <IVISPERInteractor> *interactor;
@property (nonatomic) NSObject<IJBLoginMessagePresenter> *messagePresenter;

@end

@implementation JBLoginViewControllerPresenter

-(id)initWithWireframe:(NSObject<IVISPERWireframe>*)wireframe
            interactor:(NSObject<IVISPERInteractor> *)interactor
      messagePresenter:(NSObject<IJBLoginMessagePresenter>*)messagePresenter
     loginSuccessRoute:(NSURL*)successRoute
    successRouteParams:(NSDictionary*)successRouteParams
   forgotPasswordRoute:(NSURL*)forgotPasswordRoute
forgotPasswordRouteParams:(NSDictionary*)forgotPasswordRouteParams{
    self = [super initWithWireframe:wireframe];
    if(self){
        self->_interactor                = interactor;
        self->_messagePresenter          = messagePresenter;
        self->_successRoute              = successRoute;
        self->_successRouteParams        = successRouteParams;
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
    
    if(![viewController conformsToProtocol:@protocol(IJBLoginViewController)]){
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:@"controller does not conform to protocol: IJBLoginViewController"
                                     userInfo:@{@"controller":viewController}];
    }
    
    [super viewEvent:event withView:view andController:viewController];
    
    if([event.name isEqualToString:@"loginButtonPressed"]){
        [self loginButtonPressedWithController:(UIViewController<IJBLoginViewController>*)viewController];
    }else if([event.name isEqualToString:@"forgotPasswordButtonPressed"]){
        [self forgotPasswordAction];
    }
}


-(void)viewDidLoad:(UIView *)view
    withController:(UIViewController *)viewController
             event:(NSObject<IVISPERViewEvent> *)event{
    
    if(![viewController conformsToProtocol:@protocol(IJBLoginViewController)]){
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:@"controller does not conform to protocol: IJBLoginViewController"
                                     userInfo:@{@"controller":viewController}];
    }
    
    //hide forgot password button if no route for forgetting a password is given
    UIViewController<IJBLoginViewController> *controller = (UIViewController<IJBLoginViewController>*)viewController;
    
    if(self.forgotPasswordRoute){
        [controller showForgotPasswordButton:YES];
    }else{
        [controller showForgotPasswordButton:NO];
    }
    
    //set title
    JBLoginGetTitleCommand *getTitleCommand = [[JBLoginGetTitleCommand alloc] init];
    
    [self.interactor processCommand:getTitleCommand
                         completion:^BOOL(NSString *identifier, NSObject *titleResponse, NSError *__autoreleasing *error) {
                                if(![titleResponse conformsToProtocol:@protocol(IJBLoginGetTitleResponse)]){
                                    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                                                   reason:@"response should conform to protocol: IJBLoginGetTitleResponse"
                                                                 userInfo:@{@"response":titleResponse}];
                                }
                                
                                NSObject<IJBLoginGetTitleResponse> *response = (NSObject<IJBLoginGetTitleResponse>*)titleResponse;
                                
                                [controller setTitleText:response.title];
                                [controller setSubTitleText:response.subTitle];
                                
                                return YES;
                            }];
}

-(void)loginButtonPressedWithController:(UIViewController<IJBLoginViewController>*)controller{
    
    if(![controller conformsToProtocol:@protocol(IJBLoginViewController)]){
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:@"controller does not conform to protocol: IJBLoginViewController"
                                     userInfo:@{@"controller":controller}];
    }
    
    JBLoginLoginAsUserCommand *command = [[JBLoginLoginAsUserCommand alloc] initWithUsername:controller.username password:controller.password];

    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:controller.view animated:YES];
    hud.labelText = NSLocalizedString(@"Performing login ...",@"progresshud login message");
    [self.interactor processCommand:command completion:^BOOL(NSString *identifier, NSObject *object, NSError *__autoreleasing *error) {
        
        [MBProgressHUD hideHUDForView:controller.view animated:YES];
        
        if(error){
            [self.messagePresenter showMessageForError:*error callback:nil onController:controller];
        } else{
            NSObject<IVISPERRoutingOption> *option = [VISPER routingOptionPresentRootVC:YES];
        
            [self.wireframe routeURL:self.successRoute
                      withParameters:self.successRouteParams
                             options:option];
        }
        
        return TRUE;
    }];
}

-(void)forgotPasswordAction{
    NSObject<IVISPERRoutingOption> *option = [VISPER routingOptionPush:YES];
    [self.wireframe routeURL:self.forgotPasswordRoute
              withParameters:self.forgotPasswordRouteParams
                     options:option];
}

@end
