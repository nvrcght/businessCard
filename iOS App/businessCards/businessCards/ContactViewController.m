//
//  ContactViewController.m
//  businessCards
//
//  Created by Robert Mannuzza on 4/3/16.
//  Copyright © 2016 Robert mannuzza. All rights reserved.
//
#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>
#import "ContactViewController.h"
#import "userInfo.h"
#import "TableViewController.h"

@interface ContactViewController ()
@property (strong) CNContactStore *store;
@property (strong) CNContactViewController *controller;
@property(nonatomic, copy) NSString *contactIdentifier;
@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"Name: %@", self.contact);
    [self displayContact];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)displayContact {
    [self.fNameField setText:self.contact.fname];
    [self.lNameField setText:self.contact.lname];
    [self.emailAddressField setText:self.contact.emailAddress];
    [self.companyField setText:self.contact.companyName];
    [self.phoneNumberField setText:self.contact.phoneNumber];
    [self.phoneNumber2Field setText:self.contact.phoneNumber2];
    [self.webSiteField setText:self.contact.website];
    [self.positionField setText:self.contact.position];
    [self.addressField setText:self.contact.emailAddress];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"addContactToList"]) {
        TableViewController *vc = [segue destinationViewController];
        [vc addEventWithName:@"My Contacts" withUser:self.contact];
    }
}


@end
