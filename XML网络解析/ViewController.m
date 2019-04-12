//
//  ViewController.m
//  XML网络解析
//
//  Created by mac on 2018/4/2.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSXMLParserDelegate>
@property(nonatomic, strong) NSMutableArray *dataList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    

}

//获取网络数据
-(void)loadXML{
    //从web服务器加载数据
    //建立NSURL
    NSURL *url = [NSURL URLWithString:@"http://www.survey-expert.cn/test/alisoft/OfflineContinueUser.asp?userId=zhouhong&userPsd=dapchina&SC_ID=4&getFlag=1"];
    
    //建立NSURLRequest
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:1 timeoutInterval:5.0];
    
    //建立NSURLConnect的同步方法加载数据
    NSURLResponse *response = nil;
    NSError *error = nil;
    
    //同步加载数据
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    //实例化解析器,传入要解析的数据
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    //设置代理
    [parser setDelegate:self];
    //解析器解析,这个方法会调用代理里面的方法
    [parser parse];
    
}

-(void)parserDidStartDocument:(NSXMLParser *)parser{
    
    NSLog(@"开始解析");
    
    //懒加载实例化数据
    if (self.dataList == nil) {
        self.dataList = [NSMutableArray array];
    }else{
        [self.dataList removeAllObjects];
    }
    
    //中间字符串
 
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
