//
//  InputData.h
//  appleCalculator
//
//  Created by Mr Ruby on 12/11/16.
//  Copyright © 2016 Rnjai Lamba. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TypeOfInput) {
    TYPE_NUMBER = 1,
    TYPE_EDIT,
    TYPE_OPERATION,
    TYPE_EMPTY
    
};

typedef NS_ENUM(NSInteger, OperatorPriority) {
    PRIORITY_POWER = 1,
    PRIORITY_TWO ,
    PRIORITY_THREE
    
};


@interface InputData : NSObject

@property (nonatomic) NSInteger entry;
@property (assign, nonatomic) TypeOfInput type;
@property (nonatomic) NSString *actualData;

@end
