//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Arjun Pandiyan on 12/14/13.
//  Copyright (c) 2013 Arjun Pandiyan. All rights reserved.
//

#import "SettingsViewController.h"

NSUserDefaults *defaults;

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *defaultTip;
@property (weak, nonatomic) IBOutlet UILabel *currentValue;

- (IBAction)onSave:(id)sender;
- (IBAction)onClick:(id)sender;
- (void)saveDefault;

- (void)refresh;
@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Settings";    
    // Do any additional setup after loading the view from its nib.
    defaults = [NSUserDefaults standardUserDefaults];
    NSString *stringValue = [defaults objectForKey:@"defaultPercent"];
    self.currentValue.text = stringValue;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSave:(id)sender {
    [self saveDefault];
}

- (IBAction)onClick:(id)sender {
    [self.view endEditing:YES];
    [self saveDefault];
}

- (void) saveDefault {
    NSString *input = self.defaultTip.text;
    defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:input forKey:@"defaultPercent"];
    [defaults synchronize];
    self.currentValue.text = input;
}

@end
