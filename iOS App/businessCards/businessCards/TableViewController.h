//
//  TableViewController.h
//  businessCards
//
//  Created by Robert Mannuzza on 4/3/16.
//  Copyright © 2016 Robert mannuzza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JPSImagePickerController/JPSImagePickerController.h>
@interface TableViewController : UITableViewController < JPSImagePickerDelegate >

- (IBAction)presentCamera:(id)sender;
@end
