// ╭──────────────────────────────────────────────────────────────────────────╮
// │                                                                          │
// │   A U T O S T A R T   S E R V I C E                                      │
// │   session startup applications · workspace & monitor dispatch            │
// │                                                                          │
// │   github.com/andreumassanet/impasto                                      │
// │                                                                          │
// ╰──────────────────────────────────────────────────────────────────────────╯

pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Hyprland

QtObject {
    id: root

    readonly property var items: SettingsService.autostart ?? []

    function commit(nextItems: var): void {
        SettingsService.set("autostart", nextItems)
    }

    function add(app: var, monitor: string, workspace: int): void {
        const current = (root.items || []).slice()
        const id = (app && app.id) ? app.id : "custom"
        const name = (app && app.name) ? app.name : "Custom Application"
        const icon = (app && app.icon) ? app.icon : ""
        const exec = (app && app.exec) ? app.exec : ""

        current.push({
            id: id,
            name: name,
            icon: icon,
            exec: exec,
            monitor: monitor ?? "",
            workspace: workspace !== undefined && workspace > 0 ? workspace : 1,
            enabled: true
        })
        root.commit(current)
    }

    function addCustom(name: string, command: string, monitor: string, workspace: int): void {
        if (!command || command.trim() === "")
            return
        const current = (root.items || []).slice()
        const trimmedCmd = command.trim()
        const trimmedName = name && name.trim() !== "" ? name.trim() : trimmedCmd
        current.push({
            id: "custom_" + Date.now(),
            name: trimmedName,
            icon: "",
            exec: trimmedCmd,
            monitor: monitor ?? "",
            workspace: workspace !== undefined && workspace > 0 ? workspace : 1,
            enabled: true
        })
        root.commit(current)
    }

    function remove(index: int): void {
        const current = (root.items || []).slice()
        if (index >= 0 && index < current.length) {
            current.splice(index, 1)
            root.commit(current)
        }
    }

    function toggle(index: int): void {
        const current = (root.items || []).slice()
        if (index >= 0 && index < current.length) {
            const item = Object.assign({}, current[index])
            item.enabled = item.enabled === false ? true : false
            current[index] = item
            root.commit(current)
        }
    }

    function update(index: int, patch: var): void {
        const current = (root.items || []).slice()
        if (index >= 0 && index < current.length) {
            current[index] = Object.assign({}, current[index], patch)
            root.commit(current)
        }
    }

    function launch(item: var): void {
        if (!item)
            return

        const mon = item.monitor || ""
        const wsNum = item.workspace !== undefined ? item.workspace : 1

        let targetWs = 0
        if (wsNum > 0) {
            if (mon !== "" && HyprlandService.perScreen) {
                const base = HyprlandService.baseOn(mon)
                targetWs = base + wsNum
            } else {
                targetWs = wsNum
            }
        }

        let cmd = ""
        if (item.id && item.id.endsWith(".desktop")) {
            cmd = `gtk-launch ${item.id}`
        } else if (item.exec) {
            cmd = item.exec
        } else {
            return
        }

        let execPayload = ""
        if (targetWs > 0) {
            execPayload = `[workspace ${targetWs} silent] ${cmd}`
        } else {
            execPayload = cmd
        }

        Hyprland.dispatch(`hl.dsp.exec_cmd(${JSON.stringify(execPayload)})`)
    }

    function launchAll(): void {
        const list = root.items
        for (let i = 0; i < list.length; i++) {
            const item = list[i]
            if (item && item.enabled !== false) {
                root.launch(item)
            }
        }
    }

    // Prevents re-running autostart if Quickshell is reloaded during the same session.
    readonly property string markerFile: {
        const runtime = Quickshell.env("XDG_RUNTIME_DIR") || "/tmp"
        const sig = Quickshell.env("HYPRLAND_INSTANCE_SIGNATURE") || "default"
        return `${runtime}/impasto-autostart-${sig}`
    }

    readonly property Process bootProcess: Process {
        command: ["sh", "-c", `if [ ! -f "${root.markerFile}" ]; then touch "${root.markerFile}" && echo run; fi`]
        stdout: StdioCollector {
            onStreamFinished: {
                if (text && text.trim() === "run")
                    root.bootTimer.restart()
            }
        }
    }

    readonly property Timer bootTimer: Timer {
        interval: 1200
        onTriggered: root.launchAll()
    }

    Component.onCompleted: {
        if (SettingsService.arrived)
            root.bootProcess.running = true
    }

    function bootstrap(): void {
        if (SettingsService.arrived)
            root.bootProcess.running = true
    }

    readonly property Connections settingsArrive: Connections {
        target: SettingsService
        function onArrivedChanged(): void {
            if (SettingsService.arrived)
                root.bootProcess.running = true
        }
    }
}
