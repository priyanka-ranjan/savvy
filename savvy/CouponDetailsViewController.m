

#import "CouponDetailsViewController.h"

#import "CouponModel.h"

@interface CouponDetailsViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *couponImageView;
@property (weak, nonatomic) IBOutlet UILabel *couponStoreName;
@property (weak, nonatomic) IBOutlet UILabel *couponDiscountAmount;
@property (weak, nonatomic) IBOutlet UIButton *bottomButton;

@property (nonatomic, strong) CouponModel *couponModel;
@end

@implementation CouponDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognized:)];
    [self.view addGestureRecognizer:tap];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setupView];
}

- (void)setupViewWithCouponModel:(CouponModel *)couponModel {
    self.couponModel = couponModel;
}

- (void)setupView {
    [self.couponImageView setImage:[UIImage imageNamed:self.couponModel.storeName]];
    self.couponStoreName.text = self.couponModel.storeName;
    self.couponDiscountAmount.text = self.couponModel.storeDiscount;
    self.couponDiscountAmount.font = [UIFont fontWithName:@"TFArrow-Light" size:15];
    
    [self.bottomButton setTitle:@"Redeem" forState:UIControlStateNormal];
}


- (void)tapGestureRecognized:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
