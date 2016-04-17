//
//  SignUpViewController.m
//  businessCards
//
//  Created by Robert Mannuzza on 4/2/16.
//  Copyright © 2016 Robert mannuzza. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)signUserUp:(id)sender {
    // if the user sign up is successful
    if (true) {
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
    
}

- (IBAction)dissmissView:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
