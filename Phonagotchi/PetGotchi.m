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



-(void)rateOfPetting:(CGPoint)velocity{
    //Have it so that if the user pets too fast, it gets grumpy
    if (velocity.y >= 3000 || velocity.y <= -3000){
        NSLog(@"Pet becomes grumpy");
        _isGrumpyPet = YES;
    }else {NSLog(@"Pet a little slowly");
        _isGrumpyPet = NO;
    }
}


-(void)feedPet:(CGPoint)location{
    if((location.x >= 55 && location.y >= 290) || (location.x <= 75 && location.y <= 315)){
        _createApple = YES;
    }else{
        _createApple = NO;
    }
}


-(void)feedPetLocation:(CGPoint)location{
    if((location.x >= 80 && location.y >= 290) || (location.x <= 100 && location.y <= 320)){
        NSLog(@"Pet has the apple!");
        _giveApple = YES;
    }else{
        _giveApple = NO;
    }
}


-(int)petSleep:(int)restfulness{
    float sleep = 0;  //hours
    if(sleep < 0){
        restfulness = 100;
    }else if(sleep <= 5){
        restfulness = 50;
    }else if(sleep >= 10){
        restfulness = 0;
    }
    return sleep;
}



@end
