

#import "MainSwipeViewController.h"
#import "CouponDetailsViewController.h"

#import "CouponModel.h"
#import "TestDataBuilder.h"

#import "CouponButton.h"
#import "WalletButton.h"

#import "SwipeService.h"

#import "UIImageEffects.h"

@interface MainSwipeViewController () <SwipeServiceProtocol>

@property (weak, nonatomic) IBOutlet UIImageView *leftBackgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *rightBackgroundImageView;

@property (weak, nonatomic) IBOutlet CouponButton *leftButton;
@property (weak, nonatomic) IBOutlet CouponButton *rightButton;

@property (weak, nonatomic) IBOutlet WalletButton *firstWalletButton;
@property (weak, nonatomic) IBOutlet WalletButton *secondWalletButton;
@property (weak, nonatomic) IBOutlet WalletButton *thirdWalletButton;

@property (nonatomic, strong) CouponModel *leftCouponModel;
@property (nonatomic, strong) CouponModel *rightCouponModel;
@property (nonatomic, strong) CouponModel *serverRecievedCoupon;

@property (nonatomic, strong) SwipeService *swipeService;

@end

@implementation MainSwipeViewController


#pragma mark - View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSwipeService];
    [self setupGestureRecognizers];
    
    [self generateLeftCoupon];
    [self generateRightCoupon];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.swipeService getNewCoupon];
}

#pragma mark - Setup

- (void)setupSwipeService {
    self.swipeService = [[SwipeService alloc] init];
    self.swipeService.delegate = self;
}

- (void)setupGestureRecognizers {
    UIPanGestureRecognizer *panGestureLeftButton = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.leftButton addGestureRecognizer:panGestureLeftButton];
    
    UIPanGestureRecognizer *panGestureRightButton = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.rightButton addGestureRecognizer:panGestureRightButton];
}

#pragma mark - <SwipeServiceProtocol>

- (void)serviceRecievedNewCoupon:(CouponModel *)coupon {
    self.serverRecievedCoupon = coupon;
}

- (void)serviceRecievedFailedNetworkRequest {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Cannot connect to the server at this time. Please try again later." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
}


#pragma mark - Data Builders

- (void)generateLeftCoupon {
    self.leftCouponModel = [[CouponModel alloc] init];
    if (self.serverRecievedCoupon) {
        self.leftCouponModel = self.serverRecievedCoupon;
        self.serverRecievedCoupon = nil;
    }else {
        TestDataBuilder *testDataBuilder = [[TestDataBuilder alloc] init];
        while ([self.leftCouponModel.storeName isEqualToString:self.rightCouponModel.storeName] || self.leftCouponModel.storeName == nil) {
            self.leftCouponModel = [testDataBuilder newRandomCoupon];
        }
    }
    
    UIImage *backgroundImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_back",self.leftCouponModel.storeName]];
    UIImage *blurredBackgroundImage = [UIImageEffects imageByApplyingDarkEffectToImage:backgroundImage];
    [self.leftBackgroundImageView setImage:blurredBackgroundImage];
    [self.leftButton setupButtonForCouponModel:self.leftCouponModel];
    
    self.leftButton.tag = 0;
}

- (void)generateRightCoupon {
    self.rightCouponModel = [[CouponModel alloc] init];
    TestDataBuilder *testDataBuilder = [[TestDataBuilder alloc] init];
    while ([self.leftCouponModel.storeName isEqualToString:self.rightCouponModel.storeName] || self.rightCouponModel.storeName == nil) {
        self.rightCouponModel = [testDataBuilder newRandomCoupon];
    }
    UIImage *backgroundImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_back",self.rightCouponModel.storeName]];
    UIImage *blurredBackgroundImage = [UIImageEffects imageByApplyingDarkEffectToImage:backgroundImage];
    
    [self.rightBackgroundImageView setImage:blurredBackgroundImage];
    [self.rightButton setupButtonForCouponModel:self.rightCouponModel];
    self.rightButton.tag = 1;
}


#pragma mark - Pan Gesture Recognizer

- (void)pan:(UIPanGestureRecognizer *)recognizer {
    UIView *draggedButton = recognizer.view;
    
    BOOL isGoinUp = NO;
    CGPoint vel = [recognizer velocityInView:self.view];
    
    if (vel.y < 0) {
        isGoinUp = YES;
    } else {
        isGoinUp = NO;
    }
    
    if (recognizer.state == UIGestureRecognizerStateBegan ||
        recognizer.state == UIGestureRecognizerStateChanged) {
        draggedButton.center = CGPointMake(draggedButton.center.x,[recognizer locationInView:draggedButton.superview].y);
    } else if (recognizer.state == UIGestureRecognizerStateEnded)  {
        if (isGoinUp) {
            // remove from view
            [UIView animateWithDuration:0.3 animations:^{
                CGRect newButtonFrame = draggedButton.frame;
                newButtonFrame.origin.y = -draggedButton.frame.size.height;
                draggedButton.frame = newButtonFrame;
            } completion:^(BOOL finished) {
                if (draggedButton.tag == 0){
                    [self generateLeftCoupon];
                } else {
                    [self generateRightCoupon];
                }
            }];
        } else {
            // add to wallet
            [UIView animateWithDuration:0.3 animations:^{
                CGRect newButtonFrame = draggedButton.frame;
                newButtonFrame.origin.y = self.view.frame.size.height  + draggedButton.frame.size.height;
                draggedButton.frame = newButtonFrame;
            } completion:^(BOOL finished) {
                if (draggedButton.tag == 0){
                    [self updateWalletsWithCoupon:self.leftCouponModel];
                    [self generateLeftCoupon];
                } else {
                    [self updateWalletsWithCoupon:self.rightCouponModel];
                    [self generateRightCoupon];
                }
                
            }];
        }
    }
}

- (void)updateWalletsWithCoupon:(CouponModel *)coupon {
    if (!self.firstWalletButton.isOccupied) {
        [self.firstWalletButton setupButtonWithCouponModel:coupon];
    } else if(!self.secondWalletButton.isOccupied) {
        [self.secondWalletButton setupButtonWithCouponModel:coupon];
    } else if (!self.thirdWalletButton.isOccupied) {
        [self.thirdWalletButton setupButtonWithCouponModel:coupon];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Sorry, you have filled your wallet at this time! Please redeem a coupon before you can continue." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
}

#pragma mark - IBActions

- (IBAction)couponButtonTapped:(CouponButton *)sender {
    [self presentCouponDetailsWithControllerForCoupon:sender.couponModel];
}


#pragma mark - Wallet View

- (IBAction)walletButtonTapped:(WalletButton *)sender {
    [self presentCouponDetailsWithControllerForCoupon:sender.couponModel];
}


#pragma mark - Helpers

- (void)presentCouponDetailsWithControllerForCoupon:(CouponModel *)coupon {
    CouponDetailsViewController *couponDetailsViewController = [[CouponDetailsViewController alloc]init];
    couponDetailsViewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [couponDetailsViewController setupViewWithCouponModel:coupon];
    [self presentViewController:couponDetailsViewController animated:YES completion:nil];
}
@end
