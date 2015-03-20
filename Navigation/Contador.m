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
@synthesize alfabeto;

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
        alfabeto =[NSMutableArray arrayWithObjects:@"Avião", @"Bola",@"Carro",@"Dado",@"Elefante",@"Fruta",@"Gato",@"Hipopotamo",@"Indio",@"Jacaré",@"Ketchup",@"Lua",@"Macaco",@"Navio",@"Ovo",@"Palhaço",@"Queijo",@"Robô",@"Sapo",@"Tomate",@"Urso",@"Vaca",@"Walkman",@"Xicara",@"Yoda",@"Zebra", nil];

    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end
