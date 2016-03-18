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

@end

@implementation ViewController

- (IBAction)calculateTip:(id)sender {
    self.tipPercentage = 0.15;
    self.tipTotal = self.tipPercentage * [self.billAmountTextField.text floatValue];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
