//
//  MainPageController.m
//  MyriadNet
//
//  Created by Ibokan on 12-10-16.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "MainPageController.h"
#import "NetMessageController.h"
#import "NetCheckController.h"
#import "NetBodyCheckController.h"
#import "NetMonitoringController.h"
#import "SetViewController.h"

@interface MainPageController ()

@end

@implementation MainPageController

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
    
    //背景图片
    UIImageView *backgroundImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 460)];
    backgroundImage.image=[UIImage imageNamed:@"background_home.png"];
    backgroundImage.userInteractionEnabled=YES;
    [self.view addSubview:backgroundImage];
    
    
    UIButton *butMessage=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [butMessage setFrame:CGRectMake(100, 200, 100, 40)];
    [butMessage addTarget:self action:@selector(message) forControlEvents:UIControlEventTouchUpInside];
    [butMessage setTitle:@"域名资讯" forState:UIControlStateNormal];
    [self.view addSubview:butMessage];
    
    
    UIButton *butCheck=[UIButton buttonWithType:UIButtonTypeRoundedRect];
     [butCheck setFrame:CGRectMake(100, 250, 100, 40)];
    [butCheck addTarget:self action:@selector(check) forControlEvents:UIControlEventTouchUpInside];
    [butCheck setTitle:@"域名查询" forState:UIControlStateNormal];
    [self.view addSubview:butCheck];

    UIButton *butBody=[UIButton buttonWithType:UIButtonTypeRoundedRect];
     [butBody setFrame:CGRectMake(100, 300, 100, 40)];
    [butBody addTarget:self action:@selector(body) forControlEvents:UIControlEventTouchUpInside];
    [butBody setTitle:@"域名体检" forState:UIControlStateNormal];
    [self.view addSubview:butBody];

    UIButton *butmon=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [butmon setFrame:CGRectMake(100, 350, 100, 40)];
    [butmon addTarget:self action:@selector(mon) forControlEvents:UIControlEventTouchUpInside];
    [butmon setTitle:@"域名监控" forState:UIControlStateNormal];
    [self.view addSubview:butmon];

    
    
    UIButton *butSet=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [butSet setFrame:CGRectMake(100, 400, 100, 40)];
    [butSet addTarget:self action:@selector(set) forControlEvents:UIControlEventTouchUpInside];
    [butSet setTitle:@"设置" forState:UIControlStateNormal];
    [self.view addSubview:butSet];

    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)message//资讯按钮
{
    NetMessageController *messageVC=[[NetMessageController alloc]init];
    UINavigationController *con=[[UINavigationController alloc]initWithRootViewController:messageVC];
    con.modalTransitionStyle=0;
    [self presentModalViewController:con animated:YES];
    [messageVC release];
    [con release];
    
}


-(void)check//查询
{
    NetCheckController *checkVC=[[NetCheckController alloc]init];
    UINavigationController *con=[[UINavigationController alloc]initWithRootViewController:checkVC];
    [con.navigationBar setBackgroundImage:[UIImage imageNamed:@"top.png"] forBarMetrics:UIBarMetricsDefault];
    [self presentModalViewController:con animated:YES];
    [checkVC release];
    [con release];

}


-(void)body//体检
{
    NetBodyCheckController *bodyVC=[[NetBodyCheckController alloc]init];
    UINavigationController *con=[[UINavigationController alloc]initWithRootViewController:bodyVC];
    [con.navigationBar setBackgroundImage:[UIImage imageNamed:@"top.png"] forBarMetrics:UIBarMetricsDefault];
    [self presentModalViewController:con animated:YES];
    [bodyVC release];
    [con release];

}


-(void)mon//监控
{
    NetMonitoringController *monVC=[[NetMonitoringController alloc]init];
    UINavigationController *con=[[UINavigationController alloc]initWithRootViewController:monVC];
    [con.navigationBar setBackgroundImage:[UIImage imageNamed:@"top.png"] forBarMetrics:UIBarMetricsDefault];
    [self presentModalViewController:con animated:YES];
    [monVC release];
    [con release];
}


-(void)set//设置
{
    SetViewController *setVC=[[SetViewController alloc]init];
    UINavigationController *con=[[UINavigationController alloc]initWithRootViewController:setVC];
    [con.navigationBar setBackgroundImage:[UIImage imageNamed:@"top.png"] forBarMetrics:UIBarMetricsDefault];
    [self presentModalViewController:con animated:YES];
    [setVC release];
    [con release];

}




- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
