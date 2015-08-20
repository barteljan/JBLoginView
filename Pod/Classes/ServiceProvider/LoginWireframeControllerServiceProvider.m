//
//  LoginWireframeControllerServiceProvider.m
//  Pods
//
//  Created by Bartel on 30.07.15.
//
//

#import "LoginWireframeControllerServiceProvider.h"
#import "JBLoginViewController.h"
#import "JBLoginViewControllerPresenter.h"
#import "JBLoginMessagePresenter.h"

@interface LoginWireframeControllerServiceProvider()

@property(nonatomic)NSString *loginRoutePattern;
@property(nonatomic)NSObject<IVISPERWireframe>*wireframe;
@property(nonatomic)NSURL *successRoute;
@property(nonatomic)NSDictionary *successRouteParams;
@property (nonatomic) NSURL *forgotPasswordRoute;
@property (nonatomic) NSDictionary *forgotPasswordRouteParams;
@property (nonatomic) NSObject <IVISPERInteractor> *interactor;
@end


@implementation LoginWireframeControllerServiceProvider

-(id)initWithLoginRoutePattern:(NSString*)routePattern
                     wireframe:(NSObject<IVISPERWireframe>*)wireframe
                    interactor:(NSObject<IVISPERInteractor> *)interactor
                  successRoute:(NSURL*)successRoute
            successRouteParams:(NSDictionary*)successRouteParams
           forgotPasswordRoute:(NSURL*)forgotPasswordRoute
     forgotPasswordRouteParams:(NSDictionary*)forgotPasswordRouteParams{
    self = [super init];
    if(self){
        self->_loginRoutePattern         = routePattern;
        self->_wireframe                 = wireframe;
        self->_interactor                = interactor;
        self->_successRoute              = successRoute;
        self->_successRouteParams        = successRouteParams;
        self->_forgotPasswordRoute       = forgotPasswordRoute;
        self->_forgotPasswordRouteParams = forgotPasswordRouteParams;
    }
    return self;
}

-(UIViewController *)controllerForRoute:(NSString *)routePattern
                         routingOptions:(NSObject<IVISPERRoutingOption> *)options
                         withParameters:(NSDictionary *)parameters{
    if([routePattern isEqualToString:self.loginRoutePattern]){
        
        NSBundle *bundle = [self bundleByName:@"JBLoginView"];
    
        JBLoginViewController *controller = [[JBLoginViewController alloc] initWithNibName:@"JBLoginViewController"
                                                                                    bundle:bundle];
        
        JBLoginMessagePresenter *messagePresenter = [[JBLoginMessagePresenter alloc] initWithViewController:controller];
        
        JBLoginViewControllerPresenter *presenter = [[JBLoginViewControllerPresenter alloc] initWithWireframe:self.wireframe
                                                                                                   interactor:self.interactor
                                                                                             messagePresenter:messagePresenter
                                                                                            loginSuccessRoute:self.successRoute
                                                                                           successRouteParams:self.successRouteParams
                                                                                          forgotPasswordRoute:self.forgotPasswordRoute
                                                                                    forgotPasswordRouteParams:self.forgotPasswordRouteParams];
        [controller addVisperPresenter:presenter];
        
        return controller;
    }
    return nil;
}

//copied from http://stackoverflow.com/questions/5836587/how-do-i-get-all-resource-paths-in-my-bundle-recursively-in-ios
- (NSArray *)recursivePathsForResourcesOfType:(NSString *)type inDirectory:(NSString *)directoryPath{
    
    NSMutableArray *filePaths = [[NSMutableArray alloc] init];
    NSDirectoryEnumerator *enumerator = [[NSFileManager defaultManager] enumeratorAtPath:directoryPath];
    
    NSString *filePath;
    
    while ((filePath = [enumerator nextObject]) != nil){
        if (!type || [[filePath pathExtension] isEqualToString:type]){
            [filePaths addObject:[directoryPath stringByAppendingPathComponent:filePath]];
        }
    }
    
    return filePaths;
}

-(NSBundle*)bundleByName:(NSString*)bundleName{
    NSBundle *mainBundle = [NSBundle mainBundle];
    
    NSString *path = nil;
    
    NSArray *bundlePaths = [self recursivePathsForResourcesOfType:@"bundle" inDirectory:[mainBundle bundlePath]];
    for (NSString *bundlePath in bundlePaths) {
        NSString *lastComponent = [bundlePath lastPathComponent];
        if([lastComponent isEqualToString:[NSString stringWithFormat:@"%@.bundle",bundleName]]){
            path = bundlePath;
            break;
        }
    }
    
    if(path){
        NSBundle *bundle = [NSBundle bundleWithPath:path];
        return bundle;
    }
    
    return nil;
}

@end
