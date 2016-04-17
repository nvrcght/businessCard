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

@interface ContactViewController ()
@property (strong) CNContactStore *store;
@property (strong)  CNContactViewController *controller;
@property(nonatomic, copy) NSString *contactIdentifier;
@end

@implementation ContactViewController

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

@end
