import QtQuick 2.0
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import "utils.js" as Utils

PlasmaCore.DataSource {

    readonly property var cfg:plasmoid.configuration

    property string shader_source:""

    engine: 'executable'
    connectedSources: [
        Utils.read_shader('main.frag'),
    ]

    onNewData:{
        if(sourceName==Utils.read_shader('main.frag')){
            shader_source=data.stdout
        }
    }
}
