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
    [self registerForKeyboardNotifications];
    [self displayContact];
    [self.fNameField addTarget:self action:@selector(textFieldDidChangeFN:) forControlEvents:UIControlEventEditingChanged];
    [self.lNameField addTarget:self action:@selector(textFieldDidChangeLN:) forControlEvents:UIControlEventEditingChanged];
    [self.emailAddressField addTarget:self action:@selector(textFieldDidChangeEA:) forControlEvents:UIControlEventEditingChanged];
    [self.companyField addTarget:self action:@selector(textFieldDidChangeCF:) forControlEvents:UIControlEventEditingChanged];
    [self.phoneNumberField addTarget:self action:@selector(textFieldDidChangePNF:) forControlEvents:UIControlEventEditingChanged];
    [self.phoneNumber2Field addTarget:self action:@selector(textFieldDidChangePNF2:) forControlEvents:UIControlEventEditingChanged];
    [self.webSiteField addTarget:self action:@selector(textFieldDidChangeWS:) forControlEvents:UIControlEventEditingChanged];
    [self.positionField addTarget:self action:@selector(textFieldDidChangePF:) forControlEvents:UIControlEventEditingChanged];
    [self.addressField addTarget:self action:@selector(textFieldDidChangeAF:) forControlEvents:UIControlEventEditingChanged];
    

}
-(void)textFieldDidChangeFN:(UITextField *)theTextField{
    NSLog( @"text changedFN: %@", theTextField.text);
    self.contact.fname = theTextField.text;
}
-(void)textFieldDidChangeLN:(UITextField *)theTextField{
    NSLog( @"text changed: %@", theTextField.text);
    self.contact.lname = theTextField.text;
}
-(void)textFieldDidChangeEA:(UITextField *)theTextField{
    NSLog( @"text changed: %@", theTextField.text);
    self.contact.emailAddress = theTextField.text;
}
-(void)textFieldDidChangeCF:(UITextField *)theTextField{
    NSLog( @"text changed: %@", theTextField.text);
    self.contact.companyName = theTextField.text;
}
-(void)textFieldDidChangePNF:(UITextField *)theTextField{
    NSLog( @"text changed: %@", theTextField.text);
    self.contact.phoneNumber = theTextField.text;
}
-(void)textFieldDidChangePNF2:(UITextField *)theTextField{
    NSLog( @"text changed: %@", theTextField.text);
    self.contact.phoneNumber2 = theTextField.text;
}
-(void)textFieldDidChangeWS:(UITextField *)theTextField{
    NSLog( @"text changed: %@", theTextField.text);
    self.contact.website = theTextField.text;
}
-(void)textFieldDidChangePF:(UITextField *)theTextField{
    NSLog( @"text changed: %@", theTextField.text);
    self.contact.position = theTextField.text;
}
-(void)textFieldDidChangeAF:(UITextField *)theTextField{
    NSLog( @"text changed: %@", theTextField.text);
    self.contact.address = theTextField.text;
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

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    _scrollView.contentInset = contentInsets;
    _scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your application might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    UITextField *activeField;
    for (UITextField *view in self.view.subviews) {
        if (view.isFirstResponder) {
            activeField = view;
        }
    }
    if (!CGRectContainsPoint(aRect, activeField.frame.origin) ) {
        CGPoint scrollPoint = CGPointMake(0.0, activeField.frame.origin.y-kbSize.height);
        [_scrollView setContentOffset:scrollPoint animated:YES];
    }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    _scrollView.contentInset = contentInsets;
    _scrollView.scrollIndicatorInsets = contentInsets;
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
