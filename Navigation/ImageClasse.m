//
//  ImageClasse.m
//  Navigation
//
//  Created by Wellington Pardim Ferreira on 3/20/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "ImageClasse.h"

@implementation ImageClasse

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



- (void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event{
    // When a touch starts, get the current location in the view
    // proximo1 = [[LetraAViewController alloc] init];
     [[touches anyObject] locationInView:self];
    
    
}

@end
