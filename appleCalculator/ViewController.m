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

@property (weak, nonatomic) IBOutlet UIButton *seventButton;
@property (weak, nonatomic) IBOutlet UIButton *eight;
@property (weak, nonatomic) IBOutlet UIButton *nine;
@property (weak, nonatomic) IBOutlet UIButton *one;
@property (weak, nonatomic) IBOutlet UIButton *two;
@property (weak, nonatomic) IBOutlet UIButton *three;
@property (weak, nonatomic) IBOutlet UIButton *four;
@property (weak, nonatomic) IBOutlet UIButton *five;
@property (weak, nonatomic) IBOutlet UIButton *six;
@property (weak, nonatomic) IBOutlet UIButton *zero;
@property (weak, nonatomic) IBOutlet UIButton *ce;
@property (weak, nonatomic) IBOutlet UIButton *cl;
@property (weak, nonatomic) IBOutlet UIButton *op1;
@property (weak, nonatomic) IBOutlet UIButton *op2;
@property (weak, nonatomic) IBOutlet UIButton *op3;
@property (weak, nonatomic) IBOutlet UIButton *op4;
@property (weak, nonatomic) IBOutlet UIButton *op5;
@property (weak, nonatomic) IBOutlet UIButton *op6;
@property (weak, nonatomic) IBOutlet UIButton *dot;
@property (weak, nonatomic) IBOutlet UIButton *equal;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
    [self setUpData];
    [self updateOutput];
    [self buttonProps];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)buttonProps{
    [[self.seventButton layer] setBorderWidth:1.0f];
    [[self.seventButton layer] setBorderColor:[UIColor blackColor].CGColor];
    [[self.one layer] setBorderWidth:1.0f];
    [[self.one layer] setBorderColor:[UIColor blackColor].CGColor];
    [[self.two layer] setBorderWidth:1.0f];
    [[self.two layer] setBorderColor:[UIColor blackColor].CGColor];
    [[self.three layer] setBorderWidth:1.0f];
    [[self.three layer] setBorderColor:[UIColor blackColor].CGColor];
    [[self.four layer] setBorderWidth:1.0f];
    [[self.four layer] setBorderColor:[UIColor blackColor].CGColor];
    [[self.five layer] setBorderWidth:1.0f];
    [[self.five layer] setBorderColor:[UIColor blackColor].CGColor];
    [[self.six layer] setBorderWidth:1.0f];
    [[self.six layer] setBorderColor:[UIColor blackColor].CGColor];
    [[self.seventButton layer] setBorderWidth:1.0f];
    [[self.seventButton layer] setBorderColor:[UIColor blackColor].CGColor];
    [[self.eight layer] setBorderWidth:1.0f];
    [[self.eight layer] setBorderColor:[UIColor blackColor].CGColor];
    [[self.nine layer] setBorderWidth:1.0f];
    [[self.nine layer] setBorderColor:[UIColor blackColor].CGColor];
    [[self.zero layer] setBorderWidth:1.0f];
    [[self.zero layer] setBorderColor:[UIColor blackColor].CGColor];
    [[self.ce layer] setBorderWidth:1.0f];
    [[self.ce layer] setBorderColor:[UIColor blackColor].CGColor];
    [[self.cl layer] setBorderWidth:1.0f];
    [[self.cl layer] setBorderColor:[UIColor blackColor].CGColor];
    [[self.op1 layer] setBorderWidth:1.0f];
    [[self.op1 layer] setBorderColor:[UIColor blackColor].CGColor];
    [[self.op2 layer] setBorderWidth:1.0f];
    [[self.op2 layer] setBorderColor:[UIColor blackColor].CGColor];
    [[self.op3 layer] setBorderWidth:1.0f];
    [[self.op3 layer] setBorderColor:[UIColor blackColor].CGColor];
    [[self.op4 layer] setBorderWidth:1.0f];
    [[self.op4 layer] setBorderColor:[UIColor blackColor].CGColor];
    [[self.op5 layer] setBorderWidth:1.0f];
    [[self.op5 layer] setBorderColor:[UIColor blackColor].CGColor];
    [[self.op6 layer] setBorderWidth:1.0f];
    [[self.op6 layer] setBorderColor:[UIColor blackColor].CGColor];
    [[self.dot layer] setBorderWidth:1.0f];
    [[self.dot layer] setBorderColor:[UIColor blackColor].CGColor];
    [[self.equal layer] setBorderWidth:1.0f];
    [[self.equal layer] setBorderColor:[UIColor blackColor].CGColor];
    


}

