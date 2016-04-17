//
//  LogInViewController.m
//  businessCards
//
//  Created by Robert Mannuzza on 4/2/16.
//  Copyright © 2016 Robert mannuzza. All rights reserved.
//

#import "LogInViewController.h"


@interface LogInViewController () {

}
@end

@implementation LogInViewController

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

- (IBAction)logUserIn:(id)sender {
    if (true) {
        //save user token
        //present data view
        [self performSegueWithIdentifier:@"loginSuccess" sender:self];
    }
}
@end
