//
//  ViewController.m
//  LYPopoverView
//
//  Created by Polly polly on 8/17/19.
//  Copyright © 2019 zhangliyong. All rights reserved.
//

#import "ViewController.h"
#import "LYPopoverView/PopoverView.h"

@interface ViewController () < PopoverDatasource, PopoverDelegate >

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (@available(iOS 11.0, *)) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *menuImage = [UIImage imageNamed:@"plus"];
        [btn setImage:menuImage forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [btn addTarget:self
                action:@selector(touchMenuButton:)
      forControlEvents:UIControlEventTouchUpInside];

        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    }
    else {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                               target:self
                                                                                               action:@selector(touchMenuItem:)];
    }
}

- (void)touchMenuButton:(UIButton *)btn {
    PopoverView *popoverView = [PopoverView popoverView];
    popoverView.showShade = YES;
    popoverView.dataSource = self;
    popoverView.delegate = self;
    [popoverView showToView:btn];
}

- (void)touchMenuItem:(UIBarButtonItem *)item {
    PopoverView *popoverView = [PopoverView popoverView];
    popoverView.showShade = YES;
    popoverView.dataSource = self;
    popoverView.delegate = self;
    
    UIView *view = [item valueForKey:@"view"];
    [popoverView showToView:view];
}

#pragma mark - PopoverDatasource, PopoverDelegate

- (NSInteger)numberOfRowsInMenu:(PopoverView *)view {
    return 3;
}

- (PopoverAction *)actionForRow:(NSInteger)row {
    switch (row) {
        case 0:
            return [PopoverAction actionWithTitle:@"添加好友1"
                                          handler:nil];
        case 1:
            return [PopoverAction actionWithTitle:@"添加好友2"
                                          handler:nil];
        case 2:
            return [PopoverAction actionWithTitle:@"添加好友3"
                                          handler:nil];
        default:
            return nil;
    }
}

- (void)popover:(PopoverView *)view didSelectRow:(NSInteger)row {
    
}

@end
