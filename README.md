BaiduAudio

mailTo: wangtaovipone@sina.com

功能:将文字转换成声音

1.基于:Cordova 集成 百度语音 

百度语音的下载地址是：http://yuyin.baidu.com/pz.html

sdk和License 需要自行下载

2.注意事项
加入build报找不到类库libbdtts.a 需要设定 "Other Linker Flags" under "Build Setting” 加入-lstdc++
Capablities — in AppAudio 打开
3.命令行
ionic plugin add /Users/wangtao/Developer/Cordova-plugin-Audio/cordova.plugins.BaiduSpeech 

4.修改BaiduAudioConfig.plist 的三个属性，这个是在百度语音申请的ID，也可以参照百度混音的api
<br>
<dict>
	<key>App_ID</key>
	<string>xxxxx</string>
	<key>API_Key</key>
	<string>xxxxx</string>
	<key>Secret_Key</key>
	<string>xxxxx</string>
</dict>


5.调用
//初始化
cordova.plugins.BaiduSpeech.init({person:"female"});
//发出声音
cordova.plugins.BaiduSpeech.speech(msg.value);