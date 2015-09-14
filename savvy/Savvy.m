//
//  Savvy.m
//  Savvy
//
//  Created by Eric Chen on 2014-06-11.
//  Copyright (c) 2014 Savvy. All rights reserved.
//

#import "Savvy.h"
#import "savvyModel.h"
#import "savvyLeft.h"
#import <QuartzCore/QuartzCore.h>

@interface Savvy ()
@property (strong, nonatomic) IBOutlet UIImageView *leftBack;
@property (strong, nonatomic) IBOutlet UIImageView *left_img;
@property (strong, nonatomic) IBOutlet UIImageView *right_img;
@property (strong, nonatomic) IBOutlet UIImageView *rightBack;
@property (strong, nonatomic) IBOutlet UIButton *rightTikkit;
@property (strong, nonatomic) IBOutlet UIButton *leftTikkit;
@property (strong, nonatomic) IBOutlet UIView *bottomBar;
@property (strong, nonatomic) IBOutlet UIButton *profile;
@property (strong, nonatomic) IBOutlet UIButton *wallet1;
@property (strong, nonatomic) IBOutlet UIButton *wallet2;
@property (strong, nonatomic) IBOutlet UIButton *wallet3;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *downSwipeLeft;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *upSwipeLeft;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *downSwipeRight;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *upSwipeRight;
@property (strong, nonatomic) NSArray *rightTikkitDetail;
@property (strong, nonatomic) NSArray *leftTikkitDetail;
@property (strong, nonatomic) NSArray *firstWallet;
@property (strong, nonatomic) NSArray *secondWallet;
@property (strong, nonatomic) NSArray *thirdWallet;
@property (strong, nonatomic) IBOutlet UIButton *wallet1Click;
@property (strong, nonatomic) IBOutlet UIButton *wallet2Click;
@property (strong, nonatomic) IBOutlet UIButton *wallet3Click;
@property (strong, nonatomic) IBOutlet UIView *back;
@property (strong, nonatomic) IBOutlet UIView *back2;
@property (strong, nonatomic) IBOutlet UIView *back3;
@property (strong, nonatomic) IBOutlet UIView *back4;

@property (strong, nonatomic) IBOutlet UIButton *popoff;
@property (strong, nonatomic) IBOutlet UIImageView *pop;
@property (weak, nonatomic) IBOutlet UIButton *close_pop;


@property int wallets;
@property int open_wallet1;
@property int open_wallet2;
@property int open_wallet3;
@property int inWallet1;
@property int inWallet2;
@property int inWallet3;
@property int pop2;
@end

@implementation Savvy

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)refresh:(UIButton *)sender {
    
    if (_pop2 == 0) {
        _pop = [[UIImageView alloc] init];
        _pop.frame = CGRectMake(0, -1000, 320, 568);
        _pop.image = [UIImage imageNamed:@"formal"];
        _pop.layer.zPosition = 99999;
        [self.view addSubview:_pop];
        [UIView beginAnimations:@"ToggleView" context:nil];
        [UIView setAnimationDuration:0.5];
        _pop.frame = CGRectMake(0, 0, 320, 568);
        [UIView commitAnimations];
        _pop2 = 1;
    } else if (_pop2 == 1) {
        _pop.frame = CGRectMake(0, -1000, 320, 568);
        _pop.layer.opacity = 1;
        _pop.image = [UIImage imageNamed:@"cuff"];
        _pop.layer.zPosition = 99999;
        [self.view addSubview:_pop];
        [UIView beginAnimations:@"ToggleView" context:nil];
        [UIView setAnimationDuration:0.5];
        _pop.frame = CGRectMake(0, 0, 320, 568);
        [UIView commitAnimations];
        _pop2 = 2;
        _popoff.enabled = YES;

    }
}

- (IBAction)close:(UIButton *)sender {
    [UIView beginAnimations:@"ToggleView" context:nil];
    [UIView setAnimationDuration:0.3];
    _pop.layer.opacity = 0;
    [UIView commitAnimations];
    _popoff.enabled = NO;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    _wallets = 0;
    
    // facebok login
    
    
    // Do any additional setup after loading the view.
    blurredImages = [[NSMutableArray alloc] init];
    [self drawRandomLeftTikkit];
    [self drawRandomRightTikkit];
    _rightTikkit.layer.cornerRadius = 10;
    _rightTikkit.clipsToBounds = YES;
    _rightTikkit.backgroundColor = [UIColor whiteColor];
    
    _rightTikkit.layer.masksToBounds = YES;
    _rightTikkit.layer.shadowColor = [UIColor blackColor].CGColor;
    _rightTikkit.layer.shadowOpacity = 1.0f;
    _rightTikkit.layer.shadowRadius = 8.0f;
    _rightTikkit.layer.shadowOffset = CGSizeMake(1.0f, 3.0f);
    _rightTikkit.layer.borderColor = [UIColor blackColor].CGColor;
    _rightTikkit.layer.borderWidth = 0.5f;
    _rightTikkit.userInteractionEnabled = YES;
    
    _leftTikkit.layer.cornerRadius = 10;
    _leftTikkit.clipsToBounds = YES;
    _leftTikkit.backgroundColor = [UIColor whiteColor];
    
    _leftTikkit.layer.masksToBounds = YES;
    _leftTikkit.layer.shadowColor = [UIColor blackColor].CGColor;
    _leftTikkit.layer.shadowOpacity = 1.0f;
    _leftTikkit.layer.shadowRadius = 8.0f;
    _leftTikkit.layer.shadowOffset = CGSizeMake(1.0f, 3.0f);
    _leftTikkit.layer.borderColor = [UIColor blackColor].CGColor;
    _leftTikkit.layer.borderWidth = 0.5f;
    
    _bottomBar.layer.opacity = 0.8f;
    _wallet1.layer.zPosition = 1.0;
    _wallet2.layer.zPosition = 1.0;
    _wallet3.layer.zPosition = 1.0;
    
    _profile.frame = CGRectMake(20.0, 470.0, 75.0, 75.0);
    _profile.clipsToBounds = YES;
    _profile.layer.cornerRadius = 37.5;
    //_profile.layer.borderWidth = 1.5f;
    _profile.layer.shadowColor = [UIColor blackColor].CGColor;
    _profile.layer.shadowRadius = 8.0f;
    _profile.layer.shadowOffset = CGSizeMake(1.0f, 3.0f);
    _profile.layer.zPosition = 1;
    _bottomBar.layer.zPosition = 1;
    [_profile setBackgroundImage:[UIImage imageNamed:@"profile"] forState:UIControlStateNormal];
    
    [_leftTikkit addTarget:self action:@selector(wasDraggedLeft:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_leftTikkit addTarget:self action:@selector(touchesEndedLeft:withEvent:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    
    [_rightTikkit addTarget:self action:@selector(wasDraggedRight:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [_rightTikkit addTarget:self action:@selector(touchesEndedRight:withEvent:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    
    _upSwipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didRejectLeft:)];
    _upSwipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didRejectRight:)];
    
    [_leftTikkit addGestureRecognizer:_upSwipeLeft];
    [_rightTikkit addGestureRecognizer:_upSwipeRight];
    _upSwipeLeft.direction = UISwipeGestureRecognizerDirectionUp;
    _upSwipeRight.direction = UISwipeGestureRecognizerDirectionUp;
    
    _downSwipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didAcceptLeft:)];
    _downSwipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didAcceptRight:)];
    
    [_leftTikkit addGestureRecognizer:_downSwipeLeft];
    [_rightTikkit addGestureRecognizer:_downSwipeRight];
    _downSwipeLeft.direction = UISwipeGestureRecognizerDirectionDown;
    _downSwipeRight.direction = UISwipeGestureRecognizerDirectionDown;
    
    _wallet1Click.frame = CGRectMake(55, 600, 230, 400);
    _wallet2Click.frame = CGRectMake(55, 600, 230, 400);
    _wallet3Click.frame = CGRectMake(55, 600, 230, 400);
    _open_wallet1 = 0;
    _back = [[UIView alloc] init];
    _back.backgroundColor = [UIColor blackColor];
    _back2 = [[UIView alloc] init];
    _back2.backgroundColor = [UIColor blackColor];
    _back3 = [[UIView alloc] init];
    _back3.backgroundColor = [UIColor blackColor];
    _back4 = [[UIView alloc] init];
    _back4.backgroundColor = [UIColor blackColor];
    _wallet1.frame = CGRectMake(108.0, 480.0, 60.0, 60.0);
    _wallet2.frame = CGRectMake(176.0, 480.0, 60.0, 60.0);
    _wallet3.frame = CGRectMake(245.0, 480.0, 60.0, 60.0);
    _wallet1Click.layer.cornerRadius = 10;
    _wallet2Click.layer.cornerRadius = 10;
    _wallet3Click.layer.cornerRadius = 10;
    
    _inWallet1 = 0;
    _inWallet2 = 0;
    _inWallet3 = 0;
    
    _wallet2.layer.opacity = 0.4;
    _wallet3.layer.opacity = 0.4;
    
    _pop2 = 0;
    _popoff.enabled = NO;
    
}

