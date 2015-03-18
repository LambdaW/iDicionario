//
//  Contador.m
//  Navigation
//
//  Created by Wellington Pardim Ferreira on 3/17/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "Contador.h"
#import "LetraAViewController.h"
@implementation Contador
@synthesize cont;


-(void)previousInt{
    cont--;
    
}

-(void)nextInt{
     cont++;
    
}



#pragma mark Singleton Methods






+ (id)sharedManager {
    static Contador *sharedMyManager = nil;
    @synchronized(self) {
        if (sharedMyManager == nil)
            sharedMyManager = [[self alloc] init];
    }
    return sharedMyManager;
}


- (id)init {
    if (self = [super init]) {
        cont = 0;
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end
