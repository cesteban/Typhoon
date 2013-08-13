//
//  SingletonsChainAssembly.h
//  Tests
//
//  Created by Cesar Estebanez Tascon on 09/08/13.
//
//

#import "TyphoonAssembly.h"

@interface SingletonsChainAssembly : TyphoonAssembly

// One cycle

- (id)singletonA;
- (id)singletonB;
- (id)notSingletonA;


// Another cycle

- (id)singletonC;
- (id)prototypeA;
- (id)prototypeB;
- (id)prototypeC;
- (id)prototypeD;

@end
