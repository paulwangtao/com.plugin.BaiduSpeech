
function BaiduSpeech(){

}


BaiduSpeech.prototype.call_native = function(name, args, callback){

    ret = cordova.exec(callback,this.error_callback,'BaiduSpeech',name,args);
    return ret;
}

BaiduSpeech.prototype.error_callback = function(msg){
    console.log("Javascript Callback Error: " + msg)
}


     BaiduSpeech.prototype.init =function(msg){
        console.log("baiduAudo init");
        return  this.call_native( "init",[msg],null);

     }
   

     BaiduSpeech.prototype.speech =function(msg){
        return  this.call_native( "speech",[msg],null);
     }
  
  module.exports= new BaiduSpeech();


