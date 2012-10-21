//
//  NetMessageController.m
//  MyriadNet
//
//  Created by Ibokan on 12-10-16.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "NetMessageController.h"

@interface NetMessageController ()

@end

@implementation NetMessageController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    self.navigationController.navigationBar.hidden=YES;
    UIImageView *topView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    topView.userInteractionEnabled=YES;
    [topView setImage:[UIImage imageNamed:@"top.png"]];
    [self.view addSubview:topView];
    
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(105, 5, 100, 30)];
    titleLabel.textAlignment=UITextAlignmentCenter;
    titleLabel.backgroundColor=[UIColor clearColor];
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.text=@"域名资讯";
    [topView addSubview:titleLabel];

    
    UIButton *backBut=[[UIButton alloc]initWithFrame:CGRectMake(5, 5, 50, 30)];
    [backBut setBackgroundImage:[UIImage imageNamed:@"返回按钮.png"] forState:UIControlStateNormal];
    [backBut setTitle:@"主页" forState:UIControlStateNormal];
    backBut.titleLabel.font=[UIFont systemFontOfSize:12.0f];
    [backBut addTarget:self action:@selector(backhome) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:backBut];
  
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}



-(void)backhome
{
    
    [self dismissModalViewControllerAnimated:YES];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
