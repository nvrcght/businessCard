//
//  userInfo.h
//  businessCards
//
//  Created by Robert Mannuzza on 4/3/16.
//  Copyright © 2016 Robert mannuzza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface userInfo : NSObject
@property (strong, nonatomic) NSString *fname;
@property (strong, nonatomic) NSString *lname;
@property (strong, nonatomic) NSString *emailAddress;
@property (strong, nonatomic) NSString *companyName;
@property (strong, nonatomic) NSString *phoneNumber;
@property (strong, nonatomic) NSString *phoneNumber2;
@property (strong, nonatomic) NSString *website;
@property (strong, nonatomic) NSString *position;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSData *jSonData;
//@property (strong, nonatomic) UIImage *picture;
//@property (strong, nonatomic) UIImage *cardPicture;
- (void)setContactFromData:(NSData*)data;
- (NSDictionary*)createDictionaryFromObject;
-(id)initWithDictionary:(NSDictionary*)dict;
-(id)init;

@end
