//
//  ContactViewController.h
//  businessCards
//
//  Created by Robert Mannuzza on 4/3/16.
//  Copyright © 2016 Robert mannuzza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "userInfo.h"

@interface ContactViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *fNameField;
@property (strong, nonatomic) IBOutlet UITextField *lNameField;
@property (strong, nonatomic) IBOutlet UITextField *emailAddressField;
@property (strong, nonatomic) IBOutlet UITextField *companyField;
@property (strong, nonatomic) IBOutlet UITextField *phoneNumberField;
@property (strong, nonatomic) IBOutlet UITextField *phoneNumber2Field;
@property (strong, nonatomic) IBOutlet UITextField *webSiteField;
@property (strong, nonatomic) IBOutlet UITextField *positionField;
@property (strong, nonatomic) IBOutlet UITextField *addressField;
@property (strong) userInfo *contact;


@end
