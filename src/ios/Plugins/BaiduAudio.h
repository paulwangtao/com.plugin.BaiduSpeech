//
//
//AppDelegate+BaiduAudio.h
//
//

#import <Foundation/Foundation.h>

#import <Cordova/CDVPlugin.h>
#import "BDTTSSynthesizerDelegate.h"

@interface BaiduAudio : CDVPlugin <BDTTSSynthesizerDelegate>{

BOOL isLoad ;
    
}

-(void)init:(CDVInvokedUrlCommand*)command;

-(void)speech:(CDVInvokedUrlCommand*)command;

@end