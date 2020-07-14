//
//  CallJS.h
//  CubeMove
//
//  Created by MacBook on 2020/7/10.
//

#ifndef CallJS_h
#define CallJS_h
#import <Foundation/Foundation.h>
@interface CallJS
{
    
}
//调用节点下的函数
+(void)callJsCCNodeFunc_1:(NSString*) cmdStr;
+(void)callJsCCNodeFunc_3:(NSString*) funcNameStr withCmd:(NSString*) cmdStr withContent:(NSString*) contentStr;

//调用全局函数
+(void)callJsGlobalFunc_1:(NSString*) funcNameStr;
+(void)callJsGlobalFunc_2:(NSString*) funcNameStr withCmd:(NSString*) cmdStr;
+(void)callJsGlobalFunc_3:(NSString*) funcNameStr withCmd:(NSString*) cmdStr;
@end

#endif /* CallJS_h */
