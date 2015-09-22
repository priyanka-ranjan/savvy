//
//  Savvy.m
//  Savvy
//
//  Created by Eric Chen on 2014-06-11.
//  Copyright (c) 2014 Savvy. All rights reserved.
//

#import "Savvy.h"
#import <QuartzCore/QuartzCore.h>

#import "CouponDetailsViewController.h"

#import "CouponModel.h"

@interface Savvy ()

@property (strong, nonatomic) IBOutlet UIImageView *leftBack;
@property (strong, nonatomic) IBOutlet UIImageView *rightBack;

@property (strong, nonatomic) IBOutlet UIView *bottomBar;
@property (strong, nonatomic) IBOutlet UIButton *rightTikkit;
@property (strong, nonatomic) IBOutlet UIButton *leftTikkit;
@property (strong, nonatomic) IBOutlet UIButton *profile;
@property (strong, nonatomic) IBOutlet UIButton *wallet1;
@property (strong, nonatomic) IBOutlet UIButton *wallet2;
@property (strong, nonatomic) IBOutlet UIButton *wallet3;
@property (strong, nonatomic) IBOutlet UIButton *wallet2Click;
@property (strong, nonatomic) IBOutlet UIButton *wallet3Click;

@property (strong, nonatomic) UISwipeGestureRecognizer *downSwipeLeft;
@property (strong, nonatomic) UISwipeGestureRecognizer *upSwipeLeft;
@property (strong, nonatomic) UISwipeGestureRecognizer *downSwipeRight;
@property (strong, nonatomic) UISwipeGestureRecognizer *upSwipeRight;

@property (strong, nonatomic) CouponModel *rightCoupongModel;
@property (strong, nonatomic) CouponModel *leftCouponModel;

@property (strong, nonatomic) UIImageView *left_img;
@property (strong, nonatomic) UIImageView *right_img;

@property (strong, nonatomic) IBOutlet UIButton *popoff;
@property (strong, nonatomic) IBOutlet UIImageView *pop;

@property (nonatomic, assign) NSInteger numberOfItemsInWallet;

@property int open_wallet1;
@property int open_wallet2;
@property int open_wallet3;
@property int inWallet1;
@property int inWallet2;
@property int inWallet3;
@property int pop2;

@end

