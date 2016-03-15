//
//  ViewController.m
//  BlockweakDemo
//
//  Created by summer on 16/3/15.
//  Copyright © 2016年 cn.exutech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __block int multiplier = 7;
    int (^myBlock)(int) = ^(int num) {
        multiplier ++;
        return num * multiplier;
    };
    NSLog(@"%d",myBlock(5));
    
    NSMutableArray *mArray = [NSMutableArray arrayWithObjects:@"a",@"b",@"abc",nil];
    NSMutableArray *mArrayCount = [NSMutableArray arrayWithCapacity:1];
    
    [mArray enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id obj,NSUInteger idx,BOOL *stop){
        [mArrayCount addObject:[NSNumber numberWithInt:[obj length]]];
    }];
    NSLog(@"%@",mArrayCount);
    
    __block int a = 1;//如何我们
    int (^backValue)(int) = ^(int num) {
        return num + a;
    };
    
    a += 1;
    
    int b = backValue(1);
    NSLog(@"b-->%d",b);
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 300, 300, 40)];
    label.text = @"block作用域赋值";
    void (^backddValue)(NSString *) = ^(NSString *str) {
        label.text = str;
    };
    backddValue(@"block作用域内赋值");
    [self.view addSubview:label];
    
    label = [[UILabel alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
