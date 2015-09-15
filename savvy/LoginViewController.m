//
//  loginViewController.m
//  Savvy
//
//  Created by Eric Chen on 2014-05-27.
//  Copyright (c) 2014 Savvy. All rights reserved.
//

#import "loginViewController.h"
#import "Savvy.h"
#import <FacebookSDK/FacebookSDK.h>


@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet FBLoginView *loginView;

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.loginView.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    
    
}

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    [self performSegueWithIdentifier:@"loggedin" sender:self];
}

@end
