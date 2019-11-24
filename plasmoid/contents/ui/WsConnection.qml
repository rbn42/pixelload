import QtQuick 2.0
import QtWebSockets 1.0
import org.kde.plasma.core 2.0 as PlasmaCore
import "utils.js" as Utils
Item{

    readonly property var cfg:plasmoid.configuration

    property variant queue

    WebSocketServer {
        id: server
        listen: true
        onClientConnected: {
            webSocket.onTextMessageReceived.connect(function(message) {
                queue.push(message)
            });
        }
    }

    readonly property string startBackEnd:{
        var cmd='sh '+'"'+Utils.get_scripts_root()+'/run-client.sh'+'" '
        cmd+=server.port
        cmd+=' --interval='+cfg.interval
        cmd+=' --unit-width='+cfg.unitWidth
        if(cfg.debugBackend)
            cmd+=' --debug'
        if(cfg.debugBackend)
            console.log('Executing: '+cmd)
        return cmd
    }

    PlasmaCore.DataSource {
        engine: 'executable'
        connectedSources: [startBackEnd]
    }
}
