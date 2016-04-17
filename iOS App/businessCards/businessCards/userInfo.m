//
//  userInfo.m
//  businessCards
//
//  Created by Robert Mannuzza on 4/3/16.
//  Copyright © 2016 Robert mannuzza. All rights reserved.
//

#import "userInfo.h"

@implementation userInfo

-(id)init {
    self = [super init];
    if(self)
    {
        //do things here
        self.fname = @"";
        self.lname = @"";
        self.emailAddress = @"";
        self.companyName = @"";
        self.phoneNumber = @"";
        self.phoneNumber2 = @"";
        self.website = @"";
        self.position = @"";
        self.address = @"";
        self.jSonData = [[NSData alloc] init];
    }
    return self;
}
-(id)initWithDictionary:(NSDictionary*)dict {
    self = [super init];
    if(self)
    {
        //do things here
        if ([dict objectForKey:@"first_name"]) {
            _fname = [dict objectForKey:@"first_name"];
        }
        if ([dict objectForKey:@"last_name"]) {
            _lname = [dict objectForKey:@"last_name"];
        }
        if ([dict objectForKey:@"number"]) {
            _phoneNumber = [dict objectForKey:@"number"];
        }
        if ([dict objectForKey:@"number2"]) {
            _phoneNumber2 = [dict objectForKey:@"number2"];
        }
        if ([dict objectForKey:@"website"]) {
            _website = [dict objectForKey:@"website"];
        }
        if ([dict objectForKey:@"email"]) {
            _emailAddress = [dict objectForKey:@"email"];
        }
        if ([dict objectForKey:@"address"]) {
            _address = [dict objectForKey:@"address"];
        }
        if ([dict objectForKey:@"position"]) {
            _position = [dict objectForKey:@"position"];
        }
        if ([dict objectForKey:@"json_data"]) {
            _jSonData = [dict objectForKey:@"json_data"];
        }
    }
    return self;
}
- (NSMutableDictionary*)createDictionaryFromObject {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:_fname forKey:@"first_name"];
    [dict setValue:_lname forKey:@"last_name"];
    [dict setValue:_phoneNumber forKey:@"number"];
    [dict setValue:_phoneNumber2 forKey:@"number2"];
    [dict setValue:_website forKey:@"website"];
    [dict setValue:_emailAddress forKey:@"email"];
    [dict setValue:_address forKey:@"address"];
    [dict setValue:_position forKey:@"position"];
    [dict setValue:_jSonData forKey:@"json_data"];
    return dict;
}

- (void)setContactFromData:(NSData*)data {
    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    _jSonData = data;
    if ([dict objectForKey:@"first_name"]) {
        _fname = [dict objectForKey:@"first_name"];
    }
    if ([dict objectForKey:@"last_name"]) {
        _lname = [dict objectForKey:@"last_name"];
    }
    if ([dict objectForKey:@"number"]) {
        _phoneNumber = [dict objectForKey:@"number"];
    }
    if ([dict objectForKey:@"number2"]) {
        _phoneNumber2 = [dict objectForKey:@"number2"];
    }
    if ([dict objectForKey:@"website"]) {
        _website = [dict objectForKey:@"website"];
    }
    if ([dict objectForKey:@"email"]) {
        _emailAddress = [dict objectForKey:@"email"];
    }
    if ([dict objectForKey:@"address"]) {
        _address = [dict objectForKey:@"address"];
    }
    if ([dict objectForKey:@"position"]) {
        _position = [dict objectForKey:@"position"];
    }
}
@end
