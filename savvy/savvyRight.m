//
//  savvyRight.m
//  Savvy
//
//  Created by Eric Chen on 2014-06-11.
//  Copyright (c) 2014 Savvy. All rights reserved.
//

#import "savvyRight.h"
#import "savvyModel.h"

@interface savvyRight ()

@end

@implementation savvyRight

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self drawRandomTikkit];
    
    
}

- (void)drawRandomTikkit
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
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