- (void)didRejectLeft: (UISwipeGestureRecognizer *) sender
{
    PFObject *tikkit = [PFObject objectWithClassName:@"Coupons"];
    tikkit[@"Acceptance"] = @0;
    tikkit[@"brand"] = [_leftTikkitDetail objectAtIndex:0];
    [tikkit saveInBackground];
    [self drawRandomLeftTikkit];
}

- (void)didRejectRight: (UISwipeGestureRecognizer *) sender
{
    PFObject *tikkit = [PFObject objectWithClassName:@"Coupons"];
    tikkit[@"Acceptance"] = @0;
    tikkit[@"brand"] = [_rightTikkitDetail objectAtIndex:0];
    [tikkit saveInBackground];
    [self drawRandomRightTikkit];
}

- (void)didAcceptLeft: (UISwipeGestureRecognizer *) sender
{
    if (_wallets < 3) {
        _leftTikkit.frame = CGRectMake(15, 175, 130, 130);
        _downSwipeLeft.enabled = YES;
        _upSwipeLeft.enabled = YES;
        _rightTikkit.enabled = YES;
        if (_wallets == 0) {
            _firstWallet = _leftTikkitDetail;
            UIImageView *brandName_wallet = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
            brandName_wallet.backgroundColor = [UIColor whiteColor];
            _wallet1.alpha = 1.0;
            [_wallet1 addSubview:brandName_wallet];
            [_wallet1 addSubview:_left_img];
            _inWallet1 = 1;
            [self walletLeftDetail:_wallet1Click];
            [UIView beginAnimations:@"ToggleView" context:nil];
            [UIView setAnimationDuration:0.3];
            _wallet2.layer.opacity = 1;
            [UIView commitAnimations];
        } else if (_wallets == 1) {
            _firstWallet = _leftTikkitDetail;
            UIImageView *brandName_wallet = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
            brandName_wallet.backgroundColor = [UIColor whiteColor];
            [_wallet2 addSubview:brandName_wallet];
            [_wallet2 addSubview:_left_img];
            _inWallet2 = 1;
            [self walletLeftDetail:_wallet2Click];
            [UIView beginAnimations:@"ToggleView" context:nil];
            [UIView setAnimationDuration:0.3];
            _wallet3.layer.opacity = 1;
            [UIView commitAnimations];
        } else if (_wallets == 2) {
            _firstWallet = _leftTikkitDetail;
            UIImageView *brandName_wallet = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
            brandName_wallet.backgroundColor = [UIColor whiteColor];
            [_wallet3 addSubview:brandName_wallet];
            [_wallet3 addSubview:_left_img];
            _inWallet3 = 1;
            [self walletLeftDetail:_wallet3Click];
        }
        _wallets++;
        PFObject *tikkit = [PFObject objectWithClassName:@"Coupons"];
        tikkit[@"Acceptance"] = @1;
        tikkit[@"brand"] = [_leftTikkitDetail objectAtIndex:0];
        [tikkit saveInBackground];
        [self drawRandomLeftTikkit];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Savvy"
                                                        message:@"No available wallet space"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [UIView setAnimationDuration:0.5];
        if (_leftTikkit.frame.size.height == 400){
            _leftTikkit.center = CGPointMake(160.0, 240.0);
        } else {
            _leftTikkit.center = CGPointMake(80.0, 240.0);
        }
        [UIView commitAnimations];
        
    }
}

