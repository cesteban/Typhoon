//
//  PrototypeD.h
//  Tests
//
//  Created by Cesar Estebanez Tascon on 12/08/13.
//
//

#import <Foundation/Foundation.h>

@class PrototypeC;

@interface PrototypeD : NSObject

@property (nonatomic, strong) PrototypeC *prototypeC;

- (id)initWithPrototypeC:(PrototypeC *)prototypeC;

@end
