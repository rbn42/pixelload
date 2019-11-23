import QtQuick 2.0

Item{

    property variant cpu:Image{visible:false}
    property variant mem:Image{visible:false}
    property variant disk:Image{visible:false}
    property variant net:Image{visible:false}

    readonly property bool ready: (cpu.status!=Image.Loading) && (mem.status!=Image.Loading) && (disk.status!=Image.Loading) && (net.status!=Image.Loading)
    property bool used:true
}