- (void)didAcceptRight: (UISwipeGestureRecognizer *) sender
{
    if (_wallets < 3) {
        _rightTikkit.frame = CGRectMake(175, 175, 130, 130);
        _downSwipeRight.enabled = YES;
        _upSwipeRight.enabled = YES;
        _leftTikkit.enabled = YES;
        if (_wallets == 0) {
            _firstWallet = _rightTikkitDetail;
            UIImageView *brandName_wallet = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
            brandName_wallet.backgroundColor = [UIColor whiteColor];
            _wallet1.alpha = 1.0;
            [_wallet1 addSubview:brandName_wallet];
            [_wallet1 addSubview:_right_img];
            _inWallet1 = 1;
            [self walletRightDetail:_wallet1Click];
            [UIView beginAnimations:@"ToggleView" context:nil];
            [UIView setAnimationDuration:0.3];
            _wallet2.layer.opacity = 1;
            [UIView commitAnimations];
        } else if (_wallets == 1) {
            _firstWallet = _rightTikkitDetail;
            UIImageView *brandName_wallet = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
            brandName_wallet.backgroundColor = [UIColor whiteColor];
            [_wallet2 addSubview:brandName_wallet];
            [_wallet2 addSubview:_right_img];
            _inWallet2 = 1;
            [self walletRightDetail:_wallet2Click];
            [UIView beginAnimations:@"ToggleView" context:nil];
            [UIView setAnimationDuration:0.3];
            _wallet3.layer.opacity = 1;
            [UIView commitAnimations];
        } else if (_wallets == 2) {
            _firstWallet = _rightTikkitDetail;
            UIImageView *brandName_wallet = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
            brandName_wallet.backgroundColor = [UIColor whiteColor];
            [_wallet3 addSubview:brandName_wallet];
            [_wallet3 addSubview:_right_img];
            _inWallet3 = 1;
            [self walletRightDetail:_wallet3Click];
        }

        _wallets++;
        PFObject *tikkit = [PFObject objectWithClassName:@"Coupons"];
        tikkit[@"Acceptance"] = @1;
        tikkit[@"brand"] = [_rightTikkitDetail objectAtIndex:0];
        [tikkit saveInBackground];
        [self drawRandomRightTikkit];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Savvy"
                                                        message:@"No available wallet space"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [UIView setAnimationDuration:0.5];
        if (_rightTikkit.frame.size.height == 400){
            _rightTikkit.center = CGPointMake(160.0, 240.0);
        } else {
            _rightTikkit.center = CGPointMake(240.0, 240.0);
        }
        [UIView commitAnimations];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)openProfile:(UIButton *)sender {
    if ([sender.currentTitle length])
    {
        CGRect frame = CGRectMake(0.0, 505.0, 320.0, 65.0);
        [UIView beginAnimations:@"ToggleViews" context:nil];
        [UIView setAnimationDuration:0.4];
        _bottomBar.frame = frame;
        _profile.frame = CGRectMake(20.0, 470.0, 75.0, 75.0);
        _wallet1.frame = CGRectMake(108.0, 480.0, 60.0, 60.0);
        _wallet2.frame = CGRectMake(176.0, 480.0, 60.0, 60.0);
        _wallet3.frame = CGRectMake(245.0, 480.0, 60.0, 60.0);
        [UIView commitAnimations];
        [sender setTitle:@"" forState:UIControlStateNormal];
        _bottomBar.layer.zPosition = 10;
        _profile.layer.zPosition = 10;
        _wallet1.layer.zPosition = 10;
        _wallet2.layer.zPosition = 10;
        _wallet3.layer.zPosition = 10;
        _leftTikkit.enabled = YES;
        _rightTikkit.enabled = YES;
        
    } else {
        CGRect frame = CGRectMake(0.0, 100.0, 320.0, 600.0);
        [UIView beginAnimations:@"ToggleViews" context:nil];
        [UIView setAnimationDuration:0.4];
        _bottomBar.frame = frame;
        _bottomBar.backgroundColor = [UIColor blackColor];
        _profile.frame = CGRectMake(20.0, 65.5, 75.0, 75.0);
        _wallet1.frame = CGRectMake(108.0, 65.5, 60.0, 60.0);
        _wallet2.frame = CGRectMake(176.0, 65.5, 60.0, 60.0);
        _wallet3.frame = CGRectMake(245.0, 65.5, 60.0, 60.0);
        [UIView commitAnimations];
        [sender setTitle:@" " forState:UIControlStateNormal];
        _bottomBar.layer.zPosition = 10;
        _profile.layer.zPosition = 10;
        _wallet1.layer.zPosition = 10;
        _wallet2.layer.zPosition = 10;
        _wallet3.layer.zPosition = 10;
        _leftTikkit.enabled = NO;
        _rightTikkit.enabled = NO;
    }
    
}

- (void)drawRandomLeftTikkit
{
    [[_leftTikkit subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
    savvyModel *tiks = [[savvyModel alloc] init];
    NSArray *brands = [tiks newTikkit];
    _leftTikkitDetail = [[NSArray alloc] init];
    _leftTikkitDetail = brands;
    while ([[_leftTikkitDetail objectAtIndex:0] isEqualToString:[_rightTikkitDetail objectAtIndex:0]]) {
        brands = [tiks newTikkit];
        _leftTikkitDetail = brands;
    }
    //int index = [[brands objectAtIndex:2] intValue];
    //_leftBack.image = [UIImage imageNamed:[brands objectAtIndex:0]];
    [_leftBack.layer setBorderWidth:2.0];
    [_leftBack.layer setBorderColor:[[UIColor blackColor] CGColor]];
    //_leftBack.image = [blurredImages objectAtIndex:index];
    UIImageView *brandimg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 130.0, 70.0)];
    brandimg.clipsToBounds = YES;
    brandimg.image = [UIImage imageNamed:[brands objectAtIndex:0]];
    brandimg.contentMode = UIViewContentModeScaleAspectFill;
    [_leftTikkit addSubview:brandimg];
    
    NSMutableString *back_name = [[NSMutableString alloc] init];
    [back_name appendString:[brands objectAtIndex:0]];
    [back_name appendString:@"_back"];
    UIImage *backimg = [UIImage imageNamed:back_name];
    UIImageView *back = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 160, 568)];
    back.contentMode = UIViewContentModeScaleAspectFill;
    back.image = backimg;
    [_leftBack addSubview:back];
    [UIView beginAnimations:@"background" context:nil];
    [UIView setAnimationDuration:25];
    //back.center = CGPointMake(-80, 284);
    [UIView commitAnimations];
    
    UIImageView *brandName = [[UIImageView alloc] initWithFrame:CGRectMake(0, 70, 130, 30)];
    NSMutableString *name = [[NSMutableString alloc] init];
    [name appendString:[brands objectAtIndex:0]];
    [name appendString:@"_logo"];
    brandName.image = [UIImage imageNamed:name];
    brandName.clipsToBounds = YES;
    brandName.contentMode = UIViewContentModeScaleAspectFit;
    [_leftTikkit addSubview:brandName];
    
    UIImageView *brandName_wallet = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    NSMutableString *name_wallet = [[NSMutableString alloc] init];
    [name_wallet appendString:[brands objectAtIndex:0]];
    [name_wallet appendString:@"_logo"];
    brandName_wallet.image = [UIImage imageNamed:name];
    brandName_wallet.clipsToBounds = YES;
    brandName_wallet.contentMode = UIViewContentModeScaleAspectFit;
    _left_img = brandName_wallet;
    
    UILabel *product = [[UILabel alloc] initWithFrame:CGRectMake(0, 113, 130, 12)];
    product.text = [brands objectAtIndex:3];
    product.textAlignment = NSTextAlignmentCenter;
    product.font = [UIFont fontWithName:@"TFArrow-Light" size:15];
    [_leftTikkit addSubview:product];
    
    UILabel *discount = [[UILabel alloc] initWithFrame:CGRectMake(0, 99, 130.0, 12.0)];
    discount.text = [brands objectAtIndex:1];
    discount.textAlignment = NSTextAlignmentCenter;
    discount.font = [UIFont fontWithName:@"TFArrow-Light" size:15];
    [_leftTikkit addSubview:discount];
    
    _leftTikkit.center = CGPointMake(80, 1000);
    _leftTikkit.layer.zPosition = 0;
    [UIView beginAnimations:@"background" context:nil];
    [UIView setAnimationDuration:0.5];
    _leftTikkit.center = CGPointMake(80, 240);
    [UIView commitAnimations];
}

