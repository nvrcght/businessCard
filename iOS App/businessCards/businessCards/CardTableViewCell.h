//
//  CardTableViewCell.h
//  businessCards
//
//  Created by Robert Mannuzza on 4/3/16.
//  Copyright © 2016 Robert mannuzza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "userInfo.h"

@interface CardTableViewCell : UITableViewCell
@property (strong, nonatomic) userInfo *info;
@property (strong, nonatomic) IBOutlet UILabel *fName;
@property (strong, nonatomic) IBOutlet UILabel *lName;
@end
