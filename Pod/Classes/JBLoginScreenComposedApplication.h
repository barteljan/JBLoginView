//
//  JBLoginScreenComposedApplication.h
//  Pods
//
//  Created by Bartel on 30.07.15.
//
//

#import <Foundation/Foundation.h>
#import <VISPERComposedApplication/IVISPERComposedApplication.h>
#import <VISPER/IVISPERWireframeRoutingOptionsServiceProvider.h>

@interface JBLoginScreenComposedApplication : NSObject<IVISPERComposedApplication,IVISPERWireframeRoutingOptionsServiceProvider>

@property (nonatomic) NSObject<IVISPERWireframe> *globalWireframe;
@property (nonatomic) NSObject<IVISPERComposedPersistenceStore> *persistenceStore;
@property (nonatomic) NSObject<IVISPERComposedRepository> *repository;

@property (nonatomic) NSURL *successRoute;
@property (nonatomic) NSDictionary *successRouteParams;

@property (nonatomic) NSURL *failureRoute;
@property (nonatomic) NSDictionary *failureRouteParams;

@property (nonatomic) NSURL *forgotPasswordRoute;
@property (nonatomic) NSDictionary *forgotPasswordRouteParams;

-(id)      initWithWireframe:(NSObject<IVISPERWireframe> *)wireframe
            globalRepository:(NSObject<IVISPERComposedRepository> *)repository
      globalPersistenceStore:(NSObject<IVISPERComposedPersistenceStore> *)persistenceStore
                successRoute:(NSURL*)successRoute
          successRouteParams:(NSDictionary*)successRouteParams
                failureRoute:(NSURL*)failureRoute
          failureRouteParams:(NSDictionary*)failureRouteParams
         forgotPasswordRoute:(NSURL*)forgotPasswordRoute
   forgotPasswordRouteParams:(NSDictionary*)forgotPasswordRouteParams;

-(void)bootstrapWireframe:(NSObject<IVISPERWireframe> *)wireframe
               repository:(NSObject<IVISPERComposedRepository> *)repository
         persistenceStore:(NSObject<IVISPERComposedPersistenceStore> *)persistenceStore;

@end