- (void)drawRandomRightTikkit
{
    [[_rightTikkit subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
    savvyModel *tiks = [[savvyModel alloc] init];
    NSArray *brands = [tiks newTikkit];
    _rightTikkitDetail = [[NSArray alloc] init];
    _rightTikkitDetail = brands;
    while ([[_rightTikkitDetail objectAtIndex:0] isEqualToString:[_leftTikkitDetail objectAtIndex:0]]) {
        brands = [tiks newTikkit];
        _rightTikkitDetail = brands;
    }
    //NSLog([_leftTikkitDetail objectAtIndex:0]);
    //int index = [[brands objectAtIndex:2] intValue];
    //_rightBack.image = [UIImage imageNamed:[brands objectAtIndex:0]];
    [_rightBack.layer setBorderWidth:2.0];
    [_rightBack.layer setBorderColor:[[UIColor blackColor] CGColor]];
    UIImageView *brandimg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 130.0, 70.0)];
    brandimg.clipsToBounds = YES;
    brandimg.image = [UIImage imageNamed:[brands objectAtIndex:0]];
    brandimg.contentMode = UIViewContentModeScaleAspectFill;
    [_rightTikkit addSubview:brandimg];

    
    NSMutableString *back_name = [[NSMutableString alloc] init];
    [back_name appendString:[brands objectAtIndex:0]];
    [back_name appendString:@"_back"];
    UIImage *backimg = [UIImage imageNamed:back_name];
    UIImageView *back = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 160, 568)];
    back.contentMode = UIViewContentModeScaleAspectFill;
    back.image = backimg;
    [_rightBack addSubview:back];
    [UIView beginAnimations:@"background" context:nil];
    [UIView setAnimationDuration:25];
    //back.center = CGPointMake(240, 284);
    [UIView commitAnimations];

    UIImageView *brandName = [[UIImageView alloc] initWithFrame:CGRectMake(0, 70, 130, 30)];
    NSMutableString *name = [[NSMutableString alloc] init];
    [name appendString:[brands objectAtIndex:0]];
    [name appendString:@"_logo"];
    brandName.image = [UIImage imageNamed:name];
    brandName.clipsToBounds = YES;
    brandName.contentMode = UIViewContentModeScaleAspectFit;
    [_rightTikkit addSubview:brandName];
    
    UIImageView *brandName_wallet = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    NSMutableString *name_wallet = [[NSMutableString alloc] init];
    [name_wallet appendString:[brands objectAtIndex:0]];
    [name_wallet appendString:@"_logo"];
    brandName_wallet.image = [UIImage imageNamed:name];
    brandName_wallet.clipsToBounds = YES;
    brandName_wallet.contentMode = UIViewContentModeScaleAspectFit;
    _right_img = brandName_wallet;
    
    UILabel *product = [[UILabel alloc] initWithFrame:CGRectMake(0, 113, 130, 12)];
    product.text = [brands objectAtIndex:3];
    product.textAlignment = NSTextAlignmentCenter;
    product.font = [UIFont fontWithName:@"TFArrow-Light" size:15];
    [_rightTikkit addSubview:product];
    
    UILabel *discount = [[UILabel alloc] initWithFrame:CGRectMake(0, 99, 130.0, 12.0)];
    discount.text = [brands objectAtIndex:1];
    discount.textAlignment = NSTextAlignmentCenter;
    discount.font = [UIFont fontWithName:@"TFArrow-Light" size:15];
    [_rightTikkit addSubview:discount];
    
    _rightTikkit.center = CGPointMake(240, 1000);
    _rightTikkit.layer.zPosition = 0;
    [UIView beginAnimations:@"background" context:nil];
    [UIView setAnimationDuration:0.5];
    _rightTikkit.center = CGPointMake(240, 240);
    [UIView commitAnimations];
}

- (void)wasDraggedLeft:(UIButton *)leftTikkit withEvent:(UIEvent *) event
{
    UITouch *touch = [[event touchesForView:leftTikkit] anyObject];
    CGPoint previousLocation = [touch previousLocationInView:leftTikkit];
    CGPoint location = [touch locationInView:leftTikkit];
    CGFloat delta_x = location.x - previousLocation.x;
    CGFloat delta_y = location.y - previousLocation.y;
    leftTikkit.center = CGPointMake(leftTikkit.center.x + delta_x, leftTikkit.center.y + delta_y);
    _leftTikkit.layer.zPosition = 2;
    _rightTikkit.layer.zPosition = 0;
    _bottomBar.layer.zPosition = 0;
    _profile.layer.zPosition = 0;
    _wallet1.layer.zPosition = 0;
    _wallet2.layer.zPosition = 0;
    _wallet3.layer.zPosition = 0;
    if (leftTikkit.center.y < 50) {
        [_leftTikkit setTitle:@" " forState:UIControlStateNormal];
        [self drawRandomLeftTikkit];
    }
}

- (void)wasDraggedRight:(UIButton *)rightTikkit withEvent:(UIEvent *) event
{
    UITouch *touch = [[event touchesForView:rightTikkit] anyObject];
    CGPoint previousLocation = [touch previousLocationInView:rightTikkit];
    CGPoint location = [touch locationInView:rightTikkit];
    CGFloat delta_x = location.x - previousLocation.x;
    CGFloat delta_y = location.y - previousLocation.y;
    rightTikkit.center = CGPointMake(rightTikkit.center.x + delta_x, rightTikkit.center.y + delta_y);
    _leftTikkit.layer.zPosition = 0;
    _rightTikkit.layer.zPosition = 2;
    _bottomBar.layer.zPosition = 0;
    _profile.layer.zPosition = 0;
    _wallet1.layer.zPosition = 0;
    _wallet2.layer.zPosition = 0;
    _wallet3.layer.zPosition = 0;
    if (_rightTikkit.center.y < 50) {
        [_rightTikkit setTitle:@" " forState:UIControlStateNormal];
        [self drawRandomRightTikkit];
    }
}

