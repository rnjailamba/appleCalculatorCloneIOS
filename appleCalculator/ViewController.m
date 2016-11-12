//
//  ViewController.m
//  appleCalculator
//
//  Created by Mr Ruby on 12/11/16.
//  Copyright © 2016 Rnjai Lamba. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)setUpView{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
