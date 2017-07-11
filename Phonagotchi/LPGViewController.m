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
@property (nonatomic) CGRect hitTestRect;

@end

@implementation LPGViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self createPet];
  [self createMessageLabel];
  [self createBucket];
  [self createAppleInBucket];
}

- (void)createPet {
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
  

}

- (void)createMessageLabel {
  self.displayMsgLabel = [[UILabel alloc] initWithFrame:CGRectZero];
  self.displayMsgLabel.translatesAutoresizingMaskIntoConstraints = NO;
  
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
  
  
  
}

- (void)createBucket {
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
  
  
}

- (void)createAppleInBucket {
  
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
  UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(appleWasLongPressed:)];
  
  [self.view addGestureRecognizer:gesture];
  
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

// add a new apple with a pan gesture
- (void)appleWasLongPressed:(UILongPressGestureRecognizer *)sender {
  if (sender.state == UIGestureRecognizerStateEnded) {
    self.appleImageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"apple"]];
    self.appleImageView2.userInteractionEnabled = YES;
    [self.view addSubview:self.appleImageView2];
    self.appleImageView2.bounds = self.appleImageView.bounds;
    CGPoint center = CGPointMake(self.appleImageView.center.x + 20, self.appleImageView.center.y);
    self.appleImageView2.center = center;
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(appleWasPanned:)];
    [self.appleImageView2 addGestureRecognizer:panGesture];
  }
}

// handle pan gesture
- (void)appleWasPanned:(UIPanGestureRecognizer *)sender {
  if (sender.state == UIGestureRecognizerStateChanged) {
    // move it
    CGPoint locationInView = [sender locationInView:self.view];
    self.appleImageView2.center = locationInView;
  }
  if (sender.state == UIGestureRecognizerStateEnded) {
    
    CGPoint locationInView = [sender locationInView:self.view];
    BOOL containsRect = CGRectContainsPoint(self.hitTestRect, locationInView);
    if (containsRect) {
      // feed the pet
      [UIView animateWithDuration:1.0 animations:^{
        self.appleImageView2.alpha = 0;
      } completion:^(BOOL finished) {
        [self.appleImageView2 removeFromSuperview];
      }];
      
    } else {
      // remove it from the superview
      
      [UIView animateWithDuration:1.5 animations:^{
        CGFloat yValue = self.view.frame.size.height + self.appleImageView2.bounds.size.height/2;
        self.appleImageView2.center = CGPointMake(self.appleImageView2.center.x, yValue);
      } completion:^(BOOL finished) {
        [self.appleImageView2 removeFromSuperview];
      }];
    }
    
  }
}

- (void)viewDidLayoutSubviews {
  CGRect petRect = self.petImageView.frame;
  UIEdgeInsets insets = UIEdgeInsetsMake(petRect.size.height * 0.4, 20, 30, 20);
  self.hitTestRect = UIEdgeInsetsInsetRect(petRect, insets);
}




@end
