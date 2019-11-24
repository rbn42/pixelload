import QtQuick 2.0
import QtQuick.Layouts 1.1

import org.kde.plasma.plasmoid 2.0

Row{
    id:root
    readonly property var cfg:plasmoid.configuration

    Layout.preferredWidth:cfg.unitWidth*4 + 2*3 

        spacing:2

        ShaderEffect {
            id:se_cpu
            width:cfg.unitWidth
            height:parent.height

            property int unitWidth:cfg.unitWidth
            property int unitHeight:height
            property int numChannel:tex.height
            property variant tex

            readonly property color color0:cfg.colorCpu0
            readonly property color color1:cfg.colorCpu1
            readonly property color color2:cfg.colorCpu2
            readonly property color color3:cfg.colorCpu3
            readonly property color colorBackground:cfg.colorBackground

            blending: true
            fragmentShader:shaderSource.shader_source
        }
        ShaderEffect {
            id:se_mem
            width:cfg.unitWidth
            height:parent.height

            property int unitWidth:cfg.unitWidth
            property int unitHeight:height
            property int numChannel:tex.height
            property variant tex

            readonly property color color0:cfg.colorMem0
            readonly property color colorBackground:cfg.colorBackground

            blending: true
            fragmentShader:shaderSource.shader_source
        }
        ShaderEffect {
            id:se_disk
            width:cfg.unitWidth
            height:parent.height

            property int unitWidth:cfg.unitWidth
            property int unitHeight:height
            property int numChannel:tex.height
            property variant tex

            readonly property color color0:cfg.colorDisk0
            readonly property color color1:cfg.colorDisk1
            readonly property color colorBackground:cfg.colorBackground

            blending: true
            fragmentShader:shaderSource.shader_source
        }
        ShaderEffect {
            id:se_net
            width:cfg.unitWidth
            height:parent.height

            property int unitWidth:cfg.unitWidth
            property int unitHeight:height
            property int numChannel:tex.height
            property variant tex

            readonly property color color0:cfg.colorNet0
            readonly property color color1:cfg.colorNet1
            readonly property color colorBackground:cfg.colorBackground

            blending: true
            fragmentShader:shaderSource.shader_source
        }

    ShaderSource{id:shaderSource}

    WsConnection{
        queue:MessageQueue{
            onImgsReadyChanged:{
                se_cpu.tex=imgsReady.cpu
                se_mem.tex=imgsReady.mem
                se_net.tex=imgsReady.net
                se_disk.tex=imgsReady.disk
            }
        }
    }

}

