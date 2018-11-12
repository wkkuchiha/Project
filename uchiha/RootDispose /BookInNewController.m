
//
//  BookInNewController.m
//  uchiha
//
//  Created by uchiha on 2018/7/11.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "BookInNewController.h"
#import "Masonry.h"
#import "UIView+Extension.h"
#import "SecondViewController.h"
#import "SecViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"

#import "SevenViewController.h"
#import "EightViewController.h"

#import "TenViewController.h"
#import "ElevenViewController.h"
#import "TwelveViewController.h"
#import "ThirteenViewController.h"
#import "FourTeenViewController.h"
#import "FifteenViewController.h"
#import "SixTeenViewController.h"
#import "SevenTeenViewController.h"
#import "EightTeenController.h"
#import "NineTeenViewController.h"


#import "TwentyTwoViewController.h"
#import "TwentyThreeViewController.h"
#import "TwentyFourViewController.h"
#import "TwentyFiveViewController.h"
#import "TwentySixViewController.h"
#import "TwentyEightViewController.h"
#import "TwentyNineViewController.h"
#import "ThirtyViewController.h"
#import "ThirtyOneViewControler.h"

#import "ThirtyThreeViewController.h"

#import "ThirtyFiveViewController.h"
#import "AnimationViewController.h"
#import "RefreshViewController.h"
#import "BeautyPhotographController.h"
#import "QRCodeGenerateController.h"
#import "FireflyGesturePasswordViewController.h"
#import "EasyAnimalController.h"

#import "ReactCocoaController.h"
#import "RACViewController.h"
#import "DataSharingViewController.h"
@interface BookInNewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tbView;
@property(nonatomic,copy)NSArray *dataSource;
@end

@implementation BookInNewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNewView];
}

