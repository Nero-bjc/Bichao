//
//  NetworkTool.h
//  ProgrammerCommunity
//
//  Created by Bideveloper on 16/8/2.
//  Copyright © 2016年 BiJingChao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkTool : NSObject

+ (void)getDataWithParameters:(NSDictionary *)parameters completeBlock:(void (^)(BOOL, id))complete;
@end
