

#import "LoginViewController.h"
#import "UIImageEffects.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *loginBackgroundImageView;


@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.loginBackgroundImageView setImage:[UIImageEffects imageByApplyingTintEffectWithColor:[UIColor blackColor] toImage:self.loginBackgroundImageView.image]];
}

@end
