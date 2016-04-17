//
//  SignUpViewController.h
//  businessCards
//
//  Created by Robert Mannuzza on 4/2/16.
//  Copyright © 2016 Robert mannuzza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *userNameField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordField;
@property (strong, nonatomic) IBOutlet UITextField *emailAddressField;

- (IBAction)signUserUp:(id)sender;
- (IBAction)dissmissView:(id)sender;
@end
