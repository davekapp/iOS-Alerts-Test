//
//  ViewController.m
//  AlertsTest
//
//  Created by David Kapp on 1/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize output;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setOutput:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

- (IBAction)basicAlert:(id)sender {
  UIAlertView *alertDialog;
  alertDialog = [[UIAlertView alloc] 
                 initWithTitle:@"This is an alert"
                 message:@"Isn't that exciting"
                 delegate:self
                 cancelButtonTitle:@"Yeah whatever"
                 otherButtonTitles:nil];
  [alertDialog show];
}

- (IBAction)alertWithButtons:(id)sender {
  UIAlertView *alertDialog;
  alertDialog = [[UIAlertView alloc] initWithTitle:@"PRESS A BUTTON" message:@"You know you want to" delegate:self cancelButtonTitle:@"I refuse" otherButtonTitles:@"Ok", @"まあ、いいっか", nil];
  [alertDialog show];
}

- (IBAction)alertWithInput:(id)sender {
  UIAlertView *alertDialog = [[UIAlertView alloc]
                              initWithTitle:@"Gimme text!"
                              message:@"WAT UR EMAIL?"
                              delegate:self
                              cancelButtonTitle:@"NOES"
                              otherButtonTitles:nil];
  alertDialog.alertViewStyle = UIAlertViewStylePlainTextInput;
  [alertDialog show];
}

- (IBAction)actionSheet:(id)sender {
  UIActionSheet *sheet;
  sheet = [[UIActionSheet alloc]
           initWithTitle:@"OH SHEET"
           delegate:self
           cancelButtonTitle:@"Nuh-uh"
           destructiveButtonTitle:@"BUUURN"
           otherButtonTitles:@"Foo", @"Bar", @"Foobar", @"BIIIICOLOR", @"Mitted Mitted Mitted", @"OH YEAH", nil];
  sheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
  [sheet showFromRect:[sender frame] inView:self.view animated:YES];
}

- (SystemSoundID)createSoundIdForCrash {
  SystemSoundID soundId;
  NSString *soundFile = [[NSBundle mainBundle] pathForResource:@"crash" ofType:@"wav"];
  AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:soundFile], &soundId);
  return soundId;
}

- (IBAction)playSound:(id)sender {
  SystemSoundID soundId = [self createSoundIdForCrash];
  AudioServicesPlaySystemSound(soundId);
}

- (IBAction)playAlertSound:(id)sender {
  SystemSoundID soundId = [self createSoundIdForCrash];
  AudioServicesPlayAlertSound(soundId);
}

- (IBAction)shakeItBaby:(id)sender {
  AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
  NSString *clickedButtonTitle = [alertView buttonTitleAtIndex:buttonIndex];
  
  self.output.text = [NSString stringWithFormat:@"User selected: %@ at index %d", clickedButtonTitle, buttonIndex];

//  NSString *inputText = [[alertView textFieldAtIndex:0] text];
//  if (inputText) {
//    self.output.text = [self.output.text stringByAppendingString:inputText];
//  }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
  NSString *clickedButtonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
  self.output.text = [NSString stringWithFormat:@"User selected %@ at index %d", clickedButtonTitle, buttonIndex];
}

@end






















