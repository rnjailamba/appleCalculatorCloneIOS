//
//  ViewController.m
//  appleCalculator
//
//  Created by Mr Ruby on 12/11/16.
//  Copyright © 2016 Rnjai Lamba. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

- (IBAction)numberClicked:(id)sender;
- (IBAction)editorClicked:(id)sender;
- (IBAction)opertatorClicked:(id)sender;
@property (nonatomic) InputData *currentInput;
@property (nonatomic) InputData *prevInput;
@property (nonatomic) InputData *tempInput;
@property (nonatomic) NSString *showData;
@property (weak, nonatomic) IBOutlet UITextField *textDisplay;
@property (nonatomic) NSMutableArray *stack;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
    [self setUpData];
    [self updateOutput];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)setUpView{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)setUpData{
    
    self.showData = @"0";
    
    self.currentInput = [[InputData alloc]init];
    self.currentInput.type = (TypeOfInput)TYPE_EMPTY;
    self.currentInput.entry = -1;

    self.prevInput = [InputData new];
    self.prevInput.type = (TypeOfInput)TYPE_EMPTY;
    self.prevInput.entry = -1;
    
    self.tempInput = [InputData new];
    self.tempInput.type = (TypeOfInput)TYPE_EMPTY;
    self.tempInput.entry = -1;
    
    self.stack = [NSMutableArray new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)numberClicked:(id)sender {
    NSInteger i = [sender tag];
    switch (i) {
        case 0:
            NSLog(@"0 clicked");
            break;
        case 1:
            NSLog(@"1 clicked");
            break;
        case 2:
            NSLog(@"2 clicked");
            break;
        case 3:
            NSLog(@"3 clicked");
            break;
        case 4:
            NSLog(@"4 clicked");
            break;
        case 5:
            NSLog(@"5 clicked");
            break;
        case 6:
            NSLog(@"6 clicked");
            break;
        case 7:
            NSLog(@"7 clicked");
            break;
        case 8:
            NSLog(@"8 clicked");
            break;
        case 9:
            NSLog(@"9 clicked");
            break;
        case 10:
            NSLog(@". clicked");
            break;
            
        default:
            break;
    }
    self.tempInput.type = (TypeOfInput)TYPE_NUMBER;
    self.tempInput.entry = i;
    [self handleLogic];
    
}

-(void)handleLogic{
    switch (self.tempInput.type) {
        case 1:
            NSLog(@"TYPE_NUMBER");
            [self handleNumber];
            break;
        case 2:
            NSLog(@"TYPE_EDIT");
            [self handleEdit];
            break;
        case 3:
            NSLog(@"TYPE_OPERATION");
            [self handleOperation];
            break;
        case 4:
            NSLog(@"TYPE_EMPTY");
            break;
            
        default:
            break;
    }
}

-(void)handleNumber{
    switch (self.currentInput.type) {
        case 1:
            NSLog(@"TYPE_NUMBER");
            break;
        case 2:
            NSLog(@"TYPE_EDIT");
            break;
        case 3:
            NSLog(@"TYPE_OPERATION");
            break;
        case 4:
            NSLog(@"TYPE_EMPTY");
            break;
            
        default:
            break;
    }
}

-(void)handleEdit{

}

-(void)handleOperation{
    switch (self.currentInput.type) {
        case 1:
            NSLog(@"TYPE_NUMBER");
            break;
        case 2:
            NSLog(@"TYPE_EDIT");
            break;
        case 3:
            NSLog(@"TYPE_OPERATION");
            break;
        case 4:
            NSLog(@"TYPE_EMPTY");
            break;
            
        default:
            break;
    }
}

-(void)updateOutput{
    self.textDisplay.text = self.showData;

}


- (IBAction)editorClicked:(id)sender {
    NSInteger i = [sender tag];
    switch (i) {
        case 1:
            NSLog(@"CE clicked");
            break;
        case 2:
            NSLog(@"CL clicked");
            break;
            
        default:
            break;
    }
    self.tempInput.type = (TypeOfInput)TYPE_EDIT;
    self.tempInput.entry = i;
    [self handleLogic];
}

- (IBAction)opertatorClicked:(id)sender{
    NSInteger i = [sender tag];
    switch (i) {
        case 1:
            NSLog(@"%% clicked");
            break;
        case 2:
            NSLog(@"/ clicked");
            break;
        case 3:
            NSLog(@"^ clicked");
            break;
        case 4:
            NSLog(@"* clicked");
            break;
        case 5:
            NSLog(@"- clicked");
            break;
        case 6:
            NSLog(@"+ clicked");
            break;
            
        default:
            break;
    }
    self.tempInput.type = (TypeOfInput)TYPE_OPERATION;
    self.tempInput.entry = i;
    [self handleLogic];

}


@end
