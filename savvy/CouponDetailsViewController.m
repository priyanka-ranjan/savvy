

#import "CouponDetailsViewController.h"

#import "CouponModel.h"
#import "SwipeService.h"

#import "UIImageEffects.h"

@interface CouponDetailsViewController () <SwipeServiceProtocol>

@property (weak, nonatomic) IBOutlet UIImageView *couponImageView;
@property (weak, nonatomic) IBOutlet UILabel *couponStoreName;
@property (weak, nonatomic) IBOutlet UILabel *couponDiscountAmount;
@property (weak, nonatomic) IBOutlet UIButton *bottomButton;

@property (weak, nonatomic) IBOutlet UIView *redeemView;
@property (weak, nonatomic) IBOutlet UIView *finalView;

@property (weak, nonatomic) IBOutlet UIImageView *finalViewBackgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *userCouponCodeLabel;

@property (weak, nonatomic) IBOutlet UILabel *clientCouponCodeLabel;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@property (weak, nonatomic) IBOutlet UIImageView *storeLogoImageView;
@property (weak, nonatomic) IBOutlet UIImageView *finalViewStoreLogoImageView;

@property (nonatomic, strong) CouponModel *couponModel;
@property (nonatomic, strong) SwipeService *swipeService;

@end

@implementation CouponDetailsViewController


#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTapGestureRecognizer];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setupView];
    [self setupSwipeService];
    [self setupFinalAndRedeemView];
}

#pragma mark - Setup

-(void)setupFinalAndRedeemView {
    [self.finalView.layer setCornerRadius:25.0];
    [self.finalView.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.finalView.layer setBorderWidth:1.5];
    [self.finalView.layer setMasksToBounds:YES];
    self.finalView.hidden = YES;
    
    [self.redeemView.layer setCornerRadius:25.0];
    [self.redeemView.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.redeemView.layer setBorderWidth:1.5];
    [self.redeemView.layer setMasksToBounds:YES];
}


- (void)setupSwipeService {
    self.swipeService = [[SwipeService alloc] init];
    self.swipeService.delegate = self;
}

- (void)setupView {
    [self.couponImageView setImage:[UIImageEffects imageByApplyingLightEffectToImage:[UIImage imageNamed:self.couponModel.storeName]]];
    
    self.finalViewStoreLogoImageView.image =
    self.storeLogoImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_logo",self.couponModel.storeName]];
    
    self.couponDiscountAmount.text = self.couponModel.storeDiscount;
    self.couponDiscountAmount.font = [UIFont fontWithName:@"TFArrow-Light" size:30];
    
    [self.bottomButton setTitle:@"Redeem" forState:UIControlStateNormal];
    
    [self.finalViewBackgroundImageView setImage:[UIImage imageNamed:self.couponModel.storeName]];
    self.userCouponCodeLabel.text = self.couponModel.storeName;
    self.clientCouponCodeLabel.text = @"XXX-300";
    self.clientCouponCodeLabel.font =
    self.userCouponCodeLabel.font = [UIFont fontWithName:@"TFArrow-Light" size:20];
    
    [self.doneButton setTitle:@"Done" forState:UIControlStateNormal];
}

- (void)setupViewWithCouponModel:(CouponModel *)couponModel {
    self.couponModel = couponModel;
}


#pragma mark - <SwipeServiceProtocol>

- (void)serviceRecievedNewCoupon:(CouponModel *)coupon {
    
}

-(void)serviceRecievedFailedNetworkRequest {
    
}


#pragma mark - IBACtions

- (IBAction)redeemButtonTapped:(id)sender {
        [UIView transitionFromView:self.redeemView
                        toView:self.finalView
                      duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromRight | UIViewAnimationOptionShowHideTransitionViews
                    completion:^(BOOL finished) {
                        [self.view layoutIfNeeded];
                    }];
}

- (IBAction)doneButtonTapped:(id)sender {
    //send a post call
    [UIView transitionFromView:self.finalView
                        toView:self.redeemView
                      duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromLeft | UIViewAnimationOptionShowHideTransitionViews
                    completion:^(BOOL finished) {
                        [self.view layoutIfNeeded];
                    }];
}

#pragma mark - UITapGestureRecognizer

- (void)addTapGestureRecognizer {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognized:)];
    [self.view addGestureRecognizer:tap];
}

- (void)tapGestureRecognized:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//Transition Back
//[UIView transitionFromView:self.finalView
//                    toView:self.redeemView
//                  duration:0.5
//                   options:UIViewAnimationOptionTransitionFlipFromLeft | UIViewAnimationOptionShowHideTransitionViews
//                completion:^(BOOL finished) {
//                    [self.view layoutIfNeeded];
//                }];

@end
