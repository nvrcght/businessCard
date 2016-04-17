//
//  ImageViewViewController.h
//  businessCards
//
//  Created by Robert Mannuzza on 4/3/16.
//  Copyright © 2016 Robert mannuzza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JPSImagePickerController/JPSImagePickerController.h>

@interface ImageViewViewController : UIViewController <JPSImagePickerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imagePreview;
@property (strong, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) UIImage *image;
@end
