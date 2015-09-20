

#import "CouponDetailsViewController.h"

#import "CouponModel.h"

@interface CouponDetailsViewController ()

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

@property (nonatomic, strong) CouponModel *couponModel;

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
    self.finalView.hidden = YES;
}

#pragma mark - Setup

- (void)setupViewWithCouponModel:(CouponModel *)couponModel {
    self.couponModel = couponModel;
}

- (void)setupView {
    [self.couponImageView setImage:[UIImage imageNamed:self.couponModel.storeName]];
    self.couponStoreName.text = self.couponModel.storeName;
    self.couponDiscountAmount.text = self.couponModel.storeDiscount;
    self.couponDiscountAmount.font = [UIFont fontWithName:@"TFArrow-Light" size:15];
    
    [self.bottomButton setTitle:@"Redeem" forState:UIControlStateNormal];
    
    [self.finalViewBackgroundImageView setImage:[UIImage imageNamed:self.couponModel.storeName]];
    self.userCouponCodeLabel.text = self.couponModel.storeName;
    self.clientCouponCodeLabel.text = nil;
    self.clientCouponCodeLabel.font =
    self.userCouponCodeLabel.font = [UIFont fontWithName:@"TFArrow-Light" size:20];

    [self.doneButton setTitle:@"Done" forState:UIControlStateNormal];
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

- (IBAction)swapButtonTapped:(id)sender {
    [UIView transitionFromView:self.finalView
                        toView:self.redeemView
                      duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromLeft | UIViewAnimationOptionShowHideTransitionViews
                    completion:^(BOOL finished) {
                        [self.view layoutIfNeeded];
                    }];
}

- (IBAction)doneButtonTapped:(id)sender {
    //send a post call
}

#pragma mark - UITapGestureRecognizer

- (void)addTapGestureRecognizer {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognized:)];
    [self.view addGestureRecognizer:tap];
}

- (void)tapGestureRecognized:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
