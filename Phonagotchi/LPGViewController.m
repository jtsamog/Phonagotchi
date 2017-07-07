//
//  LPGViewController.m
//  Phonagotchi
//
//  Created by Steven Masuch on 2014-07-26.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPGViewController.h"
#import "PetGotchi.h"


@interface LPGViewController ()

@property (nonatomic) UIImageView *petImageView;
@property (nonatomic) UIImageView *appleImageView;
@property (nonatomic) UIImageView *appleImageView2;
@property (nonatomic) UIImageView *bucketImageView;
@property (nonatomic) UILabel *displayMsgLabel;
@property (strong, nonatomic) PetGotchi *myPet;


@end

@implementation LPGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myPet = [[PetGotchi alloc]init];
	
    self.view.backgroundColor = [UIColor colorWithRed:(252.0/255.0) green:(240.0/255.0) blue:(228.0/255.0) alpha:1.0];
    
    self.petImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.petImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.petImageView.image = [UIImage imageNamed:@"default"];
    
    [self.view addSubview:self.petImageView];
    
    [NSLayoutConstraint constraintWithItem:self.petImageView
                                  attribute:NSLayoutAttributeCenterX
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeCenterX
                                 multiplier:1.0
                                   constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.petImageView
                                  attribute:NSLayoutAttributeCenterY
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeCenterY
                                 multiplier:1.0
                                   constant:0.0].active = YES;
    


//PETTING - setup PGR and add to selector
UIPanGestureRecognizer *petting = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pettingGesture:)]; //initializes an instance (called petting) of Pan Gesture Recognizer (PGR)

[self.view addGestureRecognizer:petting]; //assign the PGR to the view


//Label - to display message
    
    self.displayMsgLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.displayMsgLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.displayMsgLabel.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.displayMsgLabel];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.displayMsgLabel
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1
                                                           constant:250]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.displayMsgLabel
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1
                                                           constant:40]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.displayMsgLabel
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1                                                           constant:50]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.displayMsgLabel
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1                                                           constant:20]];
    
    

//BUCKET - setup bucket Image View (IV)  and constraints
self.bucketImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
self.bucketImageView.translatesAutoresizingMaskIntoConstraints = NO;

self.bucketImageView.image = [UIImage imageNamed:@"bucket"];

[self.view addSubview:self.bucketImageView];
self.bucketImageView.alpha = 0.8; //alpha to create an effect that reveals the apple in the bucket - the apple image is set behind the bucket

[self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.bucketImageView
                                                      attribute:NSLayoutAttributeWidth
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:nil
                                                      attribute:NSLayoutAttributeNotAnAttribute
                                                     multiplier:1                                                           constant:100]];


[self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.bucketImageView
                                                       attribute:NSLayoutAttributeHeight
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:nil
                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                      multiplier:1
                                                        constant:100]];


[self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.bucketImageView
                                                       attribute:NSLayoutAttributeTop
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:self.view
                                                       attribute:NSLayoutAttributeTop
                                                      multiplier:1
                                                        constant:450]];


[self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.bucketImageView
                                                       attribute:NSLayoutAttributeLeft
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:self.view
                                                       attribute:NSLayoutAttributeLeft
                                                      multiplier:1
                                                        constant:40]];


//APPLE - setup image views for apples and the constraints
self.appleImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
self.appleImageView.translatesAutoresizingMaskIntoConstraints = NO;

self.appleImageView.image = [UIImage imageNamed:@"apple"];

[self.view addSubview:self.appleImageView];
[self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.appleImageView
                                                       attribute:NSLayoutAttributeWidth
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:nil
                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                      multiplier:1
                                                        constant:50]];


[self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.appleImageView
                                                       attribute:NSLayoutAttributeHeight
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:nil
                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                      multiplier:1
                                                        constant:50]];


[self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.appleImageView
                                                       attribute:NSLayoutAttributeTop
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:self.view
                                                       attribute:NSLayoutAttributeTop
                                                      multiplier:1
                                                        constant:465]];


[self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.appleImageView
                                                       attribute:NSLayoutAttributeLeft
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:self.view
                                                       attribute:NSLayoutAttributeLeft
                                                      multiplier:1
                                                        constant:47]];

//FEEDING
UILongPressGestureRecognizer *feeding = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(feedingGesture:)];

[self.view addGestureRecognizer:feeding];

//APPLE - the second apple
self.appleImageView2 = [[UIImageView alloc] initWithImage:self.appleImageView.image];
self.appleImageView2.translatesAutoresizingMaskIntoConstraints = YES;



}

//implement method for the selector
- (void)pettingGesture:(UIPanGestureRecognizer *)petting {
    CGPoint pettingVelocity = [petting velocityInView:self.view]; //velocity of a pan gesture in view
    [self.myPet rateOfPetting:pettingVelocity]; //i.e rate of panning on the image
    if (self.myPet.isGrumpyPet == YES) {
        self.petImageView.image = [UIImage imageNamed:@"grumpy"];
        [self.displayMsgLabel setHidden:NO];
        self.displayMsgLabel.text = [[NSString stringWithFormat:@"Pet is grumpy!!!"] uppercaseString];
    }
}


- (void)feedingGesture:(UILongPressGestureRecognizer *)feeding {
    CGPoint location = [feeding locationInView:self.view]; //returns point as location in view
    CGRect newApple; //new rect
    if((feeding.state == UIGestureRecognizerStateBegan || feeding.state == UIGestureRecognizerStateChanged)) {
        [self.myPet feedPet:location];
        if (self.myPet.createApple == YES) {
            newApple = CGRectMake(50, 510, self.appleImageView.frame.size.width, self.appleImageView.frame.size.height); //create a new apple instance for the second apple
            self.appleImageView2.frame = newApple;
            [self.view addSubview:self.appleImageView2]; //put it in the view
            
            self.appleImageView2.alpha = 1; //set transparency
            
            CGPoint touchLocation = [feeding locationInView:self.view];
            self.appleImageView2.center = touchLocation;
        }
    }
    if(feeding.state == UIGestureRecognizerStateEnded) {//when u stop the click
        [self.myPet feedPetLocation:location];
        if(self.myPet.giveApple == YES){  //pet gets apple then if its in the right location
            [UIImageView animateWithDuration:1.0
                                       delay:1.0
                                     options:0
                                  animations:^{self.appleImageView2.alpha=0.0f;}
                                  completion:nil];
            [self.displayMsgLabel setHidden:NO];
            self.displayMsgLabel.text = [[NSString stringWithFormat:@"Feed me some more apples!!!"] uppercaseString];
            
        } else {  //drop the apple out of screen view - animation
            [UIImageView animateWithDuration:1.0
                                       delay:0.5
                                     options:UIViewAnimationOptionCurveEaseIn
                                  animations:^{self.appleImageView2.frame = CGRectMake((location.x),(location.y+600), self.appleImageView2.frame.size.width, self.appleImageView2.frame.size.height);}
                                  completion:nil];
            [self.displayMsgLabel setHidden:NO];
            self.displayMsgLabel.text = [[NSString stringWithFormat:@"Oh! oh! that one dropped!!!"] uppercaseString];
        }
    }
}



@end
