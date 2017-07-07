//
//  PetGotchi.h
//  Phonagotchi
//
//  Created by Endeavour2 on 7/6/17.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PetGotchi : NSObject
@property (nonatomic) BOOL isGrumpyPet;
@property (nonatomic) BOOL createApple;
@property (nonatomic) BOOL giveApple;
@property (nonatomic) int restufless;

-(void)rateOfPetting:(CGPoint) velocity;
-(void)feedPet:(CGPoint)location;
-(void)feedPetLocation:(CGPoint)location;
-(int)petSleep:(int)restfulness;
@end
