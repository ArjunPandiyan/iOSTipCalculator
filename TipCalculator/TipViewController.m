//
//  TipViewController.m
//  TipCalculator
//
//  Created by Arjun Pandiyan on 12/13/13.
//  Copyright (c) 2013 Arjun Pandiyan. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *lbBill;
@property (weak, nonatomic) IBOutlet UILabel *lbTotal;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sgPercent;
- (void)updateValues;
- (void)onSettingsButton;
- (IBAction)tipSelected:(id)sender;
- (IBAction)onTap:(id)sender;
- (void)readDefaultTip;
@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    [self updateValues];
}

- (void)viewDidAppear:(BOOL)animated {
    [self readDefaultTip];
    [self updateValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)tipSelected:(id)sender {
    NSLog(@"tipSelected");
    [self updateValues ];
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues ];
}

- (void) updateValues{
    float billAmount = [self.billTextField.text floatValue];
    NSArray *percent = @[@(0.1), @(0.15), @(0.2)];
    float tipAmount =  billAmount * [percent[self.sgPercent.selectedSegmentIndex] floatValue];
    float totalAmount = billAmount + tipAmount;
    self.lbBill.text = [NSString stringWithFormat:@"$%0.2f",tipAmount];
    self.lbTotal.text = [NSString stringWithFormat:@"$%0.2f",totalAmount];
}

-(void) onSettingsButton {
    NSLog(@"Settings button clicked");
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

-(void) readDefaultTip {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int percent = [defaults integerForKey:@"defaultPercent"];
    NSLog([NSString stringWithFormat:@"%i",percent ]);
    if(percent==10) {
        _sgPercent.selectedSegmentIndex = 0;
    }
    else if(percent==15) {
        _sgPercent.selectedSegmentIndex = 1;
    }
    else if(percent==20) {
        _sgPercent.selectedSegmentIndex = 2;
    }

}

@end
