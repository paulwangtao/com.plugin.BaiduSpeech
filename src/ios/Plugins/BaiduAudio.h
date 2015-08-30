//
//  BaiduAudio.h
//  
//
//  Created by paul Wang on 15-08-27.
//  mail to wangtaovipone@sina.com

#import <Foundation/Foundation.h>

#import <Cordova/CDVPlugin.h>
#import "BDTTSSynthesizerDelegate.h"

@interface BaiduAudio : CDVPlugin <BDTTSSynthesizerDelegate>{

BOOL isLoad ;
    
}

-(void)init:(CDVInvokedUrlCommand*)command;

-(void)speech:(CDVInvokedUrlCommand*)command;

@end