var vlccontrol = require("vlc-control-node");
var fc = require("futurocube-serial");


vlccontrol.init({ip:'localhost',port:8080,user:'',password:'12345'});

fc.on('printf', function(data) {

	if (data == "pause")
	    vlccontrol.pause()
	if (data == "play")
	    vlccontrol.play()
	if (data == "volume+")
	  vlccontrol.setVolume(+25)
	if (data == "volume-")
	  vlccontrol.setvolume(-25)
	    

});

//vlc --intf http --http-host 10.1.1.156:9090
//https://github.com/gordosteam/vlc-control-node/blob/master/index.js
//https://www.npmjs.com/package/vlc-control-node
