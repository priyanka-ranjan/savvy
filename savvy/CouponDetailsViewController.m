

#import "CouponDetailsViewController.h"

#import "CouponModel.h"
#import "SwipeService.h"

#import "UIImageEffects.h"

@interface CouponDetailsViewController () <SwipeServiceProtocol, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *finalView;
@property (weak, nonatomic) IBOutlet UIImageView *finalViewBackroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *userCouponCodeTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *userCouponCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *clientCouponCodeTitleLabel;
@property (weak, nonatomic) IBOutlet UITextField *clientCouponCodeTextField;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;


@property (weak, nonatomic) IBOutlet UIView *redeemView;
@property (weak, nonatomic) IBOutlet UIImageView *redeemViewBackgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *redeemViewStoreLogoImageView;
@property (weak, nonatomic) IBOutlet UILabel *collectionLabel;
@property (weak, nonatomic) IBOutlet UILabel *productLabel;
@property (weak, nonatomic) IBOutlet UILabel *discountLabel;
@property (weak, nonatomic) IBOutlet UIButton *bottomButton;


@property (nonatomic, assign) BOOL isCoupon;
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
    [self setupRoundedCornersAndBorders];
}

#pragma mark - Setup

- (void)setupViewWithCouponModel:(CouponModel *)couponModel isCoupon:(BOOL)isCoupon delegate:(id)delegate {
    self.couponModel = couponModel;
    self.isCoupon = isCoupon;
    self.delegate = delegate;
}
- (void)setupSwipeService {
    self.swipeService = [[SwipeService alloc] init];
    self.swipeService.delegate = self;
}

- (void)setupView {
    [self setupAddToWalletOrRedeemView];
    [self setupFinalView];
    
    self.discountLabel.font =
    self.productLabel.font =[UIFont fontWithName:@"TFArrow-Light" size:20];
    
    self.clientCouponCodeTitleLabel.font =
    self.userCouponCodeTitleLabel.font =
    self.collectionLabel.font = [UIFont fontWithName:@"TFArrow-Light" size:25];
    
    self.clientCouponCodeTextField.font =
    self.userCouponCodeLabel.font = [UIFont fontWithName:@"TFArrow-Light" size:30];
}

- (void)setupAddToWalletOrRedeemView {
    [self.redeemViewBackgroundImageView setImage:[UIImage imageNamed:self.couponModel.storeName]];
    self.redeemViewStoreLogoImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_logo",self.couponModel.storeName]];
    
    self.discountLabel.text = self.couponModel.storeDiscount;
    self.collectionLabel.text = self.couponModel.collectionType;
    self.productLabel.text = self.couponModel.productType;
    
    if (self.isCoupon) {
        [self.bottomButton setTitle:@"Add To Wallet" forState:UIControlStateNormal];
    } else {
        [self.bottomButton setTitle:@"Redeem" forState:UIControlStateNormal];
    }
}

- (void)setupFinalView {
    [self.finalViewBackroundImageView setImage:[UIImageEffects imageByApplyingExtraLightEffectToImage:[UIImage imageNamed:self.couponModel.storeName]]];
    self.userCouponCodeLabel.text = self.couponModel.userCouponString;
    [self.doneButton setTitle:@"Cancel" forState:UIControlStateNormal];
    self.clientCouponCodeTextField.delegate = self;

}

-(void)setupRoundedCornersAndBorders {
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


#pragma mark - <SwipeServiceProtocol>

- (void)serviceRecievedNewCoupon:(CouponModel *)coupon {
    
}

-(void)serviceRecievedFailedNetworkRequest {
    
}


#pragma mark - IBACtions

- (IBAction)redeemButtonTapped:(id)sender {
    if (self.isCoupon){
        [self.delegate userPressedAddToWalletForCoupon:self.couponModel];
    } else {
        [UIView transitionFromView:self.redeemView
                            toView:self.finalView
                          duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromLeft | UIViewAnimationOptionShowHideTransitionViews
                        completion:^(BOOL finished) {
                            [self.view layoutIfNeeded];
                        }];
 
    }
}

- (IBAction)doneButtonTapped:(id)sender {
    if (self.clientCouponCodeTextField.text.length == 0){
        [UIView transitionFromView:self.finalView
                            toView:self.redeemView
                          duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight | UIViewAnimationOptionShowHideTransitionViews
                        completion:^(BOOL finished) {
                            [self.view layoutIfNeeded];
                        }];

    }else {
        //send a post call
        self.couponModel.clientCouponString = self.clientCouponCodeTextField.text;
        [self.swipeService postCouponToRedeem:self.couponModel];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - UITapGestureRecognizer

- (void)addTapGestureRecognizer {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognized:)];
    [self.view addGestureRecognizer:tap];
}

- (void)tapGestureRecognized:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - <UITextFieldDelegate>

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField.text.length != 0){
        [self.doneButton setTitle:@"Done" forState:UIControlStateNormal];
    } else {
        [self.doneButton setTitle:@"Cancel" forState:UIControlStateNormal];

    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self doneButtonTapped:nil];
    return YES;
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
