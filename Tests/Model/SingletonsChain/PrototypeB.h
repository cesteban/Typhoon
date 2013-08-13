//
//  PrototypeB.h
//  Tests
//
//  Created by Cesar Estebanez Tascon on 12/08/13.
//
//

#import <Foundation/Foundation.h>

@class PrototypeC;
@class PrototypeD;

@interface PrototypeB : NSObject

@property (nonatomic, strong) PrototypeC *prototypeC;
@property (nonatomic, strong) PrototypeD *prototypeD;

- (id)initWithPrototypeC:(PrototypeC *)prototypeC
			  prototypeD:(PrototypeD *)prtototypeD;

@end
