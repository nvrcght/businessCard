//
//  LogInViewController.h
//  businessCards
//
//  Created by Robert Mannuzza on 4/2/16.
//  Copyright © 2016 Robert mannuzza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogInViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *userNameField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)logUserIn:(id)sender;
@end
