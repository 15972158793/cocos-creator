//
//  CallJS.m
//  CubeMove-mobile
//
//  Created by MacBook on 2020/7/10.
//


 
#import "cocos2d.h"
#import "CallJS.h"
// 这个必须导入，否则报错。
#include "cocos/scripting/js-bindings/jswrapper/SeApi.h"
//using namespace std;
 
@implementation CallJS
 
+(void)callJsCCNodeFunc_1:(NSString*) cmdStr{
    
    NSLog(@"-------callJsCCNodeFunc_1...");
    
    std::string param001 = [cmdStr UTF8String];
    
    // "cc.find('AppMain').getComponent('IOSCtrl').GetAward(\"%s\");", param001.c_str()
    // 可以理解为：调用 cc.find() 函数在场景中查找 AppMain 节点，在利用 getComponent() 函数获取该节点下 名为 IOSCtrl.ts 的脚本。最后调用 脚本中的成员函数 GetAward(),此函数有一个参数。
    std::string jsCallStr = cocos2d::StringUtils::format("cc.find('AdNode').getComponent('IOSCtrl').GetAward(\"%s\");", param001.c_str());
    NSLog(@"--------- jsCallStr = %s", jsCallStr.c_str());
    se::ScriptEngine::getInstance()->evalString(jsCallStr.c_str());
}

+(void)callJsCCNodeFunc_3:(NSString*) funcNameStr withCmd:(NSString*) cmdStr withContent:(NSString*) contentStr{
    
    NSLog(@"-------callJsCCNodeFunc_3...");
    
    std::string funcName = [funcNameStr UTF8String];
    std::string param001 = [cmdStr UTF8String];
    std::string param002 = [contentStr UTF8String];
 
    std::string jsCallStr = cocos2d::StringUtils::format("cc.find('AppMain').getComponent('IOSCtrl').%s(\"%s\",\"%s\");", funcName.c_str(),param001.c_str(),param002.c_str());
    
    NSLog(@"--------- jsCallStr = %s", jsCallStr.c_str());
    se::ScriptEngine::getInstance()->evalString(jsCallStr.c_str());
}

+(void)callJsGlobalFunc_1:(NSString*) funcNameStr{
    
    NSLog(@"-------callJsGlobalFunc_1...");
    std::string funcName = [funcNameStr UTF8String];
    std::string jsCallStr = cocos2d::StringUtils::format("%s();",funcName.c_str());
    NSLog(@"--------- jsCallStr = %s", jsCallStr.c_str());
    se::ScriptEngine::getInstance()->evalString(jsCallStr.c_str());
}

//一般采用这种
+(void)callJsGlobalFunc_2:(NSString*) funcNameStr withCmd:(NSString*) cmdStr{
    
    NSLog(@"-------callJsGlobalFunc_2...");
    
    std::string funcName = [funcNameStr UTF8String];
    std::string param001 = [cmdStr UTF8String];
    std::string jsCallStr = cocos2d::StringUtils::format("%s(\"%s\");",funcName.c_str(), param001.c_str());
    NSLog(@"--------- jsCallStr = %s", jsCallStr.c_str());
    se::ScriptEngine::getInstance()->evalString(jsCallStr.c_str());
}

 
+(void)callJsGlobalFunc_3:(NSString*) funcNameStr withCmd:(NSString*) cmdStr withContent:(NSString*) contentStr{
    NSLog(@"-------callJsGlobalFunc_3...");
    
    std::string funcName = [funcNameStr UTF8String];
    std::string param001 = [cmdStr UTF8String];
    std::string param002 = [contentStr UTF8String];
    std::string jsCallStr = cocos2d::StringUtils::format("%s(\"%s\",\"%s\");",funcName.c_str(), param001.c_str(),param002.c_str());
    NSLog(@"--------- jsCallStr = %s", jsCallStr.c_str());
//    ScriptingCore::getInstance()->evalString(jsCallStr.c_str());
    se::ScriptEngine::getInstance()->evalString(jsCallStr.c_str());
}
 
@end
