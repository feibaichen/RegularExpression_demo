# RegularExpression_Demo
 
 
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
