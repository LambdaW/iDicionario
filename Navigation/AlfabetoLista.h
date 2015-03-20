//
//  AlfabetoLista.h
//  Navigation
//
//  Created by Wellington Pardim Ferreira on 3/19/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface AlfabetoLista : UITableViewController{
    NSArray *alfabetoArray;
}

@property NSArray *alfabetoArray;
@property UILabel *fromLabel;
-(UIColor *)getRandomColor;


@end
