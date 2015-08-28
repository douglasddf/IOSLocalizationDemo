//
//  ViewController.m
//  LocalizationDemo
//
//  Created by Douglas Frari on 7/23/15.
//  Copyright (c) 2015 Douglas Frari. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // internacionalizar programaticamente
    
    self.title = NSLocalizedString(@"MyTitle", nil);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
