//
//  ViewController.h
//  AlertsTest
//
//  Created by David Kapp on 1/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController : UIViewController <UIAlertViewDelegate, UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UILabel *output;

- (IBAction)basicAlert:(id)sender;
- (IBAction)alertWithButtons:(id)sender;
- (IBAction)alertWithInput:(id)sender;
- (IBAction)actionSheet:(id)sender;
- (IBAction)playSound:(id)sender;
- (IBAction)playAlertSound:(id)sender;
- (IBAction)shakeItBaby:(id)sender;

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;

@end
