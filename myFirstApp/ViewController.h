//
//  ViewController.h
//  myFirstApp
//
//  Created by Administrator on 29.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface ViewController : UIViewController
<UIPickerViewDelegate, UIPickerViewDataSource, MFMailComposeViewControllerDelegate>
{
    NSArray* activities_;
    NSArray* feelings_;
    UIPickerView* emailPicker_;
    
    UITextField* textField_;
    
   
    
    
}
@property (nonatomic, retain) IBOutlet UIPickerView * emailPicker;
@property (nonatomic, retain) IBOutlet UITextField* textField;

 -(IBAction) sendButtonTapped:(id)sender;
-(IBAction)textFieldEditEnded:(id)sender;
@end
