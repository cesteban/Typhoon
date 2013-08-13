//
//  PrototypeC.h
//  Tests
//
//  Created by Cesar Estebanez Tascon on 12/08/13.
//
//

#import <Foundation/Foundation.h>

@class PrototypeA;
@class SingletonC;

@interface PrototypeC : NSObject

@property (nonatomic, strong) SingletonC *singletonC;
@property (nonatomic, strong) PrototypeA *prototypeA;

@end
