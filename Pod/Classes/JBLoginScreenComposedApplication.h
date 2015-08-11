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


-(id)initWithWireframe:(NSObject <IVISPERWireframe> *)wireframe
            repository:(NSObject <IVISPERComposedRepository> *)repository
      persistenceStore:(NSObject <IVISPERComposedPersistenceStore> *)persistenceStore
          successRoute:(NSURL *)successRoute
    successRouteParams:(NSDictionary *)successRouteParams
   forgotPasswordRoute:(NSURL *)forgotPasswordRoute
forgotPasswordRouteParams:(NSDictionary*)forgotPasswordRouteParams;

-(void)bootstrapWireframe:(NSObject<IVISPERWireframe> *)wireframe
               repository:(NSObject<IVISPERComposedRepository> *)repository
         persistenceStore:(NSObject<IVISPERComposedPersistenceStore> *)persistenceStore;

@end
