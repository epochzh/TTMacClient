
//
//  DDHttpServer.m
//  Duoduo
//
//  Created by 独嘉 on 14-4-5.
//  Copyright (c) 2014年 zuoye. All rights reserved.
//

#import "DDHttpServer.h"
#import "DDHttpModule.h"
@implementation DDHttpServer
- (void)loginWithUserName:(NSString*)userName
                 password:(NSString*)password
                  success:(void(^)(id respone))success
                  failure:(void(^)(id error))failure
{
    DDHttpModule* module = [DDHttpModule shareInstance];
    NSMutableDictionary* dictParams = [NSMutableDictionary dictionary];
    [dictParams setObject:userName forKey:@"user_email"];
    [dictParams setObject:password forKey:@"user_pass"];
    [dictParams setObject:@"ooxx" forKey:@"macim"];
    [dictParams setObject:@"1.0" forKey:@"imclient"];
    [dictParams setObject:@"1" forKey:@"remember"];
    [module httpPostWithUri:@"user/zlogin/" params:dictParams
                    success:^(NSDictionary *result)
     {
         success(result);
     }
                    failure:^(StatusEntity *error)
     
     {
         failure(error.msg);
     }];

}
@end
