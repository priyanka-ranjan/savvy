

#import "SwipeService.h"
#import "NetworkingManager.h"

@interface SwipeService () <NetworkingManagerDelegate>

@property (nonatomic, strong) NetworkingManager *networkingManager;

@end

@implementation SwipeService


-(void)getNewCoupon {
    [self.networkingManager getCoupons];
}

#pragma mark - <NetworkingManagerDelegate>

- (void)requestPassedWithResponse:(id)response {
    NSLog(@"-------- The response is: %@", response);
}

- (void)requestFailedWithError:(NSError *)error {
    NSLog(@"------------ It failed because: %@",error);
}

@end
