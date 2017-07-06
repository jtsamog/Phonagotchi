//
//  PetGotchi.m
//  Phonagotchi
//
//  Created by Endeavour2 on 7/6/17.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import "PetGotchi.h"

@implementation PetGotchi
-(instancetype)init{
    self = [super init];
    if (self) {
        _isGrumpyPet = NO;
    }
    return self;
}
@end