- (void)touchesEndedLeft:(UIButton *)leftTikkit withEvent:(UIEvent *)event
{
    if (CGPointEqualToPoint(_leftTikkit.center, CGPointMake(80, 240)) && ![_leftTikkit.currentTitle length]) {
        [UIView beginAnimations:@"ToggleView" context:nil];
        [UIView setAnimationDuration:0.3];
        _leftTikkit.frame = CGRectMake(45, 40, 230, 400);
        [UIView commitAnimations];
        leftTikkit.layer.zPosition = 2;
        _rightTikkit.layer.zPosition = 0;
        _wallet1.layer.zPosition = 1;
        _wallet2.layer.zPosition = 1;
        _wallet3.layer.zPosition = 1;
        _downSwipeLeft.enabled = NO;
        _upSwipeLeft.enabled = NO;
        _rightTikkit.enabled = NO;
        
        [self showDetailLeft];
    } else if (CGPointEqualToPoint(leftTikkit.center, CGPointMake(160.0, 240.0))) {
        [UIView beginAnimations:@"ToggleView" context:nil];
        [UIView setAnimationDuration:0.3];
        leftTikkit.frame = CGRectMake(15, 175, 130, 130);
        [UIView commitAnimations];
        [self performSelector:@selector(returnLeftTikkit) withObject:nil afterDelay:0];
        leftTikkit.layer.zPosition = 0;
        _wallet1.layer.zPosition = 10;
        _wallet2.layer.zPosition = 10;
        _wallet3.layer.zPosition = 10;
        _downSwipeLeft.enabled = YES;
        _upSwipeLeft.enabled = YES;
        _rightTikkit.enabled = YES;
    } else if (leftTikkit.frame.size.height == 400){
        [UIView beginAnimations:@"ToggleView" context:nil];
        [UIView setAnimationDuration:0.3];
        leftTikkit.center = CGPointMake(160.0, 240.0);
        [UIView commitAnimations];
        _bottomBar.layer.zPosition = 1;
        _profile.layer.zPosition = 1;
        [_leftTikkit setTitle:@"" forState:UIControlStateNormal];
        _wallet1.layer.zPosition = 1;
        _wallet2.layer.zPosition = 1;
        _wallet3.layer.zPosition = 1;

    } else {
        [UIView beginAnimations:@"ToggleView" context:nil];
        [UIView setAnimationDuration:0.3];
        leftTikkit.center = CGPointMake(80.0, 240.0);
        [UIView commitAnimations];
        _bottomBar.layer.zPosition = 1;
        _profile.layer.zPosition = 1;
        _wallet1.layer.zPosition = 1;
        _wallet2.layer.zPosition = 1;
        _wallet3.layer.zPosition = 1;
        [_leftTikkit setTitle:@"" forState:UIControlStateNormal];
    }
}

- (void)touchesEndedRight:(UIButton *)rightTikkit withEvent:(UIEvent *)event
{

    if (CGPointEqualToPoint(_rightTikkit.center, CGPointMake(240, 240)) && ![_rightTikkit.currentTitle length]) {
        [UIView beginAnimations:@"ToggleView" context:nil];
        [UIView setAnimationDuration:0.3];
        _rightTikkit.frame = CGRectMake(45, 40, 230, 400);
        [UIView commitAnimations];
        rightTikkit.layer.zPosition = 2;
        _leftTikkit.layer.zPosition = 0;
        [self showDetailRight];
        _wallet1.layer.zPosition = 1;
        _wallet2.layer.zPosition = 1;
        _wallet3.layer.zPosition = 1;
        _downSwipeRight.enabled = NO;
        _upSwipeRight.enabled = NO;
        _leftTikkit.enabled = NO;

    } else if (CGPointEqualToPoint(rightTikkit.center, CGPointMake(160.0, 240.0))) {
        [UIView beginAnimations:@"ToggleView" context:nil];
        [UIView setAnimationDuration:0.3];
        rightTikkit.frame = CGRectMake(175, 175, 130, 130);
        [UIView commitAnimations];
        [self performSelector:@selector(returnRightTikkit) withObject:nil afterDelay:0];
        rightTikkit.layer.zPosition = 1;
        _leftTikkit.layer.zPosition = 0;
        _wallet1.layer.zPosition = 10;
        _wallet2.layer.zPosition = 10;
        _wallet3.layer.zPosition = 10;
        _downSwipeRight.enabled = YES;
        _upSwipeRight.enabled = YES;
        _leftTikkit.enabled = YES;
    } else if (rightTikkit.frame.size.height == 400){
        [UIView beginAnimations:@"ToggleView" context:nil];
        [UIView setAnimationDuration:0.3];
        rightTikkit.center = CGPointMake(160.0, 240.0);
        [UIView commitAnimations];
        [_rightTikkit setTitle:@"" forState:UIControlStateNormal];
        _wallet1.layer.zPosition = 1;
        _wallet2.layer.zPosition = 1;
        _wallet3.layer.zPosition = 1;
    } else {
        [UIView beginAnimations:@"ToggleView" context:nil];
        [UIView setAnimationDuration:0.3];
        rightTikkit.center = CGPointMake(240.0, 240.0);
        [UIView commitAnimations];
        [_rightTikkit setTitle:@"" forState:UIControlStateNormal];
        _wallet1.layer.zPosition = 1;
        _wallet2.layer.zPosition = 1;
        _wallet3.layer.zPosition = 1;
    }
    _bottomBar.layer.zPosition = 1;
    _profile.layer.zPosition = 1;
}

- (void)showDetailRight
{
    [[_rightTikkit subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
    UIImageView *brandimg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 230, 140)];
    brandimg.image = [UIImage imageNamed:[_rightTikkitDetail objectAtIndex:0]];
    [_rightTikkit addSubview:brandimg];
    
    
    UIImageView *brandName = [[UIImageView alloc] initWithFrame:CGRectMake(0, 140, 230, 45)];
    NSMutableString *name = [[NSMutableString alloc] init];
    [name appendString:[_rightTikkitDetail objectAtIndex:0]];
    [name appendString:@"_logo"];
    brandName.image = [UIImage imageNamed:name];
    brandName.contentMode = UIViewContentModeScaleAspectFit;
    [_rightTikkit addSubview:brandName];
    
    UILabel *discount = [[UILabel alloc] initWithFrame:CGRectMake(0, 170, 230.0, 53.0)];
    discount.text = [_rightTikkitDetail objectAtIndex:1];
    discount.textAlignment = NSTextAlignmentCenter;
    discount.font = [UIFont fontWithName:@"TFArrow-Light" size:35];
    [_rightTikkit addSubview:discount];
    
    UILabel *product = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, 230, 53)];
    product.text = [_leftTikkitDetail objectAtIndex:3];
    product.textAlignment = NSTextAlignmentCenter;
    product.font = [UIFont fontWithName:@"TFArrow-Light" size:35];
    [_rightTikkit addSubview:product];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Add To Wallet" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"TFArrow-Light" size:20];
    button.layer.cornerRadius = 5;
    button.frame = CGRectMake(40.0, 300.0, 160.0, 40.0);
    [button setBackgroundColor:[UIColor blackColor]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self
               action:@selector(didAcceptRight:)
     forControlEvents:UIControlEventTouchUpInside];
    [_rightTikkit addSubview:button];
    
    
    
 }

