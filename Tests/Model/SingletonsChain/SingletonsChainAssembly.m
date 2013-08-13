//
//  SingletonsChainAssembly.m
//  Tests
//
//  Created by Cesar Estebanez Tascon on 09/08/13.
//
//

#import "SingletonsChainAssembly.h"
#import "Typhoon.h"

#import "SingletonA.h"
#import "SingletonB.h"
#import "NotSingletonA.h"

#import "SingletonC.h"
#import "PrototypeA.h"
#import "PrototypeB.h"
#import "PrototypeC.h"
#import "PrototypeD.h"


@implementation SingletonsChainAssembly


// One cycle

- (id)singletonA
{
	return [TyphoonDefinition withClass:[SingletonA class] properties:^(TyphoonDefinition *definition) {
		[definition injectProperty:@selector(dependencyOnB) withDefinition:[self singletonB]];
		[definition setScope:TyphoonScopeSingleton];
	}];
}

- (id)singletonB
{
	return [TyphoonDefinition withClass:[SingletonB class] properties:^(TyphoonDefinition *definition) {
		[definition injectProperty:@selector(dependencyOnNotSingletonA) withDefinition:[self notSingletonA]];
		[definition setScope:TyphoonScopeSingleton];
	}];
}

- (id)notSingletonA
{
	return [TyphoonDefinition withClass:[NotSingletonA class] initialization:^(TyphoonInitializer *initializer) {
		initializer.selector = @selector(initWithSingletonA:);
		[initializer injectWithDefinition:[self singletonA]];
	}];
}


// Another cycle

- (id)singletonC
{
	return [TyphoonDefinition withClass:[SingletonC class] properties:^(TyphoonDefinition *definition) {
		[definition injectProperty:@selector(prototypeA) withDefinition:[self prototypeA]];
		[definition setScope:TyphoonScopeSingleton];
	}];
}

- (id)prototypeA
{
	return [TyphoonDefinition withClass:[PrototypeA class] properties:^(TyphoonDefinition *definition) {
		[definition injectProperty:@selector(prototypeB) withDefinition:[self prototypeB]];
	}];
}

- (id)prototypeB
{
	return [TyphoonDefinition withClass:[PrototypeB class] initialization:^(TyphoonInitializer *initializer) {
		initializer.selector = @selector(initWithPrototypeC:prototypeD:);
		[initializer injectWithDefinition:[self prototypeC]];
		[initializer injectWithDefinition:[self prototypeD]];
	}];
}

- (id)prototypeC
{
	return [TyphoonDefinition withClass:[PrototypeC class] properties:^(TyphoonDefinition *definition) {
		[definition injectProperty:@selector(singletonC) withDefinition:[self singletonC]];
		[definition injectProperty:@selector(prototypeA) withDefinition:[self prototypeA]];
	}];
}

- (id)prototypeD
{
	return [TyphoonDefinition withClass:[PrototypeD class] initialization:^(TyphoonInitializer *initializer) {
		initializer.selector = @selector(initWithPrototypeC:);
		[initializer injectWithDefinition:[self prototypeC]];
	}];
}

@end
