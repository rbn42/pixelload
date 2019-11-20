import QtQuick 2.0
import Qt3D.Core 2.0
import Qt3D.Render 2.0
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
            property variant tex:Image{visible:false}

            property variant color0:cfg.colorCpu0
            property variant color1:cfg.colorCpu1
            property variant color2:cfg.colorCpu2
            property variant color3:cfg.colorCpu3

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
            property variant tex:Image{visible:false}

            property variant color0:cfg.colorMem0

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
            property variant tex:Image{visible:false}

            property variant color0:cfg.colorDisk0
            property variant color1:cfg.colorDisk1

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
            property variant tex:Image{visible:false}

            property variant color0:cfg.colorNet0
            property variant color1:cfg.colorNet1

            blending: true
            fragmentShader:shaderSource.shader_source
        }




    ShaderSource{id:shaderSource}

    WsConnection{
        queue:Item{
            function push(message){
                var obj = JSON.parse(message)
                se_cpu.tex.source=obj.cpu
                se_mem.tex.source=obj.mem
                se_net.tex.source=obj.net
                se_disk.tex.source=obj.disk
            }
        }
    }
}

