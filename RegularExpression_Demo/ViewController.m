//
//  ViewController.m
//  RegularExpression_Demo
//
//  Created by Karl on 2018/6/7.
//  Copyright © 2018 Derek. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //正则表达式1
    //[self RegularExpression1];
    
    //正则表达式2
    //[self RegularExpression2];
    
    //正则表达式3
    //[self RegularExpression3];
}
-(void)RegularExpression1{
    
    //需要被筛选的字符串
    NSString *str = @"#今日要闻#[偷笑] http://asd.fdfs.2ee/aas/1e @sdf[test] #你确定#@rain李23: @张三[挖鼻屎]m123m";
    //表情正则表达式
    //  \\u4e00-\\u9fa5 代表unicode字符
    NSString *emopattern = @"\\[[a-zA-Z\\u4e00-\\u9fa5]+\\]";
    //@正则表达式
    NSString *atpattern = @"@[0-9a-zA-Z\\u4e00-\\u9fa5]+";
    //#...#正则表达式
    NSString *toppattern = @"#[0-9a-zA-Z\\u4e00-\\u9fa5]+#";
    //url正则表达式
    NSString *urlpattern = @"\\b(([\\w-]+://?|www[.])[^\\s()<>]+(?:\\([\\w\\d]+\\)|([^[:punct:]\\s]|/)))";
    //设定总的正则表达式
    NSString *pattern = [NSString stringWithFormat:@"%@|%@|%@|%@",emopattern,atpattern,toppattern,urlpattern];
    //根据正则表达式设定OC规则
    NSRegularExpression *regular = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    //获取匹配结果
    NSArray *results = [regular matchesInString:str options:0 range:NSMakeRange(0, str.length)];
    //NSLog(@"%@",results);
    //遍历结果
    for (NSTextCheckingResult *result in results) {
        NSLog(@"RegularExpression1 %@ %@",NSStringFromRange(result.range),[str substringWithRange:result.range]);
    }
}
-(void)RegularExpression2{
    
    //需要被筛选的字符串
    NSString *str = @"jkljo@&*^&%ijewerdf[rewrwrcssd34324]45df2[342]@343 http s34f";
    NSString *pattern=@"\\[[A-Za-z0-9]+\\]";//[A-Za-z0-9]英文和数字
    //根据正则表达式设定OC规则
    NSRegularExpression *regular = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    //获取匹配结果
    NSArray *results = [regular matchesInString:str options:0 range:NSMakeRange(0, str.length)];
    //遍历结果
    for (NSTextCheckingResult *result in results) {
        NSLog(@"RegularExpression2 = %@ %@",NSStringFromRange(result.range),[str substringWithRange:result.range]);
    }
}
-(void)RegularExpression3{
    
    //安卓原始正则--------
    //    (\$普通表情\[[0-9]+\]\$)
    //    (\$emoji表情\[)[0-9]+(\]\$)
    //    (\$QQ表情\[[0-9]+\]\$)
    //-------------
    //    iOS端的正则 --要去掉括号”（ ）“，对于需要查找的特殊字符要加\\
    //
    //    \\$普通表情\\[[0-9]+\\]\\$
    //
    //    \\$QQ表情\\[[0-9]+\\]\\$
    //
    //    \\$emoji表情\\[[0-9]+\\]\\$
    //需要被筛选的字符串
    NSString *str = @"就是这么好吃$普通表情[2]$全家人都爱！\n再囤一波$emoji表情[43]$拍2份$QQ表情[423]$共发5斤\n$普通表情[120]$券后价【26.9】\n煮熟吃上一口，糯糯甜甜的$emoji表情[55]$";
    NSString *pattern1=@"\\$普通表情\\[[0-9]+\\]\\$";
    NSString *pattern2=@"\\$emoji表情\\[[0-9]+\\]\\$";
    NSString *pattern3=@"\\$QQ表情\\[[0-9]+\\]\\$";
    //根据正则表达式设定OC规则
    NSRegularExpression *regular1 = [[NSRegularExpression alloc] initWithPattern:pattern1 options:NSRegularExpressionCaseInsensitive error:nil];
    //获取匹配结果
    NSArray *results1 = [regular1 matchesInString:str options:0 range:NSMakeRange(0, str.length)];
    //遍历结果
    for (NSTextCheckingResult *result in results1) {
        NSLog(@"RegularExpression3 pattern1 = %@ %@",NSStringFromRange(result.range),[str substringWithRange:result.range]);
    }
    
    
    //根据正则表达式设定OC规则
    NSRegularExpression *regular2 = [[NSRegularExpression alloc] initWithPattern:pattern2 options:NSRegularExpressionCaseInsensitive error:nil];
    //获取匹配结果
    NSArray *results2 = [regular2 matchesInString:str options:0 range:NSMakeRange(0, str.length)];
    //遍历结果
    for (NSTextCheckingResult *result in results2) {
        NSLog(@"RegularExpression3 pattern2 = %@ %@",NSStringFromRange(result.range),[str substringWithRange:result.range]);
    }
    
    
    //根据正则表达式设定OC规则
    NSRegularExpression *regular3 = [[NSRegularExpression alloc] initWithPattern:pattern3 options:NSRegularExpressionCaseInsensitive error:nil];
    //获取匹配结果
    NSArray *results3 = [regular3 matchesInString:str options:0 range:NSMakeRange(0, str.length)];
    //遍历结果
    for (NSTextCheckingResult *result in results3) {
        NSLog(@"RegularExpression3 pattern3 = %@ %@",NSStringFromRange(result.range),[str substringWithRange:result.range]);
    }
}

@end
