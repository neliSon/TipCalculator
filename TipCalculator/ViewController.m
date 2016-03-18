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
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (weak, nonatomic) IBOutlet UISlider *slider;

//- (void)keyboardDidShow: (NSNotification *) notif;
//- (void)keyboardDidHide: (NSNotification *) notif;

@end

@implementation ViewController

- (IBAction)calculateTip:(id)sender {
    self.tipPercentage = [self.tipPercentageTextField.text floatValue] / 100;
    self.tipTotal = self.tipPercentage * [self.billAmountTextField.text floatValue];
    
    self.tipAmountLabel.text = [NSString stringWithFormat:@"$%.02f", self.tipTotal];
}

- (IBAction)adjustTipPercentage:(id)sender {
//    UISlider *slider = (UISlider* ) sender;
    if (UIGestureRecognizerStateChanged) {
        self.tipPercentage = self.slider.value;
        NSString *newValue;
        
        newValue = [NSString stringWithFormat:@"%.f", self.slider.value];
        self.tipPercentageTextField.text = newValue;
    }
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
    [self registerForKeyboardNotifications];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHide:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)keyboardDidShow: (NSNotification *) notif{
    [UIView animateWithDuration:0.1
                     animations:^{
                         self.topConstraint.constant = 30;
                     }];
}

- (void)keyboardDidHide: (NSNotification *) notif{
    [UIView animateWithDuration:0.1
                     animations:^{
                         self.topConstraint.constant = 120;
                     }];
}

@end