-(void)setUpView{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)setUpData{
    
    self.showData = @"0";
    
    self.currentInput = [[InputData alloc]init];
    self.currentInput.type = (TypeOfInput)TYPE_EMPTY;
    self.currentInput.actualData = @"";//concatenated result

    self.prevInput = [InputData new];
    self.prevInput.type = (TypeOfInput)TYPE_EMPTY;
    self.prevInput.actualData = @"";//concatenated result
    
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
        case 4:
            NSLog(@"TYPE_EMPTY");
            //concatenate
            self.currentInput.type = (TypeOfInput)TYPE_NUMBER;
            if(self.tempInput.entry != 10){
                self.currentInput.actualData =[ NSString stringWithFormat:@"%@%ld",self.currentInput.actualData,(long)self.tempInput.entry];

            }
            else{
                self.currentInput.actualData =[ NSString stringWithFormat:@"%@%@",self.currentInput.actualData,@"."];

            }
            self.showData = self.currentInput.actualData;
            [self updateOutput];
            break;
        case 2:
            NSLog(@"TYPE_EDIT");
            break;
        case 3:
            NSLog(@"TYPE_OPERATION");
            self.currentInput = [InputData new];
            self.currentInput.type = (TypeOfInput)TYPE_NUMBER;
            self.currentInput.actualData =[ NSString stringWithFormat:@"%@%ld",@"",(long)self.tempInput.entry];
            self.showData = self.currentInput.actualData;
            [self updateOutput];
            break;
            
        default:
            break;
    }
}

-(void)emptyArray{
    [self.stack removeAllObjects];
}

-(void)handleEdit{
    switch (self.tempInput.entry) {
        case 1:
            NSLog(@"CE clickedd");
            if(self.currentInput.type == (TypeOfInput)TYPE_NUMBER){
                if(self.currentInput.actualData.length != 1){
                    self.currentInput.actualData = [self.currentInput.actualData substringToIndex:self.currentInput.actualData.length - 1];
                    self.showData = self.currentInput.actualData;
                    [self updateOutput];
                }
                else{
                    [self setUpData];
                    [self updateOutput];
                }
            }
            break;
        case 2:
            NSLog(@"CL clickedd");
            [self setUpData];
            [self updateOutput];
            break;
            
        default:
            break;
    }
}
-(void)printStack{
    for(InputData *data in self.stack){
        NSLog(@"%ld %@ %ld",(long)data.type,data.actualData,(long)data.entry);
    }
}

-(void)sanitiseStack{
    
}

-(BOOL)findOperationTypeInStack:(OperatorPriority)priority{
//    The ^ operator must be evaluated first, then the * / and % operators must be evaluated second before the + and – operators are evaluated third.
    if(priority == PRIORITY_POWER){
        for(InputData *data in self.stack){
            NSLog(@"%ld %@ %ld",(long)data.type,data.actualData,(long)data.entry);
            if(data.type == TYPE_OPERATION){
                if(data.entry == 3)
                    return true;
            }
        }
    }
    else if (priority == PRIORITY_TWO){
        for(InputData *data in self.stack){
            NSLog(@"%ld %@ %ld",(long)data.type,data.actualData,(long)data.entry);
            if(data.type == TYPE_OPERATION){
                if(data.entry == 1 || data.entry == 2 || data.entry == 4)
                    return true;
            }
        }
    }
    else if (priority == PRIORITY_THREE){
        for(InputData *data in self.stack){
            NSLog(@"%ld %@ %ld",(long)data.type,data.actualData,(long)data.entry);
            if(data.type == TYPE_OPERATION){
                if(data.entry == 5 || data.entry == 6)
                    return true;
            }
        }
    }
    return false;
    
}

