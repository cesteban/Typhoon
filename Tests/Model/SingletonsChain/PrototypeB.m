//
//  PrototypeB.m
//  Tests
//
//  Created by Cesar Estebanez Tascon on 12/08/13.
//
//

#import "PrototypeB.h"

@implementation PrototypeB

- (id)initWithPrototypeC:(PrototypeC *)prototypeC
			  prototypeD:(PrototypeD *)prototypeD
{
    self = [super init];
    if (self) {
        _prototypeC = prototypeC;
		_prototypeD = prototypeD;
    }
    return self;
}

@end
