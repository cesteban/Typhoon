//
//  PrototypeD.m
//  Tests
//
//  Created by Cesar Estebanez Tascon on 12/08/13.
//
//

#import "PrototypeD.h"

@implementation PrototypeD

- (id)initWithPrototypeC:(PrototypeC *)prototypeC
{
    self = [super init];
    if (self) {
        _prototypeC = prototypeC;
    }
    return self;
}

@end
