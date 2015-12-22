//
//  JBLoginViewFeature.m
//  Pods
//
//  Created by Bartel on 30.07.15.
//
//

#import "JBLoginViewFeature.h"
#import "JBLoginViewController.h"
#import "JBLoginViewControllerPresenter.h"
#import "JBLoginMessagePresenter.h"
#import <VISPER/VISPER.h>

@interface JBLoginViewFeature ()

@property (nonatomic) NSString *startingRoute;
@property (nonatomic) NSURL *successRoute;
@property (nonatomic) NSDictionary *successRouteParams;

@property (nonatomic) NSURL *forgotPasswordRoute;
@property (nonatomic) NSDictionary *forgotPasswordRouteParams;

@property (nonatomic) NSString *nibName;
@property (nonatomic) NSBundle *bundle;

@property(nonatomic) NSObject<IJBLoginMessagePresenter> *messagePresenter;
@end

@implementation JBLoginViewFeature

-(id)initWithStartingRoute:(NSString *)startingRoute
              successRoute:(NSURL *)successRoute
        successRouteParams:(NSDictionary *)successRouteParams
       forgotPasswordRoute:(NSURL *)forgotPasswordRoute
 forgotPasswordRouteParams:(NSDictionary*)forgotPasswordRouteParams{
    
    return [self initWithStartingRoute:startingRoute
                          successRoute:successRoute
                    successRouteParams:successRouteParams
                   forgotPasswordRoute:forgotPasswordRoute
             forgotPasswordRouteParams:forgotPasswordRouteParams
                               nibName:nil
                                bundle:nil];
}

-(id)initWithStartingRoute:(NSString *)startingRoute
              successRoute:(NSURL *)successRoute
        successRouteParams:(NSDictionary *)successRouteParams
       forgotPasswordRoute:(NSURL *)forgotPasswordRoute
 forgotPasswordRouteParams:(NSDictionary*)forgotPasswordRouteParams
          messagePresenter:(NSObject<IJBLoginMessagePresenter>*)messagePresenter {
    return [self initWithStartingRoute:startingRoute
                          successRoute:successRoute
                    successRouteParams:successRouteParams
                   forgotPasswordRoute:forgotPasswordRoute
             forgotPasswordRouteParams:forgotPasswordRouteParams
                               nibName:nil
                                bundle:nil
                      messagePresenter:messagePresenter];

}

-(id)initWithStartingRoute:(NSString *)startingRoute
              successRoute:(NSURL *)successRoute
        successRouteParams:(NSDictionary *)successRouteParams
       forgotPasswordRoute:(NSURL *)forgotPasswordRoute
 forgotPasswordRouteParams:(NSDictionary*)forgotPasswordRouteParams
                   nibName:(NSString*)nibName
                    bundle:(NSBundle*)bundle{
    
    return [self initWithStartingRoute:startingRoute
                          successRoute:successRoute
                    successRouteParams:successRouteParams
                   forgotPasswordRoute:forgotPasswordRoute
             forgotPasswordRouteParams:forgotPasswordRouteParams
                               nibName:nibName
                                bundle:bundle
                      messagePresenter:nil];

}

-(id)initWithStartingRoute:(NSString *)startingRoute
              successRoute:(NSURL *)successRoute
        successRouteParams:(NSDictionary *)successRouteParams
       forgotPasswordRoute:(NSURL *)forgotPasswordRoute
 forgotPasswordRouteParams:(NSDictionary*)forgotPasswordRouteParams
                   nibName:(NSString*)nibName
                    bundle:(NSBundle*)bundle
          messagePresenter:(NSObject<IJBLoginMessagePresenter>*)messagePresenter {

    self = [super init];
    
    if(self){
        self->_successRoute                 = successRoute;
        self->_successRouteParams           = successRouteParams;
        self->_forgotPasswordRoute          = forgotPasswordRoute;
        self->_forgotPasswordRouteParams    = forgotPasswordRouteParams;
        self->_startingRoute                = startingRoute;
        self->_messagePresenter             = messagePresenter;
        if(nibName){
            self->_nibName                  = nibName;
        }else{
            self->_nibName                  = @"JBLoginViewController";
        }
        if(bundle){
            self->_bundle                   = bundle;
        }else{
            self->_bundle                   =  [self bundleByName:@"JBLoginView"];
        }
        [self addRoutePattern:startingRoute];
    }
    
    return self;

}


-(NSArray*)routePatterns{
    return [NSArray arrayWithObject:[self startingRoute]];
}


-(UIViewController *)controllerForRoute:(NSString *)routePattern
                         routingOptions:(NSObject<IVISPERRoutingOption> *)options
                         withParameters:(NSDictionary *)parameters{
    
    if([routePattern isEqualToString:self.startingRoute]){
        
        JBLoginViewController *controller = [[JBLoginViewController alloc] initWithNibName:self.nibName
                                                                                    bundle:self.bundle];
        
    
        
        JBLoginViewControllerPresenter *presenter = [[JBLoginViewControllerPresenter alloc] initWithWireframe:self.wireframe
                                                                                                   interactor:self.commandBus
                                                                                             messagePresenter:self.messagePresenter
                                                                                            loginSuccessRoute:self.successRoute
                                                                                           successRouteParams:self.successRouteParams
                                                                                          forgotPasswordRoute:self.forgotPasswordRoute
                                                                                    forgotPasswordRouteParams:self.forgotPasswordRouteParams];
        [controller addVisperPresenter:presenter];
        
        return controller;
    }
    return nil;
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


-(NSObject<IJBLoginMessagePresenter>*)messagePresenter{
    if(!self->_messagePresenter){
        self->_messagePresenter = [[JBLoginMessagePresenter alloc] init];
    }
    return self->_messagePresenter;
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
