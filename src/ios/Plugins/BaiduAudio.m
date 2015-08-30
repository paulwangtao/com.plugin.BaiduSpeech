//
//  AppDelegate_BaiduAudio.m
//  
//
//  Created by paul Wang on 15-08-27.
//  mail to wangtaovipone@sina.com
//
#import "BDTTSSynthesizerDefine.h"
#import "BDTTSSynthesizer.h"
#import "BaiduAudio.h"




@implementation BaiduAudio


#pragma mark - internal function

- (void)initSynthesizer
{
    //读取配置文件
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"BaiduAudioConfig" ofType:@"plist"];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    NSString *appId = [data objectForKey:@"App_ID"];
    NSString *apiKey = [data objectForKey:@"API_Key"];
    NSString *secretKey = [data objectForKey:@"Secret_Key"];
    NSLog(@"appId:%@ apiKey:%@ secretKey:%@",appId,apiKey,secretKey);
    
    [BDTTSSynthesizer setLogLevel:BDS_LOG_VERBOSE];
    
    // 设置合成器代理
    [[BDTTSSynthesizer sharedInstance] setSynthesizerDelegate: self];
    
    // 在线相关设置
    //#error 请替换你申请的apikey和secretkey
    [[BDTTSSynthesizer sharedInstance] setApiKey:apiKey withSecretKey:secretKey];
    [[BDTTSSynthesizer sharedInstance] setTTSServerTimeOut:10];
    
    // 离线相关设置
    NSString *textDataFile =[[NSBundle mainBundle] pathForResource:@"bd_etts_text" ofType:@"dat"];
    NSString *speechDataFile =[[NSBundle mainBundle] pathForResource:@"bd_etts_speech_female" ofType:@"dat"];
    //#error 请替换你申请的app id
    [[BDTTSSynthesizer sharedInstance] setOfflineEngineLicense: nil withAppCode:appId];
    [[BDTTSSynthesizer sharedInstance] setOfflineEngineTextDatPath:textDataFile andSpeechData:speechDataFile];
    
    // 合成参数设置
    [[BDTTSSynthesizer sharedInstance] setSynthesizeParam: BDTTS_PARAM_VOLUME withValue: BDTTS_PARAM_VOLUME_MAX];
    //男生
     //[[BDTTSSynthesizer sharedInstance] setSynthesizeParam: BDTTS_PARAM_PERSON withValue: BDTTS_PARAM_PERSON_CH_MALE_MCAS];
       //BDTTS_SPEAK_PERSON_FEMALE

    // 加载合成引擎
    [[BDTTSSynthesizer sharedInstance] loadTTSEngine];
}
/**
* 初始化
*/
-(void) init:(CDVInvokedUrlCommand*)command{
 
    NSArray *arguments=command.arguments;
    
    NSLog(@"%@",arguments[0]);
    
    if (isLoad == NO) {
        [self initSynthesizer];
        isLoad = YES;
    }
    
}


-(void) error:(NSString *) errMsg{
    
    NSLog(@"BaiduAudio error:%@",errMsg);
}

/**
 *
 * 播放语音
 */


-(void)speech:(CDVInvokedUrlCommand*)command{
    
    if (isLoad == NO) {
        [self error:@"not init.Please init BaiduAudio."];
        return;
    }
    
    
    NSArray *arguments=command.arguments;
    
    NSString *msg=[arguments objectAtIndex:0];
    NSInteger ret = [[BDTTSSynthesizer sharedInstance] speak:msg];
    if (ret != BDTTS_ERR_SYNTH_OK) {
        
        NSLog(@"BaiduAudio error %@"  ,[BDTTSSynthesizer errorDescriptionForCode:ret]);
    }
}


@end
