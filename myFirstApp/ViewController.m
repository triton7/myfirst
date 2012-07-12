//
//  ViewController.m
//  myFirstApp
//
//  Created by Administrator on 29.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize emailPicker = emailPicker_;
@synthesize textField = textField_;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
    // some comment has been added.
}

-(IBAction)textFieldEditEnded:(id)sender
{
    [sender resignFirstResponder];
}

-(IBAction) sendButtonTapped:(id)sender
{
    NSString * mess = [NSString stringWithFormat:@"I'm %@ and feeling %@ about it.", [activities_ objectAtIndex:[emailPicker_ selectedRowInComponent:0]], [feelings_ objectAtIndex:[emailPicker_ selectedRowInComponent:1]]];
    NSLog(@"%@", mess);
    
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController * mailController = [[MFMailComposeViewController alloc] init];
        mailController.mailComposeDelegate = self;
        [mailController setSubject:@"hello Renee!"];
        [mailController setMessageBody:mess isHTML:NO];
        [self presentModalViewController:mailController animated:YES];
        //[mailController release];
    }
    else
    {
        NSLog(@"%@", "sorry, setup mail first!");
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    activities_ = [[NSArray alloc] initWithObjects:@"sleeping", @"eating", @"working", @"thinking", @"crying", @"begging", @"leaving", @"shopping", @"hello worlding", nil];
    feelings_ = [[NSArray alloc] initWithObjects:@"awesome", @"sad", @"happy", @"ambivalent", @"nauseous" @"psyched", @"confused", @"hopeful", @"anxious", nil];
}

#pragma mark -
#pragma mark Picker Datasource Protocol
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *) pickerView
{
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0)
    {
        return [activities_ count];
    }
    else
    {
        return [feelings_ count];
    }
}
#pragma mark -
#pragma mark Picker Delegate Protocol
- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0)
    {
        return [activities_ objectAtIndex:row];
    }
    else
    {
        return [feelings_ objectAtIndex:row];
    }
    return nil;
}

- (void)viewDidUnload
{
    //[activities_ release];
    //[feelings_ release];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    //[activities_ release];
    //[feelings_ release];
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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
