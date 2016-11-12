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
            self.currentInput.actualData =[ NSString stringWithFormat:@"%@%ld",self.currentInput.actualData,(long)self.tempInput.entry];
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
    NSInteger saveEncounteredOp = 0;
    OperatorPriority priorityNeeded;
    if([self.stack count] == 1){
        self.currentInput = [InputData new];
        self.currentInput.type = (TypeOfInput)TYPE_NUMBER;
        self.currentInput.actualData =[ NSString stringWithFormat:@"%@%ld",@"",(long)self.tempInput.entry];
        InputData *data = self.stack[0];
        self.showData = data.actualData;
        [self updateOutput];
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
                tmp.actualData =[ NSString stringWithFormat:@"%f",secNum];
                tempStack[i-2] = tmp;
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
