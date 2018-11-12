//
//  BookInViewController.m
//  uchiha
//
//  Created by uchiha on 2017/8/14.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import "BookInViewController.h"
#import "BookInViewCell.h"
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
#import "BatterySenseViewController.h"
#import "ReactCocoaController.h"
#import "MultiscreenViewController.h"
@interface BookInViewController ()<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation BookInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNewView];
}

- (void)setNewView {
    // 1.流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 2.每个cell的尺寸
    layout.itemSize = CGSizeMake(90, 90);
    // 3.设置cell之间的水平间距
    layout.minimumInteritemSpacing = 5;
    // 4.设置cell之间的垂直间距
    layout.minimumLineSpacing = 5;
    // 5.设置所有cell组成的一个整体与屏幕（ViewController）四周距离
    layout.sectionInset = UIEdgeInsetsMake(layout.minimumLineSpacing, 0, 0, 0);
    
    UICollectionView *connect = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, iphoneScreenWidth, iphoneScreenHeight - 64) collectionViewLayout:layout];
    connect.delegate = self;
    connect.dataSource = self;
    [self.view addSubview:connect];
    [connect registerClass:[BookInViewCell class] forCellWithReuseIdentifier:@"myCell"];
    connect.backgroundColor = [UIColor whiteColor];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//cell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 40;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"myCell";
    BookInViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    if (indexPath.row==0) {
        cell.imgTitle.text=@"测试控件";
    }
    
    else if(indexPath.row==1) {
        cell.imgTitle.text=@"srollView点击事件";
    }
    else if(indexPath.row==2)
    {
        cell.imgTitle.text=@"自定义pickView与系统不同";
    }
    else if(indexPath.row==3)
    {
        cell.imgTitle.text=@"原生代码和h5混编";
        
    }
    else if (indexPath.row==4)
    {
        cell.imgTitle.text=@"获取硬件信息";
     }
    else if (indexPath.row == 5) {
        cell.imgTitle.text = @"MVVM + RAC";
    }
       else if (indexPath.row == 6)
    {
        cell.imgTitle.text = @"退出到登录页";
             }
    else if (indexPath.row == 7)
    {
        cell.imgTitle.text = @"简易动画";
        
    }
    else if (indexPath.row == 8)
    {
        cell.imgTitle.text = @"这里暂时空着";
        
    }
    else if (indexPath.row == 9)
    {
        cell.imgTitle.text = @"layer图层";
        
    }
    else if (indexPath.row == 10)
    {
        cell.imgTitle.text = @"编解码";
            }
    else if (indexPath.row == 11)
    {
        cell.imgTitle.text = @"NSRunLoop";
            }
    else if (indexPath.row == 12)
    {
        cell.imgTitle.text = @"简单动画";
        
    }
    else if (indexPath.row == 13)
    {
        cell.imgTitle.text = @"RunTime";
        return cell;
    }
    else if (indexPath.row == 14)
    {
        cell.imgTitle.text = @"scroolView测试";
        return cell;
    }
    else if (indexPath.row == 15)
    {
        cell.imgTitle.text = @"SDAutoLayout";
        return cell;
    }
    else if (indexPath.row == 16)
    {
        cell.imgTitle.text = @"多线程GCD";
        return cell;
    }
    else if (indexPath.row == 17)
    {
        cell.imgTitle.text = @"GCD单粒封装";
        return cell;
    }
    else if (indexPath.row == 18)
    {
       cell.imgTitle.text= @"暂时空着";
        return cell;
    }
    else if (indexPath.row == 19)
    {
       cell.imgTitle.text = @"数组测试";
        return cell;
    }
    else if (indexPath.row == 20)
    {
        cell.imgTitle.text = @"UILable的使用";
        return cell;
    }
    else if (indexPath.row == 21)
    {
       cell.imgTitle.text = @"通知的测试";
        return cell;
    }
    else if (indexPath.row == 22)
    {
        cell.imgTitle.text = @"数组排序";
        return cell;
    }
    else if (indexPath.row == 23)
    {
        cell.imgTitle.text = @"Quartz2D";
        return cell;
    }
    else if (indexPath.row == 24)
    {
       cell.imgTitle.text = @"数组内部排序";
        
    }
    else if (indexPath.row == 25)
    {
       cell.imgTitle.text = @"正则表达式";
        
    }
    else if (indexPath.row == 26)
    {
        cell.imgTitle.text= @"frame变化";
    }
    else if (indexPath.row == 27)
    {
       cell.imgTitle.text = @"传值应用";
             }
    else if (indexPath.row == 28)
    {
       cell.imgTitle.text= @"控制事件点击时间间隔";
 
    }
    else if (indexPath.row == 29)
    {
        cell.imgTitle.text = @"倒计时圆";
             }
    else if (indexPath.row == 30)
    {
       cell.imgTitle.text= @"dispatch_semaphore线程同步";
          }
    else if (indexPath.row == 31) {
       cell.imgTitle.text = @"可变字典运用";
    }
    else if (indexPath.row == 32) {
      cell.imgTitle.text = @"数组的深浅拷贝";
    }
    else if (indexPath.row == 33) {
       cell.imgTitle.text = @"瀑布流的封装";
    }
    else if (indexPath.row == 34) {
        cell.imgTitle.text = @"collectionView封装";
    } else if (indexPath.row == 35) {
        cell.imgTitle.text = @"动画组建";
    } else if (indexPath.row == 36) {
        cell.imgTitle.text = @"模仿锤子下拉刷新效果";
    } else if (indexPath.row == 37) {
        cell.imgTitle.text = @"美拍";
    } else if (indexPath.row == 38) {
        cell.imgTitle.text = @"二维码生成";
    } else if (indexPath.row == 39) {
        cell.imgTitle.text = @"手势解码";
    } else if (indexPath.row == 40) {
        cell.imgTitle.text = @"电池电量和代码感知";
    } else if (indexPath.row == 41) {
        cell.imgTitle.text = @"多屏幕";
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
   
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
        case 40:{
            BatterySenseViewController * battery = [BatterySenseViewController new];
            [self.navigationController pushViewController:battery animated:YES];
        }
            break;
        case 41:{
            MultiscreenViewController * multiscreen = [MultiscreenViewController new];
            [self.navigationController pushViewController:multiscreen animated:YES];
        }
            break;
            
        default:
            break;
    }

}
@end
