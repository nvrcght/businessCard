//
//  ImageViewViewController.m
//  businessCards
//
//  Created by Robert Mannuzza on 4/3/16.
//  Copyright © 2016 Robert mannuzza. All rights reserved.
//

#import "ImageViewViewController.h"
#import "AFNetworking.h"


@interface ImageViewViewController ()

@end
@implementation ImageViewViewController

@synthesize imagePreview,image;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.imagePreview setImage:image];
    [self performSelector:@selector(showAlertView) withObject:nil afterDelay:3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)showAlertView {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:@"Please wait\n\n\n"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center = CGPointMake(130.5, 65.5);
    spinner.color = [UIColor blackColor];
    [spinner startAnimating];
    [alert.view addSubview:spinner];
    [self presentViewController:alert animated:YES completion:^{
        [self startRequest];
        [spinner stopAnimating];
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
}

- (void)startRequest {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://162.243.214.64:8000/upload"]];
    [request setHTTPMethod:@"POST"];
    NSMutableData *body = [NSMutableData data];
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Disposition: form-data; name=\"file\"; filename=\"parkN.jpg\"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:imageData];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    // close form
    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    // setting the body of the post to the reqeust
    [request setHTTPBody:body];
    
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",returnString);
    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingMutableLeaves error:nil];

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
