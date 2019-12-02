import QtQuick 2.0
Item{

    property variant imgsReady:pt0

    property variant imgsLoading:pt0

    function push(message){
        var obj = JSON.parse(message)

        imgsLoading.cpu.source = 'data:' + obj.cpu
        imgsLoading.mem.source = 'data:' + obj.mem
        imgsLoading.disk.source = 'data:' + obj.disk
        imgsLoading.net.source = 'data:' + obj.net

    }

    PreloadingTextures{id:pt0;onReadyChanged:{
        if(ready){
            imgsReady=pt0
            imgsLoading=pt1
        }
    }}

    PreloadingTextures{id:pt1;onReadyChanged:{
        if(ready){
            imgsReady=pt1
            imgsLoading=pt0
        }
    }}

}
