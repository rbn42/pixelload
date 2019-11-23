import QtQuick 2.0
Item{

    property variant imgsReady:pt0

    property variant imgsLoading:pt0

    function push(message){
        var obj = JSON.parse(message)

        imgsLoading.cpu.source=obj.cpu
        imgsLoading.mem.source=obj.mem
        imgsLoading.disk.source=obj.disk
        imgsLoading.net.source=obj.net

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
