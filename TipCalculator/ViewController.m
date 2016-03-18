//
//  ViewController.m
//  TipCalculator
//
//  Created by Nelson Chow on 2016-03-18.
//  Copyright © 2016 Nelson Chow. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UITextField *tipPercentageTextField;

@end

@implementation ViewController

- (IBAction)calculateTip:(id)sender {
    self.tipPercentage = [self.tipPercentageTextField.text floatValue] / 100;
    self.tipTotal = self.tipPercentage * [self.billAmountTextField.text floatValue];
    
    self.tipAmountLabel.text = [NSString stringWithFormat:@"$%.02f", self.tipTotal];
}

-(void)dismissKeyboard {
    [self.billAmountTextField resignFirstResponder];
    [self.tipPercentageTextField resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