- (void) returnRightTikkit
{
    [[_rightTikkit subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
    UIImageView *brandimg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 230.0, 124.0)];
    brandimg.clipsToBounds = YES;
    brandimg.image = [UIImage imageNamed:[_rightTikkitDetail objectAtIndex:0]];
    brandimg.contentMode = UIViewContentModeScaleAspectFill;
    [_rightTikkit addSubview:brandimg];
    
    UIImageView *brandName = [[UIImageView alloc] initWithFrame:CGRectMake(0, 140, 230, 53)];
    NSMutableString *name = [[NSMutableString alloc] init];
    [name appendString:[_rightTikkitDetail objectAtIndex:0]];
    [name appendString:@"_logo"];
    brandName.image = [UIImage imageNamed:name];
    brandName.clipsToBounds = YES;
    brandName.contentMode = UIViewContentModeScaleAspectFit;
    [_rightTikkit addSubview:brandName];

    /*UILabel *discount = [[UILabel alloc] initWithFrame:CGRectMake(65, 185, 130.0, 53.0)];
    discount.text = [_rightTikkitDetail objectAtIndex:1];
    //discount.textAlignment = NSTextAlignmentCenter;
    discount.font = [UIFont fontWithName:@"TFArrow-Light" size:20];
    [_rightTikkit addSubview:discount];*/
    
    UILabel *product = [[UILabel alloc] initWithFrame:CGRectMake(0, 113, 130, 12)];
    product.text = [_rightTikkitDetail objectAtIndex:3];
    product.textAlignment = NSTextAlignmentCenter;
    product.font = [UIFont fontWithName:@"TFArrow-Light" size:15];
    [_rightTikkit addSubview:product];
    
    UILabel *discount = [[UILabel alloc] initWithFrame:CGRectMake(0, 99, 130.0, 12.0)];
    discount.text = [_rightTikkitDetail objectAtIndex:1];
    discount.textAlignment = NSTextAlignmentCenter;
    discount.font = [UIFont fontWithName:@"TFArrow-Light" size:15];
    [_rightTikkit addSubview:discount];
    
    [UIView beginAnimations:@"ToggleView" context:nil];
    [UIView setAnimationDuration:0.3];
    brandimg.frame = CGRectMake(0, 0, 130, 70);
    brandName.frame = CGRectMake(0, 70, 130, 30);
    discount.frame = CGRectMake(0, 99, 130.0, 12.0);
    product.frame = CGRectMake(0, 113, 130, 12);
    [UIView commitAnimations];
}

- (void)showDetailLeft
{
    [[_leftTikkit subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
    UIImageView *brandimg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 230, 140)];
    brandimg.image = [UIImage imageNamed:[_leftTikkitDetail objectAtIndex:0]];
    [_leftTikkit addSubview:brandimg];
    
    
    UIImageView *brandName = [[UIImageView alloc] initWithFrame:CGRectMake(0, 140, 230, 45)];
    NSMutableString *name = [[NSMutableString alloc] init];
    [name appendString:[_leftTikkitDetail objectAtIndex:0]];
    [name appendString:@"_logo"];
    brandName.image = [UIImage imageNamed:name];
    brandName.contentMode = UIViewContentModeScaleAspectFit;
    [_leftTikkit addSubview:brandName];
    
    UILabel *product = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, 230, 53.0)];
    product.text = [_leftTikkitDetail objectAtIndex:3];
    product.textAlignment = NSTextAlignmentCenter;
    product.font = [UIFont fontWithName:@"TFArrow-Light" size:30];
    [_leftTikkit addSubview:product];
    
    UILabel *discount = [[UILabel alloc] initWithFrame:CGRectMake(0, 170, 230.0, 53.0)];
    discount.text = [_leftTikkitDetail objectAtIndex:1];
    discount.textAlignment = NSTextAlignmentCenter;
    discount.font = [UIFont fontWithName:@"TFArrow-Light" size:35];
    [_leftTikkit addSubview:discount];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Add To Wallet" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"TFArrow-Light" size:20];
    button.layer.cornerRadius = 5;
    button.frame = CGRectMake(40.0, 300.0, 160.0, 40.0);
    [button setBackgroundColor:[UIColor blackColor]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self
               action:@selector(didAcceptLeft:)
     forControlEvents:UIControlEventTouchUpInside];
    [_leftTikkit addSubview:button];
}

- (void)walletLeftDetail: (UIButton *)b {
    UIImageView *brandimg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 230, 140)];
    brandimg.image = [UIImage imageNamed:[_leftTikkitDetail objectAtIndex:0]];
    [b addSubview:brandimg];
    
    
    UIImageView *brandName = [[UIImageView alloc] initWithFrame:CGRectMake(0, 140, 230, 45)];
    NSMutableString *name = [[NSMutableString alloc] init];
    [name appendString:[_leftTikkitDetail objectAtIndex:0]];
    [name appendString:@"_logo"];
    brandName.image = [UIImage imageNamed:name];
    brandName.contentMode = UIViewContentModeScaleAspectFit;
    [b addSubview:brandName];
    
    UILabel *discount = [[UILabel alloc] initWithFrame:CGRectMake(0, 175, 230.0, 53.0)];
    discount.text = [_leftTikkitDetail objectAtIndex:1];
    discount.textAlignment = NSTextAlignmentCenter;
    discount.font = [UIFont fontWithName:@"TFArrow-Light" size:35];
    [b addSubview:discount];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Redeem" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"TFArrow-Light" size:20];
    button.layer.cornerRadius = 5;
    button.frame = CGRectMake(40.0, 300.0, 160.0, 40.0);
    [button setBackgroundColor:[UIColor blackColor]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [b addSubview:button];
}

- (void)walletRightDetail: (UIButton *)b {
    UIImageView *brandimg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 230, 140)];
    brandimg.image = [UIImage imageNamed:[_rightTikkitDetail objectAtIndex:0]];
    [b addSubview:brandimg];
    
    
    UIImageView *brandName = [[UIImageView alloc] initWithFrame:CGRectMake(0, 140, 230, 45)];
    NSMutableString *name = [[NSMutableString alloc] init];
    [name appendString:[_rightTikkitDetail objectAtIndex:0]];
    [name appendString:@"_logo"];
    brandName.image = [UIImage imageNamed:name];
    brandName.contentMode = UIViewContentModeScaleAspectFit;
    [b addSubview:brandName];
    
    UILabel *discount = [[UILabel alloc] initWithFrame:CGRectMake(0, 175, 230.0, 53.0)];
    discount.text = [_rightTikkitDetail objectAtIndex:1];
    discount.textAlignment = NSTextAlignmentCenter;
    discount.font = [UIFont fontWithName:@"TFArrow-Light" size:35];
    [b addSubview:discount];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Redeem" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"TFArrow-Light" size:20];
    button.layer.cornerRadius = 5;
    button.frame = CGRectMake(40.0, 300.0, 160.0, 40.0);
    [button setBackgroundColor:[UIColor blackColor]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [b addSubview:button];
}