-(void)evaluateStack{
    NSInteger i = 0;
    CGFloat firstNum = 0.0, secNum;
    BOOL encounteredOp = false;
    BOOL jobDone = false;
    NSInteger saveEncounteredOp = 0;
    OperatorPriority priorityNeeded;
    if([self.stack count] == 1){
        InputData *data = self.stack[0];
        self.showData = data.actualData;
        [self updateOutput];
        [self printStack];
        [self emptyArray];
        return;
    }
    
    if([self findOperationTypeInStack:PRIORITY_POWER]){
        priorityNeeded = PRIORITY_POWER;
    }
    else if ([self findOperationTypeInStack:PRIORITY_TWO]){
        priorityNeeded = PRIORITY_TWO;
    }
    else{
        priorityNeeded = PRIORITY_THREE;

    }
    NSMutableArray *tempStack = [NSMutableArray new];
    for(InputData *data in self.stack){
        NSLog(@"%ld %@ %ld",(long)data.type,data.actualData,(long)data.entry);
        [tempStack addObject:data];
        
        if(jobDone == false){
            if(encounteredOp == false){
                if(data.type == TYPE_NUMBER){
                    if(encounteredOp == false){
                        firstNum = [data.actualData floatValue];
                    }
                }
                else if(data.type == TYPE_OPERATION){
                    if(priorityNeeded == PRIORITY_POWER){
                        if(data.entry == 3){
                            encounteredOp = true;
                            saveEncounteredOp = data.entry;
                        }
                    }
                    if(priorityNeeded == PRIORITY_TWO){
                        if(data.entry == 1 || data.entry == 2 || data.entry == 4){
                            encounteredOp = true;
                            saveEncounteredOp = data.entry;
                        }
                    }
                    if(priorityNeeded == PRIORITY_THREE){
                        if(data.entry == 5 || data.entry == 6){
                            encounteredOp = true;
                            saveEncounteredOp = data.entry;
                        }
                    }
                }
                
            }
            else{
                if(data.type == TYPE_NUMBER){
                    secNum = [data.actualData floatValue];
                    [tempStack removeObjectAtIndex:i];
                    [tempStack removeObjectAtIndex:i-1];
                    switch (saveEncounteredOp) {
                        case 1:
                            NSLog(@"%% clicked");
                            secNum = firstNum/secNum;
                            break;
                        case 2:
                            NSLog(@"/ clicked");
                            secNum = firstNum/secNum;
                            break;
                        case 3:
                            NSLog(@"^ clicked");
                            secNum = powf(firstNum, secNum);
                            break;
                        case 4:
                            NSLog(@"* clicked");
                            secNum = firstNum*secNum;
                            
                            break;
                        case 5:
                            NSLog(@"- clicked");
                            secNum = firstNum-secNum;
                            break;
                        case 6:
                            NSLog(@"+ clicked");
                            secNum = firstNum+secNum;
                            break;
                            
                        default:
                            break;
                    }
                    InputData *tmp = [InputData new];
                    tmp.type = (TypeOfInput)TYPE_NUMBER;
                    if(secNum == floorf(secNum)){
                        tmp.actualData =[ NSString stringWithFormat:@"%ld",(long)(secNum)];
                    }
                    else{
                        tmp.actualData =[ NSString stringWithFormat:@"%f",secNum];
                    }
                    tempStack[i-2] = tmp;
                    jobDone = true;
                    self.currentInput = tmp;
                }
            }
        }

        ++i;
        
    }
    self.stack = tempStack;
    [self evaluateStack];
}

-(void)handleOperation{
    switch (self.currentInput.type) {
        case 1:
            NSLog(@"TYPE_NUMBER");
            [self.stack addObject:self.currentInput];//add number to stack
            self.currentInput = [InputData new];
            self.currentInput.type =  self.tempInput.type;
            self.currentInput.entry = self.tempInput.entry;
            [self printStack];
            if(self.tempInput.entry == 7){ // equals to
                [self evaluateStack];
            }
            else{
                [self.stack addObject:self.currentInput];//add operation to stack
            }
            break;
        case 2:
            NSLog(@"TYPE_EDIT");
            break;
        case 3:
            NSLog(@"TYPE_OPERATION");
            if(self.tempInput.entry == 7){ // equals to
                [self evaluateStack];
            }
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
        case 7:
            NSLog(@"= clicked");
            break;
            
        default:
            break;
    }
    self.tempInput.type = (TypeOfInput)TYPE_OPERATION;
    self.tempInput.entry = i;
    [self handleLogic];

}


@end
