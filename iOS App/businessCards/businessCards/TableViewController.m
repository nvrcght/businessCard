//
//  TableViewController.m
//  businessCards
//
//  Created by Robert Mannuzza on 4/3/16.
//  Copyright © 2016 Robert mannuzza. All rights reserved.
//

#import "TableViewController.h"
#import "ImageViewViewController.h"
#import "userInfo.h"
#import "CardTableViewCell.h"

@interface TableViewController () {
    UIImage *image;
    NSMutableArray *events;
    NSUserDefaults *defaults;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    userInfo *newContact = [[userInfo alloc] init];
//    newContact.fname = @"Robert";
//    newContact.lname = @"Mannuzza";
//    
//    userInfo *newContact2 = [[userInfo alloc] init];
//    newContact2.fname = @"Sara";
//    newContact2.lname = @"Mannuzza";
    
    
    events = [[NSMutableArray alloc] init];
    defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"EVENTS"] != nil) {
        events = [defaults objectForKey:@"EVENTS"];
    } else {
        [defaults setObject:events forKey:@"EVENTS"];
        [defaults synchronize];
    }
    
//    for (int x = 0; x < 15; x++) {
//        if (![self addCardWith:newContact toEvent:@"HackNY"]) {
//            [self addEventWithName:@"HackNY" withUser:newContact];
//        }
//    }
//    
//    for (int x = 0; x < 15; x++) {
//        if (![self addCardWith:newContact2 toEvent:@"HackTCNJ"]) {
//            [self addEventWithName:@"HackTCNJ" withUser:newContact];
//        }
//    }
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [events count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *key = [[[events objectAtIndex:section] allKeys] objectAtIndex:0];
    return [[[events objectAtIndex:section] valueForKey:key] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[[events objectAtIndex:section] allKeys] objectAtIndex:0];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *key = [[[events objectAtIndex:indexPath.section] allKeys] objectAtIndex:0];
    userInfo *temp = [[[events objectAtIndex:indexPath.section] objectForKey:key] objectAtIndex:indexPath.row];
    [cell.fName setText:temp.fname];
    [cell.lName setText:temp.lname];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/
- (Boolean)addEventWithName:(NSString*)eventName withUser:(userInfo*)info {
    NSMutableArray *contactsArray = [[NSMutableArray alloc] init];
    NSMutableDictionary *event = [[NSMutableDictionary alloc] init];
    [contactsArray addObject:info];
    [event setValue:contactsArray forKey:eventName];
    [events addObject:event];
    [defaults setObject:events forKey:@"EVENTS"];
    [defaults synchronize];
    return true;
}

- (Boolean)addCardWith:(userInfo*)info toEvent:(NSString*)eventName {
    for (int x = 0; x < [events count]; x++) {
        if ([[[[events objectAtIndex:x] allKeys] objectAtIndex:0] isEqualToString:eventName]) {
            NSString *key =[[[events objectAtIndex:x] allKeys] objectAtIndex:0];
            [[[events objectAtIndex:x] objectForKey:key] addObject:info];
            [defaults setObject:events forKey:@"EVENTS"];
            [defaults synchronize];
            return true;
        }
    }
    return false;
    
}

- (IBAction)presentCamera:(id)sender {
    JPSImagePickerController *imagePicker = [[JPSImagePickerController alloc] init];
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:nil];
}
-(void)picker:(JPSImagePickerController *)picker didConfirmPicture:(UIImage *)picture {
    image = picture;
    [self performSegueWithIdentifier:@"imagePreview" sender:self];
}
#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"imagePreview"]) {
        [self presentCamera:self];
        ImageViewViewController *vc = [segue destinationViewController];
        NSLog(@"gets here");
        vc.image = image;
    }
}

@end