- (void) returnLeftTikkit
{
    [[_leftTikkit subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
    UIImageView *brandimg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 230.0, 124.0)];
    brandimg.clipsToBounds = YES;
    brandimg.image = [UIImage imageNamed:[_leftTikkitDetail objectAtIndex:0]];
    brandimg.contentMode = UIViewContentModeScaleAspectFill;
    [_leftTikkit addSubview:brandimg];
    
    UIImageView *brandName = [[UIImageView alloc] initWithFrame:CGRectMake(0, 140, 230, 53)];
    NSMutableString *name = [[NSMutableString alloc] init];
    [name appendString:[_leftTikkitDetail objectAtIndex:0]];
    [name appendString:@"_logo"];
    brandName.image = [UIImage imageNamed:name];
    brandName.clipsToBounds = YES;
    brandName.contentMode = UIViewContentModeScaleAspectFit;
    [_leftTikkit addSubview:brandName];
    
    UILabel *product = [[UILabel alloc] initWithFrame:CGRectMake(0, 113, 130, 12)];
    product.text = [_leftTikkitDetail objectAtIndex:3];
    product.textAlignment = NSTextAlignmentCenter;
    product.font = [UIFont fontWithName:@"TFArrow-Light" size:15];
    [_leftTikkit addSubview:product];
    
    UILabel *discount = [[UILabel alloc] initWithFrame:CGRectMake(0, 99, 130.0, 12.0)];
    discount.text = [_leftTikkitDetail objectAtIndex:1];
    discount.textAlignment = NSTextAlignmentCenter;
    discount.font = [UIFont fontWithName:@"TFArrow-Light" size:15];
    [_leftTikkit addSubview:discount];
    
    [UIView beginAnimations:@"ToggleView" context:nil];
    [UIView setAnimationDuration:0.3];
    brandimg.frame = CGRectMake(0, 0, 130, 70);
    brandName.frame = CGRectMake(0, 70, 130, 30);
    discount.frame = CGRectMake(0, 99, 130.0, 12.0);
    product.frame = CGRectMake(0, 113, 130, 12);
    [UIView commitAnimations];
}

- (IBAction)wal1:(UIButton *)sender {
    
    if (_inWallet1 == 1) {
        if (_open_wallet1 == 0) {
            _back.frame = CGRectMake(0, 0, 380, 568);
            _back2.frame = CGRectMake(0, 0, 380, 568);
            _back3.frame = CGRectMake(0, 0, 380, 568);
            _back4.frame = CGRectMake(0, 0, 380, 568);
            _wallet1Click.frame = CGRectMake(55, 500, 230, 400);
            [_wallet1Click.layer setBorderWidth:0.5];
            [_wallet1Click.layer setBorderColor:[[UIColor blackColor] CGColor]];
            _wallet1Click.layer.cornerRadius = 10;
            [UIView beginAnimations:@"ToggleView" context:nil];
            [UIView setAnimationDuration:0.3];
            _back.layer.opacity = 0.7;
            _back2.layer.opacity = 0.7;
            _back3.layer.opacity = 0.7;
            _back4.layer.opacity = 0.7;
            _wallet1Click.center = CGPointMake(170, 250);
            [UIView commitAnimations];
            _wallet1Click.layer.zPosition = 10;
            _wallet1Click.backgroundColor = [UIColor whiteColor];
            [self.view addSubview:_wallet1Click];
            [_leftBack addSubview:_back];
            [_rightBack addSubview:_back2];
            [_leftTikkit addSubview:_back3];
            [_rightTikkit addSubview:_back4];
            _open_wallet1 = 1;
        } else {
            if (_wallet1Click.center.y != 250) {
                _wallet1Click.frame = CGRectMake(55, 500, 230, 400);
                [_wallet1Click.layer setBorderWidth:0.5];
                [_wallet1Click.layer setBorderColor:[[UIColor blackColor] CGColor]];
                _wallet1Click.layer.cornerRadius = 10;
                [UIView beginAnimations:@"ToggleView" context:nil];
                [UIView setAnimationDuration:0.3];
                _wallet2Click.frame = CGRectMake(55, 600, 230, 400);
                _wallet1Click.center = CGPointMake(170, 250);
                _wallet3Click.frame = CGRectMake(55, 600, 230, 400);
                [UIView commitAnimations];
                _wallet1Click.layer.zPosition = 10;
                _wallet1Click.backgroundColor = [UIColor whiteColor];
            } else {
                [UIView beginAnimations:@"ToggleView" context:nil];
                [UIView setAnimationDuration:0.3];
                _back.layer.opacity = 0;
                _back2.layer.opacity = 0;
                _back3.layer.opacity = 0;
                _back4.layer.opacity = 0;
                _wallet1Click.frame = CGRectMake(55, 600, 230, 400);
                [UIView commitAnimations];
                _open_wallet1 = 0;
            }
        }
    }
}