- (void)setNewView {
    _tbView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tbView.delegate = self;
    _tbView.dataSource = self;
    [self.view addSubview:_tbView];
    
    _dataSource = [NSArray array];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString * identifier = @"mycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (indexPath.row==0) {
        cell.textLabel.text=@"测试控件";
    }
    
    else if(indexPath.row==1) {
        cell.textLabel.text=@"srollView点击事件";
    }
    else if(indexPath.row==2)
    {
        cell.textLabel.text=@"自定义pickView与系统不同";
    }
    else if(indexPath.row==3)
    {
        cell.textLabel.text=@"原生代码和h5混编";
        
    }
    else if (indexPath.row==4)
    {
        cell.textLabel.text=@"获取硬件信息";
    }
    else if (indexPath.row == 5) {
        cell.textLabel.text = @"MVVM + RAC";
    }
    else if (indexPath.row == 6)
    {
        cell.textLabel.text = @"退出到登录页";
    }
    else if (indexPath.row == 7)
    {
        cell.textLabel.text = @"简易动画";
        
    }
    else if (indexPath.row == 8)
    {
        cell.textLabel.text = @"ReactiveCocoa交互";
        
    }
    else if (indexPath.row == 9)
    {
        cell.textLabel.text = @"layer图层";
        
    }
    else if (indexPath.row == 10)
    {
        cell.textLabel.text = @"编解码";
    }
    else if (indexPath.row == 11)
    {
        cell.textLabel.text = @"NSRunLoop";
    }
    else if (indexPath.row == 12)
    {
        cell.textLabel.text = @"简单动画";
    }
    else if (indexPath.row == 13)
    {
        cell.textLabel.text = @"RunTime";
        return cell;
    }
    else if (indexPath.row == 14)
    {
        cell.textLabel.text = @"scroolView测试";
        return cell;
    }
    else if (indexPath.row == 15)
    {
        cell.textLabel.text = @"SDAutoLayout";
        return cell;
    }
    else if (indexPath.row == 16)
    {
        cell.textLabel.text = @"多线程GCD";
        return cell;
    }
    else if (indexPath.row == 17)
    {
        cell.textLabel.text = @"GCD单粒封装";
        return cell;
    }
    else if (indexPath.row == 18)
    {
        cell.textLabel.text= @"暂时空着";
        return cell;
    }
    else if (indexPath.row == 19)
    {
        cell.textLabel.text = @"数组测试";
        return cell;
    }
    else if (indexPath.row == 20)
    {
        cell.textLabel.text = @"UILable的使用";
        return cell;
    }
    else if (indexPath.row == 21)
    {
        cell.textLabel.text = @"通知的测试";
        return cell;
    }
    else if (indexPath.row == 22)
    {
        cell.textLabel.text = @"数组排序";
        return cell;
    }
    else if (indexPath.row == 23)
    {
        cell.textLabel.text = @"Quartz2D";
        return cell;
    }
    else if (indexPath.row == 24)
    {
        cell.textLabel.text = @"数组内部排序";
        
    }
    else if (indexPath.row == 25)
    {
        cell.textLabel.text = @"正则表达式";
    }
    else if (indexPath.row == 26)
    {
        cell.textLabel.text= @"frame变化";
    }
    else if (indexPath.row == 27)
    {
        cell.textLabel.text = @"传值应用";
    }
    else if (indexPath.row == 28)
    {
        cell.textLabel.text= @"控制事件点击时间间隔";
        
    }
    else if (indexPath.row == 29)
    {
        cell.textLabel.text = @"倒计时圆";
    }
    else if (indexPath.row == 30)
    {
        cell.textLabel.text= @"dispatch_semaphore线程同步";
    }
    else if (indexPath.row == 31) {
        cell.textLabel.text = @"可变字典运用";
    }
    else if (indexPath.row == 32) {
        cell.textLabel.text = @"数组的深浅拷贝";
    }
    else if (indexPath.row == 33) {
        cell.textLabel.text = @"瀑布流的封装";
    }
    else if (indexPath.row == 34) {
        cell.textLabel.text = @"collectionView封装";
    } else if (indexPath.row == 35) {
        cell.textLabel.text = @"动画组建";
    } else if (indexPath.row == 36) {
        cell.textLabel.text = @"模仿锤子下拉刷新效果";
    } else if (indexPath.row == 37) {
        cell.textLabel.text = @"美拍";
    } else if (indexPath.row == 38) {
        cell.textLabel.text = @"二维码生成";
    } else if (indexPath.row == 39) {
        cell.textLabel.text = @"手势解码";
    } else if (indexPath.row == 40) {
        cell.textLabel.text = @"数据共享";
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            SecondViewController  *  secVc=[[SecondViewController  alloc]init];
            [self.navigationController  pushViewController:secVc animated:YES];
        }
            break;
        case 1:
        {
            SecViewController  *  secVc=[[SecViewController  alloc]init];
            //[self  presentViewController:secVc animated:YES completion:nil];
            [self.navigationController  pushViewController:secVc animated:NO];
        }
            break;
        case 2:
        {
            ThirdViewController  *  thirdVc=[[ThirdViewController alloc]init];
            //[self  presentViewController:thirdVc animated:NO completion:nil];
            [self.navigationController  pushViewController:thirdVc animated:YES];
            
        }
            break;
        case 3:
        {
            FourViewController  *  fourVc=[[FourViewController  alloc]init];
            [self.navigationController  pushViewController:fourVc animated:YES];
        }
            break;
            
        case 4:
        {
            FiveViewController  *  fiveVc=[[FiveViewController  alloc]init];
            [self.navigationController   pushViewController:fiveVc animated:YES];
        }
            break;
        case 5: {
            ReactCocoaController *rac = [ReactCocoaController new];
            [self.navigationController pushViewController:rac animated:NO];
        }
            break;
        case 6:
        {
            SevenViewController  * secvVc =[[SevenViewController alloc]init];
            [self.navigationController  pushViewController:secvVc animated:YES];
        }
            break;
        case 7: {
            EasyAnimalController *easyAnimal = [EasyAnimalController new];
            [self.navigationController pushViewController:easyAnimal animated:NO];
        }
            break;
        case 8:{
            RACViewController * rac = [RACViewController new];
            [self.navigationController pushViewController:rac animated:YES];
        }
            break;
        case 9:
        {
            TenViewController * nineVc = [[TenViewController  alloc]init];
            [self.navigationController  pushViewController:nineVc animated:YES];
        }
            break;
        case 10:
        {
            ElevenViewController * nineVc = [[ElevenViewController  alloc]init];
            [self.navigationController  pushViewController:nineVc animated:YES];
        }
            break;
        case 11:
        {
            TwelveViewController  * tweVc = [[TwelveViewController  alloc]init];
            [self.navigationController  pushViewController:tweVc animated:YES];
        }
            break;
        case 12:
        {
            ThirteenViewController  * tweVc = [[ThirteenViewController  alloc]init];
            [self.navigationController  pushViewController:tweVc animated:YES];
        }
            break;
        case 13:
        {
            FourTeenViewController  * foVc = [[FourTeenViewController  alloc]init];
            [self.navigationController  pushViewController:foVc animated:YES];
        }
            break;
        case 14:
        {
            FifteenViewController  * fifVc = [[FifteenViewController  alloc]init];
            [self.navigationController  pushViewController:fifVc animated:YES];
        }
            break;
        case 15:
        {
            SixTeenViewController  * sixTeenVc = [[SixTeenViewController  alloc]init];
            [self.navigationController  pushViewController:sixTeenVc animated:YES];
        }
            break;
        case 16:
        {
            SevenTeenViewController  * sevenTeenVc = [[SevenTeenViewController  alloc]init];
            [self.navigationController  pushViewController:sevenTeenVc animated:YES];
        }
            break;
        case 17:
        {
            EightTeenController  * eightTeenVc = [[EightTeenController  alloc]init];
            [self.navigationController  pushViewController:eightTeenVc animated:YES];
        }
            break;
        case 18:
        {
            NineTeenViewController  * nineTeenVc = [[NineTeenViewController  alloc]init];
            [self.navigationController  pushViewController:nineTeenVc animated:YES];
        }
            break;
            
        case 21:
        {
            TwentyTwoViewController  * twentyTwoVc = [[TwentyTwoViewController  alloc]init];
            [self.navigationController  pushViewController:twentyTwoVc animated:YES];
        }
            break;
        case 22:
        {
            TwentyThreeViewController* twentyThreeVc = [[TwentyThreeViewController  alloc]init];
            [self.navigationController  pushViewController:twentyThreeVc animated:YES];
        }
            break;
        case 23:
        {
            TwentyFourViewController* twentyFourVc = [[TwentyFourViewController  alloc]init];
            [self.navigationController  pushViewController:twentyFourVc animated:YES];
        }
            break;
        case 24:
        {
            TwentyFiveViewController* twentyFiveVc = [[TwentyFiveViewController  alloc]init];
            [self.navigationController  pushViewController:twentyFiveVc animated:YES];
        }
            break;
        case 25:
        {
            TwentySixViewController* twentySixVc = [[TwentySixViewController  alloc]init];
            [self.navigationController  pushViewController:twentySixVc animated:YES];
        }
            break;
        case 26:
        {
            
        }
            break;
        case 27:
        {
            TwentyEightViewController* twentyEightVc = [[TwentyEightViewController  alloc]init];
            [self.navigationController  pushViewController:twentyEightVc animated:YES];
        }
            break;
        case 28:
        {
            TwentyNineViewController* twentyNineVc = [[TwentyNineViewController  alloc]init];
            [self.navigationController  pushViewController:twentyNineVc animated:YES];
        }
            break;
        case 29:
        {
            ThirtyViewController* thirtyVc = [[ThirtyViewController  alloc]init];
            [self.navigationController  pushViewController:thirtyVc animated:YES];
        }
            break;
        case 30:
        {
            ThirtyOneViewControler* thirtyOneVc = [[ThirtyOneViewControler  alloc]init];
            [self.navigationController  pushViewController:thirtyOneVc animated:YES];
        }
            break;
        case 32:
        {
            ThirtyThreeViewController* thirtyThreeVc = [[ThirtyThreeViewController  alloc]init];
            [self.navigationController  pushViewController:thirtyThreeVc animated:YES];
        }
            break;
            
        case 34:
        {
            ThirtyFiveViewController* thirtyFiveVc = [[ThirtyFiveViewController  alloc]init];
            [self.navigationController  pushViewController:thirtyFiveVc animated:YES];
        }
            break;
        case 35: {
            AnimationViewController *animationView = [AnimationViewController new];
            [self.navigationController pushViewController:animationView animated:NO];
        }
            break;
        case 36:{
            RefreshViewController *refresh = [RefreshViewController new];
            [self.navigationController pushViewController:refresh animated:NO];
        }
            break;
        case 37:{
            BeautyPhotographController *beautyPotograp = [BeautyPhotographController new];
            [self.navigationController pushViewController:beautyPotograp animated:NO];
        }
            break;
        case 38:{
            QRCodeGenerateController *QRCode = [QRCodeGenerateController new];
            [self.navigationController pushViewController:QRCode animated:NO];
        }
            break;
        case 39:{
            FireflyGesturePasswordViewController *Gesture = [FireflyGesturePasswordViewController new];
            [self.navigationController pushViewController:Gesture animated:NO];
        }
            break;
        case 40: {
            DataSharingViewController * dataShare = [DataSharingViewController new];
            [self.navigationController pushViewController:dataShare animated:YES];
        }
            break;
            
        default:
            break;
    }
    
}
@end
