//
//  ViewController.m
//  TwoUITableViewProject
//
//  Created by user on 2019/7/26.
//  Copyright © 2019 rxgzs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSMutableDictionary *dataDic;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc]initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    NSArray *A = [NSArray arrayWithObjects:@"app",@"apple",@"alex",@"alert",@"alright",@"at",@"addic",@"awake",@"action",@"active", nil];
    NSArray *B = [NSArray arrayWithObjects:@"belance",@"beyond",@"bell",@"bill",@"bet",@"bety",@"bright",@"beaty",@"beat",@"bite",@"bit",@"bake",@"blake",@"basket",@"basketball",@"ball",@"black",@"blue", nil];
    NSArray *C = [NSArray arrayWithObjects:@"cake",@"cat",@"cap",@"cook",@"cooki",@"cate",@"cell",@"certain",@"city",@"clabe",@"clab",@"copy",@"cry", nil];
    NSArray *D = [NSArray arrayWithObjects:@"dirty",@"del",@"directly",@"dry",@"dull",@"delly",@"dute", nil];
    NSArray *E = [NSArray arrayWithObjects:@"elphance",@"every",@"else",@"emperty", nil];
    NSArray *F = [NSArray arrayWithObjects:@"fly",@"flash",@"flag",@"fate",@"felt",@"fill",@"fell",@"fall",@"font",@"fake",@"flour",@"ferver",@"fetech", nil];
    NSArray *G = [NSArray arrayWithObjects:@"girl",@"gipe",@"grap",@"gray",@"gay",@"gita",@"git",@"get",@"great",@"glass",@"glasses",@"good",@"google", nil];
    dataDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:A,@"A",B,@"B",C,@"C",D,@"D",E,@"E",F,@"F",G,@"G", nil];
}

//指引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return [[dataDic allKeys] sortedArrayUsingSelector:@selector(compare:)];
}

//分区数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return [dataDic allKeys].count;
}

//行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray *keys = [[dataDic allKeys] sortedArrayUsingSelector:@selector(compare:)];
    NSString *key = keys[section];
    NSArray *array = dataDic[key];
    return [array count];
}

//展示分区内容
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *keys = [[dataDic allKeys] sortedArrayUsingSelector:@selector(compare:)];
    NSString *key = keys[section];
    return key;
}

//展示内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *indentify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentify];
    }
    NSArray *keys = [[dataDic allKeys] sortedArrayUsingSelector:@selector(compare:)];
    NSString *key = keys[indexPath.section];
    NSArray *array = dataDic[key];
    NSString *content = array[indexPath.row];
    cell.textLabel.text = content;
    return cell;
}
@end