- (IBAction)wal2:(UIButton *)sender {
    if (_inWallet2 == 1) {
        if (_open_wallet1 == 0) {
            _back.frame = CGRectMake(0, 0, 380, 568);
            _back2.frame = CGRectMake(0, 0, 380, 568);
            _back3.frame = CGRectMake(0, 0, 380, 568);
            _back4.frame = CGRectMake(0, 0, 380, 568);
            _wallet2Click.frame = CGRectMake(55, 500, 230, 400);
            [_wallet2Click.layer setBorderWidth:0.5];
            [_wallet2Click.layer setBorderColor:[[UIColor blackColor] CGColor]];
            _wallet2Click.layer.cornerRadius = 10;
            [UIView beginAnimations:@"ToggleView" context:nil];
            [UIView setAnimationDuration:0.3];
            _back.layer.opacity = 0.7;
            _back2.layer.opacity = 0.7;
            _back3.layer.opacity = 0.7;
            _back4.layer.opacity = 0.7;
            _wallet2Click.center = CGPointMake(170, 250);
            [UIView commitAnimations];
            _wallet2Click.layer.zPosition = 10;
            _wallet2Click.backgroundColor = [UIColor whiteColor];
            [self.view addSubview:_wallet2Click];
            [_leftBack addSubview:_back];
            [_rightBack addSubview:_back2];
            [_leftTikkit addSubview:_back3];
            [_rightTikkit addSubview:_back4];
            _open_wallet1 = 1;
        } else {
            if (_wallet2Click.center.y != 250) {
                _wallet2Click.frame = CGRectMake(55, 500, 230, 400);
                [_wallet2Click.layer setBorderWidth:0.5];
                [_wallet2Click.layer setBorderColor:[[UIColor blackColor] CGColor]];
                _wallet2Click.layer.cornerRadius = 10;
                [UIView beginAnimations:@"ToggleView" context:nil];
                [UIView setAnimationDuration:0.3];
                _wallet2Click.center = CGPointMake(170, 250);
                _wallet1Click.frame = CGRectMake(55, 600, 230, 400);
                _wallet3Click.frame = CGRectMake(55, 600, 230, 400);
                [UIView commitAnimations];
                _wallet2Click.layer.zPosition = 10;
                _wallet2Click.backgroundColor = [UIColor whiteColor];
            } else {
                [UIView beginAnimations:@"ToggleView" context:nil];
                [UIView setAnimationDuration:0.3];
                _back.layer.opacity = 0;
                _back2.layer.opacity = 0;
                _back3.layer.opacity = 0;
                _back4.layer.opacity = 0;
                _wallet2Click.frame = CGRectMake(55, 600, 230, 400);
                [UIView commitAnimations];
                _open_wallet1 = 0;
            }
        }
    }
}
- (IBAction)wal3:(UIButton *)sender {
    if (_inWallet3 == 1) {
        if (_open_wallet1 == 0) {
            _back.frame = CGRectMake(0, 0, 380, 568);
            _back2.frame = CGRectMake(0, 0, 380, 568);
            _back3.frame = CGRectMake(0, 0, 380, 568);
            _back4.frame = CGRectMake(0, 0, 380, 568);
            _wallet3Click.frame = CGRectMake(55, 500, 230, 400);
            [_wallet3Click.layer setBorderWidth:0.5];
            [_wallet3Click.layer setBorderColor:[[UIColor blackColor] CGColor]];
            _wallet3Click.layer.cornerRadius = 10;
            [UIView beginAnimations:@"ToggleView" context:nil];
            [UIView setAnimationDuration:0.3];
            _back.layer.opacity = 0.7;
            _back2.layer.opacity = 0.7;
            _back3.layer.opacity = 0.7;
            _back4.layer.opacity = 0.7;
            _wallet3Click.center = CGPointMake(170, 250);
            [UIView commitAnimations];
            _wallet3Click.layer.zPosition = 10;
            _wallet3Click.backgroundColor = [UIColor whiteColor];
            [self.view addSubview:_wallet3Click];
            [_leftBack addSubview:_back];
            [_rightBack addSubview:_back2];
            [_leftTikkit addSubview:_back3];
            [_rightTikkit addSubview:_back4];
            _open_wallet1 = 1;
        } else {
            if (_wallet3Click.center.y != 250) {
                _wallet3Click.frame = CGRectMake(55, 500, 230, 400);
                [_wallet3Click.layer setBorderWidth:0.5];
                [_wallet3Click.layer setBorderColor:[[UIColor blackColor] CGColor]];
                _wallet3Click.layer.cornerRadius = 10;
                [UIView beginAnimations:@"ToggleView" context:nil];
                [UIView setAnimationDuration:0.3];
                _wallet3Click.frame = CGRectMake(55, 600, 230, 400);
                _wallet3Click.center = CGPointMake(170, 250);
                _wallet1Click.frame = CGRectMake(55, 600, 230, 400);
                _wallet2Click.frame = CGRectMake(55, 600, 230, 400);
                [UIView commitAnimations];
                _wallet3Click.layer.zPosition = 10;
                _wallet3Click.backgroundColor = [UIColor whiteColor];
            } else {
                [UIView beginAnimations:@"ToggleView" context:nil];
                [UIView setAnimationDuration:0.3];
                _back.layer.opacity = 0;
                _back2.layer.opacity = 0;
                _back3.layer.opacity = 0;
                _back4.layer.opacity = 0;
                _wallet3Click.frame = CGRectMake(55, 600, 230, 400);
                [UIView commitAnimations];
                _open_wallet1 = 0;
            }
        }
    }
}

/*- (void)drawRandomRightTikkit
{
    savvyModel *tiks = [[savvyModel alloc] init];
    NSArray *random_tik = [tiks newTikkit];
    NSLog(@"%@, %@", [random_tik objectAtIndex:0], [random_tik objectAtIndex:1]);
    
    NSString *brand = [random_tik objectAtIndex:0];
    NSString *discount = [random_tik objectAtIndex:1];
    UIImage *viewimage = [UIImage imageNamed:brand];
    
    //Blur the UIImage
    CIImage *imageToBlur = [CIImage imageWithCGImage:viewimage.CGImage];
    CIFilter *gaussianBlurFilter = [CIFilter filterWithName: @"CIGaussianBlur"];
    [gaussianBlurFilter setValue:imageToBlur forKey: @"inputImage"];
    [gaussianBlurFilter setValue:[NSNumber numberWithFloat: 5] forKey: @"inputRadius"]; //change number to increase/decrease blur
    CIImage *resultImage = [gaussianBlurFilter valueForKey: @"outputImage"];
    
    UIImage *newImage = [[UIImage alloc] initWithCIImage:resultImage];
    
    CGSize targetsize = CGSizeMake(viewimage.size.width, viewimage.size.height);
    UIGraphicsBeginImageContext(targetsize);
    
    CGRect rect = CGRectMake(0, 0, 0, 0);
    rect.origin = CGPointMake(-50, -10);
    rect.size.width = viewimage.size.width*1.2;
    rect.size.height = viewimage.size.height*1.2;
    
    [newImage drawInRect:rect];
    
    UIImage *tempimg = nil;
    tempimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    _rightBack.image = tempimg;
    [_rightBack.layer setBorderWidth:2.0];
    [_rightBack.layer setBorderColor:[[UIColor blackColor] CGColor]];
}*/

/*- (void)blurAllImages
 {
 savvyModel *tiks = [[savvyModel alloc] init];
 NSArray *brands = [tiks returnBrands];
 for (int br = 0; br < brands.count; br++) {
 UIImage *viewimage = [UIImage imageNamed:[brands objectAtIndex:br]];
 
 //Blur the UIImage
 CIImage *imageToBlur = [CIImage imageWithCGImage:viewimage.CGImage];
 CIFilter *gaussianBlurFilter = [CIFilter filterWithName: @"CIGaussianBlur"];
 [gaussianBlurFilter setValue:imageToBlur forKey: @"inputImage"];
 [gaussianBlurFilter setValue:[NSNumber numberWithFloat: 5] forKey: @"inputRadius"]; //change number to increase/decrease blur
 CIImage *resultImage = [gaussianBlurFilter valueForKey: @"outputImage"];
 
 UIImage *newImage = [[UIImage alloc] initWithCIImage:resultImage];
 
 [blurredImages addObject:newImage];
 NSLog(@"this is %@",[blurredImages objectAtIndex:br]);
 }
 
 }*/


@end
