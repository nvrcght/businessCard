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
#import "ContactViewController.h"

@interface TableViewController () {
    UIImage *image;
    NSMutableArray *events;
    NSUserDefaults *defaults;
}

@end
@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor blueColor];
    self.refreshControl.tintColor = [UIColor whiteColor];
    [self.refreshControl addTarget:self
                            action:@selector(reloadTableView)
                  forControlEvents:UIControlEventValueChanged];
    
    events = [[NSMutableArray alloc] init];
    defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"EVENTS"]) {
        events = [[defaults objectForKey:@"EVENTS"] mutableCopy];
    } else {
        [defaults setObject:events forKey:@"EVENTS"];
        [defaults synchronize];
        
    }
    
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
- (void)reloadTableView {
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    NSLog(@"Number of Sections: %lu", (unsigned long)[events count]);
    return [events count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSLog(@"Number of Rows in section %li - %lu", (long)section,(unsigned long)[[[events objectAtIndex:section] valueForKey:@"contacts"] count]);
    return [[[events objectAtIndex:section] valueForKey:@"contacts"] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[events objectAtIndex:section] valueForKey:@"event_name"];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary *contactDick = [[[events objectAtIndex:indexPath.section] objectForKey:@"contacts"] objectAtIndex:indexPath.row];
    userInfo *temp = [[userInfo alloc] initWithDictionary:contactDick];
    [cell.fName setText:temp.fname];
    [cell.lName setText:temp.lname];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //remove the deleted object from your data source.
        //If your data source is an NSMutableArray, do this
        [self removeContactWith:(int)indexPath.row inEvent:[[events objectAtIndex:indexPath.section] objectForKey:@"event_name"]];
        [tableView reloadData]; // tell table to refresh now
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [self performSegueWithIdentifier:@"displayContactTV" sender:self];
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
    events = [[NSMutableArray alloc] init];
    defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"EVENTS"]) {
        events = [[defaults objectForKey:@"EVENTS"] mutableCopy];
    } else {
        [defaults setObject:events forKey:@"EVENTS"];
        [defaults synchronize];
        
    }
    [self createEventWithName:eventName];
    [self addCardWith:info toEvent:eventName];
    return true;
}

-(Boolean)createEventWithName:(NSString*)eventName {
    for (int x = 0; x < [events count]; x++) {
        if ([[[events objectAtIndex:x] objectForKey:@"event_name"] isEqualToString:eventName]) {
            return true;
        }
    }
    NSMutableArray *contactsArray = [[NSMutableArray alloc] init];
    NSMutableDictionary *event = [[NSMutableDictionary alloc] init];
    [event setValue:eventName forKey:@"event_name"];
    [event setValue:contactsArray forKey:@"contacts"];
    [events addObject:event];
    [defaults setObject:events forKey:@"EVENTS"];
    [defaults synchronize];
    return true;
}

- (Boolean)addCardWith:(userInfo*)info toEvent:(NSString*)eventName {
    for (int x = 0; x < [events count]; x++) {
        if ([[[events objectAtIndex:x] objectForKey:@"event_name"] isEqualToString:eventName]) {
            NSMutableArray *contacts = [[[events objectAtIndex:x] objectForKey:@"contacts"] mutableCopy];
            [contacts addObject:[info createDictionaryFromObject]];
            NSMutableDictionary *evenTOadd = [[events objectAtIndex:x] mutableCopy];
            [evenTOadd setValue:contacts forKey:@"contacts"];
            [events replaceObjectAtIndex:x withObject:evenTOadd];
            [defaults setObject:events forKey:@"EVENTS"];
            [defaults synchronize];
            
            return true;
        }
    }
    return false;
    
}
- (Boolean)removeContactWith:(int)index inEvent:(NSString*)eventName {
    for (int x = 0; x < [events count]; x++) {
        if ([[[events objectAtIndex:x] objectForKey:@"event_name"] isEqualToString:eventName]) {
            NSMutableArray *contacts = [[[events objectAtIndex:x] objectForKey:@"contacts"] mutableCopy];
            [contacts removeObjectAtIndex:index];
            NSMutableDictionary *evenTOadd = [[events objectAtIndex:x] mutableCopy];
            [evenTOadd setValue:contacts forKey:@"contacts"];
            [events replaceObjectAtIndex:x withObject:evenTOadd];
            [defaults setObject:events forKey:@"EVENTS"];
            [defaults synchronize];
            
            return true;
        }
    }
    return true;
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
        vc.image = image;
    }
    if ([segue.identifier isEqualToString:@"displayContactTV"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];;
        NSDictionary *contactList = [[[events objectAtIndex:indexPath.section] objectForKey:@"contacts"] objectAtIndex:indexPath.row];
        userInfo *temp = [[userInfo alloc] initWithDictionary:contactList];
        NSLog(@"Temp Name: %@", temp.fname);
        ContactViewController *vc = [segue destinationViewController];
        vc.contact = temp;
        
    }
}

@end