@implementation Savvy

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.numberOfItemsInWallet = 0;
//    
//    // facebok login
//    
//    // Do any additional setup after loading the view.
//    [self drawRandomLeftTikkit];
//    [self drawRandomRightTikkit];
//    
//    [self setupShadowAndBorderForButton:self.rightTikkit];
//    [self setupShadowAndBorderForButton:self.leftTikkit];
//    [self setupProfileButton];
//    
//    _bottomBar.layer.opacity = 0.8f;
//    self.wallet1.layer.zPosition = 1.0;
//    self.wallet2.layer.zPosition = 1.0;
//    self.wallet3.layer.zPosition = 1.0;
//    
//    [self.leftTikkit addTarget:self action:@selector(leftButtonTapped:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
//    
//    [self.rightTikkit addTarget:self action:@selector(rightButtonTapped:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
//    
//    self.upSwipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didRejectLeft:)];
//    _upSwipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didRejectRight:)];
//    
//    [self.leftTikkit addGestureRecognizer:_upSwipeLeft];
//    [self.rightTikkit addGestureRecognizer:_upSwipeRight];
//    _upSwipeLeft.direction = UISwipeGestureRecognizerDirectionUp;
//    _upSwipeRight.direction = UISwipeGestureRecognizerDirectionUp;
//    
//    _downSwipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didAcceptLeft:)];
//    _downSwipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didAcceptRight:)];
//    
//    [self.leftTikkit addGestureRecognizer:_downSwipeLeft];
//    [self.rightTikkit addGestureRecognizer:_downSwipeRight];
//    _downSwipeLeft.direction = UISwipeGestureRecognizerDirectionDown;
//    _downSwipeRight.direction = UISwipeGestureRecognizerDirectionDown;
//    
////    _wallet1Click.frame = CGRectMake(55, 600, 230, 400);
//    _wallet2Click.frame = CGRectMake(55, 600, 230, 400);
//    _wallet3Click.frame = CGRectMake(55, 600, 230, 400);
//    _open_wallet1 = 0;
//    
//    self.wallet1.frame = CGRectMake(108.0, 480.0, 60.0, 60.0);
//    self.wallet2.frame = CGRectMake(176.0, 480.0, 60.0, 60.0);
//    self.wallet3.frame = CGRectMake(245.0, 480.0, 60.0, 60.0);
////    _wallet1Click.layer.cornerRadius = 10;
//    _wallet2Click.layer.cornerRadius = 10;
//    _wallet3Click.layer.cornerRadius = 10;
//    
//    _inWallet1 = 0;
//    _inWallet2 = 0;
//    _inWallet3 = 0;
//    
//    self.wallet2.layer.opacity = 0.4;
//    self.wallet3.layer.opacity = 0.4;
//    
//    _pop2 = 0;
//    _popoff.enabled = NO;
//    
//}
//
//- (void)didRejectLeft: (UISwipeGestureRecognizer *) sender {
//    PFObject *tikkit = [PFObject objectWithClassName:@"Coupons"];
//    tikkit[@"Acceptance"] = @0;
////    tikkit[@"brand"] = [_leftTikkitDetail objectAtIndex:0];
//    tikkit[@"brand"] = self.leftCouponModel.storeName;
//    
//    [tikkit saveInBackground];
//    [self drawRandomLeftTikkit];
//}
//
//- (void)didRejectRight: (UISwipeGestureRecognizer *) sender {
//    PFObject *tikkit = [PFObject objectWithClassName:@"Coupons"];
//    tikkit[@"Acceptance"] = @0;
////    tikkit[@"brand"] = [_rightTikkitDetail objectAtIndex:0];
//    tikkit[@"brand"] = self.rightCoupongModel.storeName;
//    [tikkit saveInBackground];
//    [self drawRandomRightTikkit];
//}
//
//- (void)didAcceptLeft: (UISwipeGestureRecognizer *)sender {
//    if (self.numberOfItemsInWallet < 3) {
//        
//        self.leftTikkit.frame = CGRectMake(15, 175, 130, 130);
//        _downSwipeLeft.enabled = YES;
//        _upSwipeLeft.enabled = YES;
//        self.rightTikkit.enabled = YES;
//        if (self.numberOfItemsInWallet == 0) {
//            UIImageView *brandName_wallet = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
//            brandName_wallet.backgroundColor = [UIColor whiteColor];
//            self.wallet1.alpha = 1.0;
//            [self.wallet1 addSubview:brandName_wallet];
//            [self.wallet1 addSubview:_left_img];
//            _inWallet1 = 1;
////            [self walletLeftDetail:_wallet1Click];
//            [UIView beginAnimations:@"ToggleView" context:nil];
//            [UIView setAnimationDuration:0.3];
//            self.wallet2.layer.opacity = 1;
//            [UIView commitAnimations];
//        } else if (self.numberOfItemsInWallet == 1) {
//            UIImageView *brandName_wallet = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
//            brandName_wallet.backgroundColor = [UIColor whiteColor];
//            [self.wallet2 addSubview:brandName_wallet];
//            [self.wallet2 addSubview:_left_img];
//            _inWallet2 = 1;
//            [self walletLeftDetail:_wallet2Click];
//            [UIView beginAnimations:@"ToggleView" context:nil];
//            [UIView setAnimationDuration:0.3];
//            self.wallet3.layer.opacity = 1;
//            [UIView commitAnimations];
//        } else if (self.numberOfItemsInWallet == 2) {
//            UIImageView *brandName_wallet = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
//            brandName_wallet.backgroundColor = [UIColor whiteColor];
//            [self.wallet3 addSubview:brandName_wallet];
//            [self.wallet3 addSubview:_left_img];
//            _inWallet3 = 1;
//            [self walletLeftDetail:_wallet3Click];
//        }
//        self.numberOfItemsInWallet++;
//        PFObject *tikkit = [PFObject objectWithClassName:@"Coupons"];
//        tikkit[@"Acceptance"] = @1;
////        tikkit[@"brand"] = [_leftTikkitDetail objectAtIndex:0];
//        tikkit[@"brand"] = self.leftCouponModel.storeName;
//        [tikkit saveInBackground];
//        [self drawRandomLeftTikkit];
//    } else {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Savvy"
//                                                        message:@"No available wallet space"
//                                                       delegate:nil
//                                              cancelButtonTitle:@"OK"
//                                              otherButtonTitles:nil];
//        [alert show];
//        [UIView setAnimationDuration:0.5];
//        if (self.leftTikkit.frame.size.height == 400){
//            self.leftTikkit.center = CGPointMake(160.0, 240.0);
//        } else {
//            self.leftTikkit.center = CGPointMake(80.0, 240.0);
//        }
//        [UIView commitAnimations];
//        
//    }
//}
//
//- (void)didAcceptRight: (UISwipeGestureRecognizer *) sender {
//    if (self.numberOfItemsInWallet < 3) {
//        self.rightTikkit.frame = CGRectMake(175, 175, 130, 130);
//        _downSwipeRight.enabled = YES;
//        _upSwipeRight.enabled = YES;
//        self.leftTikkit.enabled = YES;
//        if (self.numberOfItemsInWallet == 0) {
//            UIImageView *brandName_wallet = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
//            brandName_wallet.backgroundColor = [UIColor whiteColor];
//            self.wallet1.alpha = 1.0;
//            [self.wallet1 addSubview:brandName_wallet];
//            [self.wallet1 addSubview:_right_img];
//            _inWallet1 = 1;
////            [self walletRightDetail:_wallet1Click];
//            [UIView beginAnimations:@"ToggleView" context:nil];
//            [UIView setAnimationDuration:0.3];
//            self.wallet2.layer.opacity = 1;
//            [UIView commitAnimations];
//        } else if (self.numberOfItemsInWallet == 1) {
//            UIImageView *brandName_wallet = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
//            brandName_wallet.backgroundColor = [UIColor whiteColor];
//            [self.wallet2 addSubview:brandName_wallet];
//            [self.wallet2 addSubview:_right_img];
//            _inWallet2 = 1;
//            [self walletRightDetail:_wallet2Click];
//            [UIView beginAnimations:@"ToggleView" context:nil];
//            [UIView setAnimationDuration:0.3];
//            self.wallet3.layer.opacity = 1;
//            [UIView commitAnimations];
//        } else if (self.numberOfItemsInWallet == 2) {
//            UIImageView *brandName_wallet = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
//            brandName_wallet.backgroundColor = [UIColor whiteColor];
//            [self.wallet3 addSubview:brandName_wallet];
//            [self.wallet3 addSubview:_right_img];
//            _inWallet3 = 1;
//            [self walletRightDetail:_wallet3Click];
//        }
//        
//        self.numberOfItemsInWallet++;
//        PFObject *tikkit = [PFObject objectWithClassName:@"Coupons"];
//        tikkit[@"Acceptance"] = @1;
//        tikkit[@"brand"] = self.rightCoupongModel.storeName;
//        [tikkit saveInBackground];
//        [self drawRandomRightTikkit];
//    } else {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Savvy"
//                                                        message:@"No available wallet space"
//                                                       delegate:nil
//                                              cancelButtonTitle:@"OK"
//                                              otherButtonTitles:nil];
//        [alert show];
//        [UIView setAnimationDuration:0.5];
//        if (self.rightTikkit.frame.size.height == 400){
//            self.rightTikkit.center = CGPointMake(160.0, 240.0);
//        } else {
//            self.rightTikkit.center = CGPointMake(240.0, 240.0);
//        }
//        [UIView commitAnimations];
//    }
//}
//
//- (void)leftButtonTapped:(UIButton *)leftTikkit
//{
//    if (CGPointEqualToPoint(self.leftTikkit.center, CGPointMake(80, 240)) && ![self.leftTikkit.currentTitle length]) {
//        [UIView beginAnimations:@"ToggleView" context:nil];
//        [UIView setAnimationDuration:0.3];
//        self.leftTikkit.frame = CGRectMake(45, 40, 230, 400);
//        [UIView commitAnimations];
//        leftTikkit.layer.zPosition = 2;
//        self.rightTikkit.layer.zPosition = 0;
//        self.wallet1.layer.zPosition = 1;
//        self.wallet2.layer.zPosition = 1;
//        self.wallet3.layer.zPosition = 1;
//        _downSwipeLeft.enabled = NO;
//        _upSwipeLeft.enabled = NO;
//        self.rightTikkit.enabled = NO;
//        
//        [self showDetailLeft];
//    } else if (CGPointEqualToPoint(leftTikkit.center, CGPointMake(160.0, 240.0))) {
//        [UIView beginAnimations:@"ToggleView" context:nil];
//        [UIView setAnimationDuration:0.3];
//        leftTikkit.frame = CGRectMake(15, 175, 130, 130);
//        [UIView commitAnimations];
//        [self performSelector:@selector(returnLeftTikkit) withObject:nil afterDelay:0];
//        leftTikkit.layer.zPosition = 0;
//        self.wallet1.layer.zPosition = 10;
//        self.wallet2.layer.zPosition = 10;
//        self.wallet3.layer.zPosition = 10;
//        _downSwipeLeft.enabled = YES;
//        _upSwipeLeft.enabled = YES;
//        self.rightTikkit.enabled = YES;
//    } else if (leftTikkit.frame.size.height == 400){
//        [UIView beginAnimations:@"ToggleView" context:nil];
//        [UIView setAnimationDuration:0.3];
//        leftTikkit.center = CGPointMake(160.0, 240.0);
//        [UIView commitAnimations];
//        _bottomBar.layer.zPosition = 1;
//        _profile.layer.zPosition = 1;
//        [self.leftTikkit setTitle:@"" forState:UIControlStateNormal];
//        self.wallet1.layer.zPosition = 1;
//        self.wallet2.layer.zPosition = 1;
//        self.wallet3.layer.zPosition = 1;
//        
//    } else {
//        [UIView beginAnimations:@"ToggleView" context:nil];
//        [UIView setAnimationDuration:0.3];
//        leftTikkit.center = CGPointMake(80.0, 240.0);
//        [UIView commitAnimations];
//        _bottomBar.layer.zPosition = 1;
//        _profile.layer.zPosition = 1;
//        self.wallet1.layer.zPosition = 1;
//        self.wallet2.layer.zPosition = 1;
//        self.wallet3.layer.zPosition = 1;
//        [self.leftTikkit setTitle:@"" forState:UIControlStateNormal];
//    }
//}
//
//- (void)rightButtonTapped:(UIButton *)rightTikkit
//{
//    if (CGPointEqualToPoint(self.rightTikkit.center, CGPointMake(240, 240)) && ![self.rightTikkit.currentTitle length]) {
//        [UIView beginAnimations:@"ToggleView" context:nil];
//        [UIView setAnimationDuration:0.3];
//        self.rightTikkit.frame = CGRectMake(45, 40, 230, 400);
//        [UIView commitAnimations];
//        rightTikkit.layer.zPosition = 2;
//        self.leftTikkit.layer.zPosition = 0;
//        [self showDetailRight];
//        self.wallet1.layer.zPosition = 1;
//        self.wallet2.layer.zPosition = 1;
//        self.wallet3.layer.zPosition = 1;
//        _downSwipeRight.enabled = NO;
//        _upSwipeRight.enabled = NO;
//        self.leftTikkit.enabled = NO;
//        
//    } else if (CGPointEqualToPoint(rightTikkit.center, CGPointMake(160.0, 240.0))) {
//        [UIView beginAnimations:@"ToggleView" context:nil];
//        [UIView setAnimationDuration:0.3];
//        rightTikkit.frame = CGRectMake(175, 175, 130, 130);
//        [UIView commitAnimations];
//        [self performSelector:@selector(returnRightTikkit) withObject:nil afterDelay:0];
//        rightTikkit.layer.zPosition = 1;
//        self.leftTikkit.layer.zPosition = 0;
//        self.wallet1.layer.zPosition = 10;
//        self.wallet2.layer.zPosition = 10;
//        self.wallet3.layer.zPosition = 10;
//        _downSwipeRight.enabled = YES;
//        _upSwipeRight.enabled = YES;
//        self.leftTikkit.enabled = YES;
//    } else if (rightTikkit.frame.size.height == 400){
//        [UIView beginAnimations:@"ToggleView" context:nil];
//        [UIView setAnimationDuration:0.3];
//        rightTikkit.center = CGPointMake(160.0, 240.0);
//        [UIView commitAnimations];
//        self.wallet1.layer.zPosition = 1;
//        self.wallet2.layer.zPosition = 1;
//        self.wallet3.layer.zPosition = 1;
//    } else {
//        [UIView beginAnimations:@"ToggleView" context:nil];
//        [UIView setAnimationDuration:0.3];
//        rightTikkit.center = CGPointMake(240.0, 240.0);
//        [UIView commitAnimations];
//        self.wallet1.layer.zPosition = 1;
//        self.wallet2.layer.zPosition = 1;
//        self.wallet3.layer.zPosition = 1;
//    }
//    _bottomBar.layer.zPosition = 1;
//    _profile.layer.zPosition = 1;
//}
//
//- (void)showDetailRight
//{
//    [[self.rightTikkit subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
//    UIImageView *brandimg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 230, 140)];
//    brandimg.image = [UIImage imageNamed:self.rightCoupongModel.storeName];
//    [self.rightTikkit addSubview:brandimg];
//    
//    
//    UIImageView *brandName = [[UIImageView alloc] initWithFrame:CGRectMake(0, 140, 230, 45)];
//    NSMutableString *name = [[NSMutableString alloc] init];
//    [name appendString:self.rightCoupongModel.storeName];
//    [name appendString:@"_logo"];
//    brandName.image = [UIImage imageNamed:name];
//    brandName.contentMode = UIViewContentModeScaleAspectFit;
//    [self.rightTikkit addSubview:brandName];
//    
//    UILabel *discount = [[UILabel alloc] initWithFrame:CGRectMake(0, 170, 230.0, 53.0)];
//    discount.text = self.rightCoupongModel.storeDiscount;
//    discount.textAlignment = NSTextAlignmentCenter;
//    discount.font = [UIFont fontWithName:@"TFArrow-Light" size:35];
//    [self.rightTikkit addSubview:discount];
//    
//    UILabel *product = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, 230, 53)];
////    product.text = [_leftTikkitDetail objectAtIndex:3];
//    product.text = self.leftCouponModel.productType;
//    
//    product.textAlignment = NSTextAlignmentCenter;
//    product.font = [UIFont fontWithName:@"TFArrow-Light" size:35];
//    [self.rightTikkit addSubview:product];
//    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [button setTitle:@"Add To Wallet" forState:UIControlStateNormal];
//    button.titleLabel.font = [UIFont fontWithName:@"TFArrow-Light" size:20];
//    button.layer.cornerRadius = 5;
//    button.frame = CGRectMake(40.0, 300.0, 160.0, 40.0);
//    [button setBackgroundColor:[UIColor blackColor]];
//    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [button addTarget:self
//               action:@selector(didAcceptRight:)
//     forControlEvents:UIControlEventTouchUpInside];
//    [self.rightTikkit addSubview:button];
//    
//    
//    
//}
//
//- (void) returnRightTikkit
//{
//    [[self.rightTikkit subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
//    UIImageView *brandimg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 230.0, 124.0)];
//    brandimg.clipsToBounds = YES;
//    brandimg.image = [UIImage imageNamed:self.rightCoupongModel.storeName];
//    brandimg.contentMode = UIViewContentModeScaleAspectFill;
//    [self.rightTikkit addSubview:brandimg];
//    
//    UIImageView *brandName = [[UIImageView alloc] initWithFrame:CGRectMake(0, 140, 230, 53)];
//    NSMutableString *name = [[NSMutableString alloc] init];
//    [name appendString:self.rightCoupongModel.storeName];
//    [name appendString:@"_logo"];
//    brandName.image = [UIImage imageNamed:name];
//    brandName.clipsToBounds = YES;
//    brandName.contentMode = UIViewContentModeScaleAspectFit;
//    [self.rightTikkit addSubview:brandName];
//    
//    /*UILabel *discount = [[UILabel alloc] initWithFrame:CGRectMake(65, 185, 130.0, 53.0)];
//     discount.text = [_rightTikkitDetail objectAtIndex:1];
//     //discount.textAlignment = NSTextAlignmentCenter;
//     discount.font = [UIFont fontWithName:@"TFArrow-Light" size:20];
//     [self.rightTikkit addSubview:discount];*/
//    
//    UILabel *product = [[UILabel alloc] initWithFrame:CGRectMake(0, 113, 130, 12)];
//    product.text = self.rightCoupongModel.productType;
//    product.textAlignment = NSTextAlignmentCenter;
//    product.font = [UIFont fontWithName:@"TFArrow-Light" size:15];
//    [self.rightTikkit addSubview:product];
//    
//    UILabel *discount = [[UILabel alloc] initWithFrame:CGRectMake(0, 99, 130.0, 12.0)];
//    discount.text = self.rightCoupongModel.storeDiscount;
//    discount.textAlignment = NSTextAlignmentCenter;
//    discount.font = [UIFont fontWithName:@"TFArrow-Light" size:15];
//    [self.rightTikkit addSubview:discount];
//    
//    [UIView beginAnimations:@"ToggleView" context:nil];
//    [UIView setAnimationDuration:0.3];
//    brandimg.frame = CGRectMake(0, 0, 130, 70);
//    brandName.frame = CGRectMake(0, 70, 130, 30);
//    discount.frame = CGRectMake(0, 99, 130.0, 12.0);
//    product.frame = CGRectMake(0, 113, 130, 12);
//    [UIView commitAnimations];
//}
//
//- (void)showDetailLeft
//{
//    [[self.leftTikkit subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
//    UIImageView *brandimg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 230, 140)];
////    brandimg.image = [UIImage imageNamed:[_leftTikkitDetail objectAtIndex:0]];
//    brandimg.image = [UIImage imageNamed:self.leftCouponModel.storeName];
//    [self.leftTikkit addSubview:brandimg];
//    
//    
//    UIImageView *brandName = [[UIImageView alloc] initWithFrame:CGRectMake(0, 140, 230, 45)];
//    NSMutableString *name = [[NSMutableString alloc] init];
////    [name appendString:[_leftTikkitDetail objectAtIndex:0]];
//    [name appendString:self.leftCouponModel.storeName];
//    [name appendString:@"_logo"];
//    brandName.image = [UIImage imageNamed:name];
//    brandName.contentMode = UIViewContentModeScaleAspectFit;
//    [self.leftTikkit addSubview:brandName];
//    
//    UILabel *product = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, 230, 53.0)];
////    product.text = [_leftTikkitDetail objectAtIndex:3];
//    product.text = self.leftCouponModel.productType;
//    product.textAlignment = NSTextAlignmentCenter;
//    product.font = [UIFont fontWithName:@"TFArrow-Light" size:30];
//    [self.leftTikkit addSubview:product];
//    
//    UILabel *discount = [[UILabel alloc] initWithFrame:CGRectMake(0, 170, 230.0, 53.0)];
////    discount.text = [_leftTikkitDetail objectAtIndex:1];
//    discount.text = self.leftCouponModel.storeDiscount;
//    discount.textAlignment = NSTextAlignmentCenter;
//    discount.font = [UIFont fontWithName:@"TFArrow-Light" size:35];
//    [self.leftTikkit addSubview:discount];
//    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [button setTitle:@"Add To Wallet" forState:UIControlStateNormal];
//    button.titleLabel.font = [UIFont fontWithName:@"TFArrow-Light" size:20];
//    button.layer.cornerRadius = 5;
//    button.frame = CGRectMake(40.0, 300.0, 160.0, 40.0);
//    [button setBackgroundColor:[UIColor blackColor]];
//    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [button addTarget:self
//               action:@selector(didAcceptLeft:)
//     forControlEvents:UIControlEventTouchUpInside];
//    [self.leftTikkit addSubview:button];
//}
//
//- (void)walletLeftDetail: (UIButton *)b {
//    UIImageView *brandimg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 230, 140)];
////    brandimg.image = [UIImage imageNamed:[_leftTikkitDetail objectAtIndex:0]];
//    brandimg.image = [UIImage imageNamed:self.leftCouponModel.storeName];
//    [b addSubview:brandimg];
//    
//    
//    UIImageView *brandName = [[UIImageView alloc] initWithFrame:CGRectMake(0, 140, 230, 45)];
//    NSMutableString *name = [[NSMutableString alloc] init];
////    [name appendString:[_leftTikkitDetail objectAtIndex:0]];
//    [name appendString:self.leftCouponModel.storeName];
//    [name appendString:@"_logo"];
//    brandName.image = [UIImage imageNamed:name];
//    brandName.contentMode = UIViewContentModeScaleAspectFit;
//    [b addSubview:brandName];
//    
//    UILabel *discount = [[UILabel alloc] initWithFrame:CGRectMake(0, 175, 230.0, 53.0)];
////    discount.text = [_leftTikkitDetail objectAtIndex:1];
//    discount.text = self.leftCouponModel.storeDiscount;
//    discount.textAlignment = NSTextAlignmentCenter;
//    discount.font = [UIFont fontWithName:@"TFArrow-Light" size:35];
//    [b addSubview:discount];
//    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [button setTitle:@"Redeem" forState:UIControlStateNormal];
//    button.titleLabel.font = [UIFont fontWithName:@"TFArrow-Light" size:20];
//    button.layer.cornerRadius = 5;
//    button.frame = CGRectMake(40.0, 300.0, 160.0, 40.0);
//    [button setBackgroundColor:[UIColor blackColor]];
//    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [b addSubview:button];
//}
//
//- (void)walletRightDetail: (UIButton *)b {
//    UIImageView *brandimg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 230, 140)];
//    brandimg.image = [UIImage imageNamed:self.rightCoupongModel.storeName];
//    [b addSubview:brandimg];
//    
//    
//    UIImageView *brandName = [[UIImageView alloc] initWithFrame:CGRectMake(0, 140, 230, 45)];
//    NSMutableString *name = [[NSMutableString alloc] init];
//    [name appendString:self.rightCoupongModel.storeName];
//    [name appendString:@"_logo"];
//    brandName.image = [UIImage imageNamed:name];
//    brandName.contentMode = UIViewContentModeScaleAspectFit;
//    [b addSubview:brandName];
//    
//    UILabel *discount = [[UILabel alloc] initWithFrame:CGRectMake(0, 175, 230.0, 53.0)];
//    discount.text = self.rightCoupongModel.storeDiscount;
//    discount.textAlignment = NSTextAlignmentCenter;
//    discount.font = [UIFont fontWithName:@"TFArrow-Light" size:35];
//    [b addSubview:discount];
//    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [button setTitle:@"Redeem" forState:UIControlStateNormal];
//    button.titleLabel.font = [UIFont fontWithName:@"TFArrow-Light" size:20];
//    button.layer.cornerRadius = 5;
//    button.frame = CGRectMake(40.0, 300.0, 160.0, 40.0);
//    [button setBackgroundColor:[UIColor blackColor]];
//    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [b addSubview:button];
//}
//
//- (void)returnLeftTikkit {
//    [[self.leftTikkit subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
//    UIImageView *brandimg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 230.0, 124.0)];
//    brandimg.clipsToBounds = YES;
////    brandimg.image = [UIImage imageNamed:[_leftTikkitDetail objectAtIndex:0]];
//    brandimg.image = [UIImage imageNamed:self.leftCouponModel.storeName];
//    brandimg.contentMode = UIViewContentModeScaleAspectFill;
//    [self.leftTikkit addSubview:brandimg];
//    
//    UIImageView *brandName = [[UIImageView alloc] initWithFrame:CGRectMake(0, 140, 230, 53)];
//    NSMutableString *name = [[NSMutableString alloc] init];
////    [name appendString:[_leftTikkitDetail objectAtIndex:0]];
//    [name appendString:self.leftCouponModel.storeName];
//    [name appendString:@"_logo"];
//    brandName.image = [UIImage imageNamed:name];
//    brandName.clipsToBounds = YES;
//    brandName.contentMode = UIViewContentModeScaleAspectFit;
//    [self.leftTikkit addSubview:brandName];
//    
//    UILabel *product = [[UILabel alloc] initWithFrame:CGRectMake(0, 113, 130, 12)];
////    product.text = [_leftTikkitDetail objectAtIndex:3];
//    product.text= self.leftCouponModel.productType;
//    product.textAlignment = NSTextAlignmentCenter;
//    product.font = [UIFont fontWithName:@"TFArrow-Light" size:15];
//    [self.leftTikkit addSubview:product];
//    
//    UILabel *discount = [[UILabel alloc] initWithFrame:CGRectMake(0, 99, 130.0, 12.0)];
////    discount.text = [_leftTikkitDetail objectAtIndex:1];
//    discount.text = self.leftCouponModel.storeDiscount;
//    discount.textAlignment = NSTextAlignmentCenter;
//    discount.font = [UIFont fontWithName:@"TFArrow-Light" size:15];
//    [self.leftTikkit addSubview:discount];
//    
//    [UIView beginAnimations:@"ToggleView" context:nil];
//    [UIView setAnimationDuration:0.3];
//    brandimg.frame = CGRectMake(0, 0, 130, 70);
//    brandName.frame = CGRectMake(0, 70, 130, 30);
//    discount.frame = CGRectMake(0, 99, 130.0, 12.0);
//    product.frame = CGRectMake(0, 113, 130, 12);
//    [UIView commitAnimations];
//}
//
//- (IBAction)wal1:(UIButton *)sender {
//    
//    if (_inWallet1 == 1) {
//        if (_open_wallet1 == 0) {
//            
////            _wallet1Click.frame = CGRectMake(55, 500, 230, 400);
////            [_wallet1Click.layer setBorderWidth:0.5];
////            [_wallet1Click.layer setBorderColor:[[UIColor blackColor] CGColor]];
////            _wallet1Click.layer.cornerRadius = 10;
////            [UIView beginAnimations:@"ToggleView" context:nil];
////            [UIView setAnimationDuration:0.3];
//            
////            _wallet1Click.center = CGPointMake(170, 250);
////            [UIView commitAnimations];
////            _wallet1Click.layer.zPosition = 10;
////            _wallet1Click.backgroundColor = [UIColor whiteColor];
////            [self.view addSubview:_wallet1Click];
//            _open_wallet1 = 1;
//        } else {
////            if (_wallet1Click.center.y != 250) {
////                _wallet1Click.frame = CGRectMake(55, 500, 230, 400);
////                [_wallet1Click.layer setBorderWidth:0.5];
////                [_wallet1Click.layer setBorderColor:[[UIColor blackColor] CGColor]];
////                _wallet1Click.layer.cornerRadius = 10;
////                [UIView beginAnimations:@"ToggleView" context:nil];
////                [UIView setAnimationDuration:0.3];
////                _wallet2Click.frame = CGRectMake(55, 600, 230, 400);
////                _wallet1Click.center = CGPointMake(170, 250);
////                _wallet3Click.frame = CGRectMake(55, 600, 230, 400);
////                [UIView commitAnimations];
////                _wallet1Click.layer.zPosition = 10;
////                _wallet1Click.backgroundColor = [UIColor whiteColor];
////            } else {
////                [UIView beginAnimations:@"ToggleView" context:nil];
////                [UIView setAnimationDuration:0.3];
////                _wallet1Click.frame = CGRectMake(55, 600, 230, 400);
////                [UIView commitAnimations];
//                _open_wallet1 = 0;
////            }
//            CouponDetailsViewController *couponDetailsViewController = [[CouponDetailsViewController alloc]init];
//            couponDetailsViewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
////            self.view.backgroundColor = [UIColor clearColor];
//            [self presentViewController:couponDetailsViewController animated:YES completion:nil];
////            [self presentModalViewController:couponDetailsViewController animated:YES];
//        }
//    }
//}
//
//- (IBAction)wal2:(UIButton *)sender {
//    if (_inWallet2 == 1) {
//        if (_open_wallet1 == 0) {
//            _wallet2Click.frame = CGRectMake(55, 500, 230, 400);
//            [_wallet2Click.layer setBorderWidth:0.5];
//            [_wallet2Click.layer setBorderColor:[[UIColor blackColor] CGColor]];
//            _wallet2Click.layer.cornerRadius = 10;
//            [UIView beginAnimations:@"ToggleView" context:nil];
//            [UIView setAnimationDuration:0.3];
//            _wallet2Click.center = CGPointMake(170, 250);
//            [UIView commitAnimations];
//            _wallet2Click.layer.zPosition = 10;
//            _wallet2Click.backgroundColor = [UIColor whiteColor];
//            [self.view addSubview:_wallet2Click];
//            _open_wallet1 = 1;
//        } else {
//            if (_wallet2Click.center.y != 250) {
//                _wallet2Click.frame = CGRectMake(55, 500, 230, 400);
//                [_wallet2Click.layer setBorderWidth:0.5];
//                [_wallet2Click.layer setBorderColor:[[UIColor blackColor] CGColor]];
//                _wallet2Click.layer.cornerRadius = 10;
//                [UIView beginAnimations:@"ToggleView" context:nil];
//                [UIView setAnimationDuration:0.3];
//                _wallet2Click.center = CGPointMake(170, 250);
////                _wallet1Click.frame = CGRectMake(55, 600, 230, 400);
//                _wallet3Click.frame = CGRectMake(55, 600, 230, 400);
//                [UIView commitAnimations];
//                _wallet2Click.layer.zPosition = 10;
//                _wallet2Click.backgroundColor = [UIColor whiteColor];
//            } else {
//                [UIView beginAnimations:@"ToggleView" context:nil];
//                [UIView setAnimationDuration:0.3];
//                _wallet2Click.frame = CGRectMake(55, 600, 230, 400);
//                [UIView commitAnimations];
//                _open_wallet1 = 0;
//            }
//        }
//    }
//}
//- (IBAction)wal3:(UIButton *)sender {
//    if (_inWallet3 == 1) {
//        if (_open_wallet1 == 0) {
//            _wallet3Click.frame = CGRectMake(55, 500, 230, 400);
//            [_wallet3Click.layer setBorderWidth:0.5];
//            [_wallet3Click.layer setBorderColor:[[UIColor blackColor] CGColor]];
//            _wallet3Click.layer.cornerRadius = 10;
//            [UIView beginAnimations:@"ToggleView" context:nil];
//            [UIView setAnimationDuration:0.3];
//            _wallet3Click.center = CGPointMake(170, 250);
//            [UIView commitAnimations];
//            _wallet3Click.layer.zPosition = 10;
//            _wallet3Click.backgroundColor = [UIColor whiteColor];
//            [self.view addSubview:_wallet3Click];
//            _open_wallet1 = 1;
//        } else {
//            if (_wallet3Click.center.y != 250) {
//                _wallet3Click.frame = CGRectMake(55, 500, 230, 400);
//                [_wallet3Click.layer setBorderWidth:0.5];
//                [_wallet3Click.layer setBorderColor:[[UIColor blackColor] CGColor]];
//                _wallet3Click.layer.cornerRadius = 10;
//                [UIView beginAnimations:@"ToggleView" context:nil];
//                [UIView setAnimationDuration:0.3];
//                _wallet3Click.frame = CGRectMake(55, 600, 230, 400);
//                _wallet3Click.center = CGPointMake(170, 250);
////                _wallet1Click.frame = CGRectMake(55, 600, 230, 400);
//                _wallet2Click.frame = CGRectMake(55, 600, 230, 400);
//                [UIView commitAnimations];
//                _wallet3Click.layer.zPosition = 10;
//                _wallet3Click.backgroundColor = [UIColor whiteColor];
//            } else {
//                [UIView beginAnimations:@"ToggleView" context:nil];
//                [UIView setAnimationDuration:0.3];
//                _wallet3Click.frame = CGRectMake(55, 600, 230, 400);
//                [UIView commitAnimations];
//                _open_wallet1 = 0;
//            }
//        }
//    }
//}
//
//
//- (IBAction)refresh:(UIButton *)sender {
//    
//    if (_pop2 == 0) {
//        _pop = [[UIImageView alloc] init];
//        _pop.frame = CGRectMake(0, -1000, 320, 568);
//        _pop.image = [UIImage imageNamed:@"formal"];
//        _pop.layer.zPosition = 99999;
//        [self.view addSubview:_pop];
//        [UIView beginAnimations:@"ToggleView" context:nil];
//        [UIView setAnimationDuration:0.5];
//        _pop.frame = CGRectMake(0, 0, 320, 568);
//        [UIView commitAnimations];
//        _pop2 = 1;
//    } else if (_pop2 == 1) {
//        _pop.frame = CGRectMake(0, -1000, 320, 568);
//        _pop.layer.opacity = 1;
//        _pop.image = [UIImage imageNamed:@"cuff"];
//        _pop.layer.zPosition = 99999;
//        [self.view addSubview:_pop];
//        [UIView beginAnimations:@"ToggleView" context:nil];
//        [UIView setAnimationDuration:0.5];
//        _pop.frame = CGRectMake(0, 0, 320, 568);
//        [UIView commitAnimations];
//        _pop2 = 2;
//        _popoff.enabled = YES;
//        
//    }
//}
//
//
//#pragma marl - Setup
//
//- (void)setupShadowAndBorderForButton:(UIButton *)button {
//    button.layer.cornerRadius = 10;
//    button.clipsToBounds = YES;
//    button.backgroundColor = [UIColor whiteColor];
//    
//    button.layer.masksToBounds = YES;
//    button.layer.shadowColor = [UIColor blackColor].CGColor;
//    button.layer.shadowOpacity = 1.0f;
//    button.layer.shadowRadius = 8.0f;
//    button.layer.shadowOffset = CGSizeMake(1.0f, 3.0f);
//    button.layer.borderColor = [UIColor blackColor].CGColor;
//    button.layer.borderWidth = 0.5f;
//}
//
//- (void)setupProfileButton {
//    self.profile.frame = CGRectMake(20.0, 470.0, 75.0, 75.0);
//    self.profile.clipsToBounds = YES;
//    self.profile.layer.cornerRadius = 37.5;
//    //_profile.layer.borderWidth = 1.5f;
//    self.profile.layer.shadowColor = [UIColor blackColor].CGColor;
//    self.profile.layer.shadowRadius = 8.0f;
//    self.profile.layer.shadowOffset = CGSizeMake(1.0f, 3.0f);
//    self.profile.layer.zPosition = 1;
//    _bottomBar.layer.zPosition = 1;
//    [self.profile setBackgroundImage:[UIImage imageNamed:@"profile"] forState:UIControlStateNormal];
//}
//
//
//#pragma mark - Profile
//
//- (IBAction)openProfile:(UIButton *)sender {
//    if ([sender.currentTitle length])
//    {
//        CGRect frame = CGRectMake(0.0, 505.0, 320.0, 65.0);
//        [UIView beginAnimations:@"ToggleViews" context:nil];
//        [UIView setAnimationDuration:0.4];
//        _bottomBar.frame = frame;
//        _profile.frame = CGRectMake(20.0, 470.0, 75.0, 75.0);
//        self.wallet1.frame = CGRectMake(108.0, 480.0, 60.0, 60.0);
//        self.wallet2.frame = CGRectMake(176.0, 480.0, 60.0, 60.0);
//        self.wallet3.frame = CGRectMake(245.0, 480.0, 60.0, 60.0);
//        [UIView commitAnimations];
//        [sender setTitle:@"" forState:UIControlStateNormal];
//        _bottomBar.layer.zPosition = 10;
//        _profile.layer.zPosition = 10;
//        self.wallet1.layer.zPosition = 10;
//        self.wallet2.layer.zPosition = 10;
//        self.wallet3.layer.zPosition = 10;
//        self.leftTikkit.enabled = YES;
//        self.rightTikkit.enabled = YES;
//        
//    } else {
//        CGRect frame = CGRectMake(0.0, 100.0, 320.0, 600.0);
//        [UIView beginAnimations:@"ToggleViews" context:nil];
//        [UIView setAnimationDuration:0.4];
//        _bottomBar.frame = frame;
//        _bottomBar.backgroundColor = [UIColor blackColor];
//        _profile.frame = CGRectMake(20.0, 65.5, 75.0, 75.0);
//        self.wallet1.frame = CGRectMake(108.0, 65.5, 60.0, 60.0);
//        self.wallet2.frame = CGRectMake(176.0, 65.5, 60.0, 60.0);
//        self.wallet3.frame = CGRectMake(245.0, 65.5, 60.0, 60.0);
//        [UIView commitAnimations];
//        [sender setTitle:@" " forState:UIControlStateNormal];
//        _bottomBar.layer.zPosition = 10;
//        _profile.layer.zPosition = 10;
//        self.wallet1.layer.zPosition = 10;
//        self.wallet2.layer.zPosition = 10;
//        self.wallet3.layer.zPosition = 10;
//        self.leftTikkit.enabled = NO;
//        self.rightTikkit.enabled = NO;
//    }
//    
//}
//
//
//#pragma mark - Drawing Right and Left Coupons
//
//- (void)drawRandomLeftTikkit {
//    [[self.leftTikkit subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
//    savvyModel *tiks = [[savvyModel alloc] init];
//    NSArray *brands = [tiks newTikkit];
//    self.leftCouponModel = [[CouponModel alloc] init];
//    self.leftCouponModel.storeName = [brands objectAtIndex:0];
//    self.leftCouponModel.storeDiscount = [brands objectAtIndex:1];
//    self.leftCouponModel.productType = [brands objectAtIndex:3];
//    
//    while ([self.leftCouponModel.storeName isEqualToString:self.rightCoupongModel.storeName]) {
//        brands = [tiks newTikkit];
//        self.leftCouponModel.storeName = [brands objectAtIndex:0];
//        self.leftCouponModel.storeDiscount = [brands objectAtIndex:1];
//        self.leftCouponModel.productType = [brands objectAtIndex:3];
//    }
//    [_leftBack.layer setBorderWidth:2.0];
//    [_leftBack.layer setBorderColor:[[UIColor blackColor] CGColor]];
//    UIImageView *brandimg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 130.0, 70.0)];
//    brandimg.clipsToBounds = YES;
//    brandimg.image = [UIImage imageNamed:[brands objectAtIndex:0]];
//    brandimg.contentMode = UIViewContentModeScaleAspectFill;
//    [self.leftTikkit addSubview:brandimg];
//    
//    NSMutableString *back_name = [[NSMutableString alloc] init];
//    [back_name appendString:[brands objectAtIndex:0]];
//    [back_name appendString:@"_back"];
//    UIImage *backimg = [UIImage imageNamed:back_name];
//    UIImageView *back = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 160, 568)];
//    back.contentMode = UIViewContentModeScaleAspectFill;
//    back.image = backimg;
//    [_leftBack addSubview:back];
//    [UIView beginAnimations:@"background" context:nil];
//    [UIView setAnimationDuration:25];
//    [UIView commitAnimations];
//    
//    UIImageView *brandName = [[UIImageView alloc] initWithFrame:CGRectMake(0, 70, 130, 30)];
//    NSMutableString *name = [[NSMutableString alloc] init];
//    [name appendString:[brands objectAtIndex:0]];
//    [name appendString:@"_logo"];
//    brandName.image = [UIImage imageNamed:name];
//    brandName.clipsToBounds = YES;
//    brandName.contentMode = UIViewContentModeScaleAspectFit;
//    [self.leftTikkit addSubview:brandName];
//    
//    UIImageView *brandName_wallet = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
//    NSMutableString *name_wallet = [[NSMutableString alloc] init];
//    [name_wallet appendString:[brands objectAtIndex:0]];
//    [name_wallet appendString:@"_logo"];
//    brandName_wallet.image = [UIImage imageNamed:name];
//    brandName_wallet.clipsToBounds = YES;
//    brandName_wallet.contentMode = UIViewContentModeScaleAspectFit;
//    _left_img = brandName_wallet;
//    
//    UILabel *product = [[UILabel alloc] initWithFrame:CGRectMake(0, 113, 130, 12)];
//    product.text = [brands objectAtIndex:3];
//    product.textAlignment = NSTextAlignmentCenter;
//    product.font = [UIFont fontWithName:@"TFArrow-Light" size:15];
//    [self.leftTikkit addSubview:product];
//    
//    UILabel *discount = [[UILabel alloc] initWithFrame:CGRectMake(0, 99, 130.0, 12.0)];
//    discount.text = [brands objectAtIndex:1];
//    discount.textAlignment = NSTextAlignmentCenter;
//    discount.font = [UIFont fontWithName:@"TFArrow-Light" size:15];
//    [self.leftTikkit addSubview:discount];
//    
//    self.leftTikkit.center = CGPointMake(80, 1000);
//    self.leftTikkit.layer.zPosition = 0;
//    [UIView beginAnimations:@"background" context:nil];
//    [UIView setAnimationDuration:0.5];
//    self.leftTikkit.center = CGPointMake(80, 240);
//    [UIView commitAnimations];
//}
//
//- (void)drawRandomRightTikkit {
//    [[self.rightTikkit subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
//    savvyModel *tiks = [[savvyModel alloc] init];
//    NSArray *brands = [tiks newTikkit];
//    self.rightCoupongModel = [[CouponModel alloc] init];
//    self.rightCoupongModel.storeName = [brands objectAtIndex:0];
//    self.rightCoupongModel.storeDiscount = [brands objectAtIndex:1];
//    self.rightCoupongModel.productType = [brands objectAtIndex:3];
//    
//    while ([self.rightCoupongModel.storeName isEqualToString:self.leftCouponModel.storeName]) {
//        brands = [tiks newTikkit];
//        self.rightCoupongModel.storeName = [brands objectAtIndex:0];
//        self.rightCoupongModel.storeDiscount = [brands objectAtIndex:1];
//        self.rightCoupongModel.productType = [brands objectAtIndex:3];
//    }
//
//    
//    [_rightBack.layer setBorderWidth:2.0];
//    [_rightBack.layer setBorderColor:[[UIColor blackColor] CGColor]];
//    UIImageView *brandimg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 130.0, 70.0)];
//    brandimg.clipsToBounds = YES;
//    brandimg.image = [UIImage imageNamed:[brands objectAtIndex:0]];
//    brandimg.contentMode = UIViewContentModeScaleAspectFill;
//    [self.rightTikkit addSubview:brandimg];
//    
//    
//    NSMutableString *back_name = [[NSMutableString alloc] init];
//    [back_name appendString:[brands objectAtIndex:0]];
//    [back_name appendString:@"_back"];
//    UIImage *backimg = [UIImage imageNamed:back_name];
//    UIImageView *back = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 160, 568)];
//    back.contentMode = UIViewContentModeScaleAspectFill;
//    back.image = backimg;
//    [_rightBack addSubview:back];
//    [UIView beginAnimations:@"background" context:nil];
//    [UIView setAnimationDuration:25];
//    //back.center = CGPointMake(240, 284);
//    [UIView commitAnimations];
//    
//    UIImageView *brandName = [[UIImageView alloc] initWithFrame:CGRectMake(0, 70, 130, 30)];
//    NSMutableString *name = [[NSMutableString alloc] init];
//    [name appendString:[brands objectAtIndex:0]];
//    [name appendString:@"_logo"];
//    brandName.image = [UIImage imageNamed:name];
//    brandName.clipsToBounds = YES;
//    brandName.contentMode = UIViewContentModeScaleAspectFit;
//    [self.rightTikkit addSubview:brandName];
//    
//    UIImageView *brandName_wallet = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
//    NSMutableString *name_wallet = [[NSMutableString alloc] init];
//    [name_wallet appendString:[brands objectAtIndex:0]];
//    [name_wallet appendString:@"_logo"];
//    brandName_wallet.image = [UIImage imageNamed:name];
//    brandName_wallet.clipsToBounds = YES;
//    brandName_wallet.contentMode = UIViewContentModeScaleAspectFit;
//    _right_img = brandName_wallet;
//    
//    UILabel *product = [[UILabel alloc] initWithFrame:CGRectMake(0, 113, 130, 12)];
//    product.text = [brands objectAtIndex:3];
//    product.textAlignment = NSTextAlignmentCenter;
//    product.font = [UIFont fontWithName:@"TFArrow-Light" size:15];
//    [self.rightTikkit addSubview:product];
//    
//    UILabel *discount = [[UILabel alloc] initWithFrame:CGRectMake(0, 99, 130.0, 12.0)];
//    discount.text = [brands objectAtIndex:1];
//    discount.textAlignment = NSTextAlignmentCenter;
//    discount.font = [UIFont fontWithName:@"TFArrow-Light" size:15];
//    [self.rightTikkit addSubview:discount];
//    
//    self.rightTikkit.center = CGPointMake(240, 1000);
//    self.rightTikkit.layer.zPosition = 0;
//    [UIView beginAnimations:@"background" context:nil];
//    [UIView setAnimationDuration:0.5];
//    self.rightTikkit.center = CGPointMake(240, 240);
//    [UIView commitAnimations];
//}
//
////- (void)leftButtonDragged:(UIButton *)leftTikkit withEvent:(UIEvent *) event
////{
////    UITouch *touch = [[event touchesForView:leftTikkit] anyObject];
////    CGPoint previousLocation = [touch previousLocationInView:leftTikkit];
////    CGPoint location = [touch locationInView:leftTikkit];
////    CGFloat delta_x = location.x - previousLocation.x;
////    CGFloat delta_y = location.y - previousLocation.y;
////    leftTikkit.center = CGPointMake(leftTikkit.center.x + delta_x, leftTikkit.center.y + delta_y);
////    self.leftTikkit.layer.zPosition = 2;
////    self.rightTikkit.layer.zPosition = 0;
////    if (leftTikkit.center.y < 50) {
////        [self.leftTikkit setTitle:@" " forState:UIControlStateNormal];
////        [self drawRandomLeftTikkit];
////    }
////}
////
////- (void)rightButtonWasDragged:(UIButton *)rightTikkit withEvent:(UIEvent *) event
////{
////    UITouch *touch = [[event touchesForView:rightTikkit] anyObject];
////    CGPoint previousLocation = [touch previousLocationInView:rightTikkit];
////    CGPoint location = [touch locationInView:rightTikkit];
////    CGFloat delta_x = location.x - previousLocation.x;
////    CGFloat delta_y = location.y - previousLocation.y;
////    rightTikkit.center = CGPointMake(rightTikkit.center.x + delta_x, rightTikkit.center.y + delta_y);
////    self.leftTikkit.layer.zPosition = 0;
////    self.rightTikkit.layer.zPosition = 2;
////    if (self.rightTikkit.center.y < 50) {
////        [self drawRandomRightTikkit];
////    }
////}

@end
