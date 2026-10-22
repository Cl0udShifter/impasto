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

    property var pendingLaunches: ({})

    function commit(nextItems: var): void {
        SettingsService.set("autostart", nextItems)
    }

    function cleanExec(execStr: string): string {
        if (!execStr)
            return ""
        return execStr.replace(/%[uUfFick]/g, "").trim()
    }

    function resolveClass(item: var): string {
        if (!item)
            return ""
        if (item.wmclass && item.wmclass.trim() !== "")
            return item.wmclass.trim()

        const apps = LauncherService.applications || []
        for (let i = 0; i < apps.length; i++) {
            if (apps[i].id === item.id) {
                if (apps[i].wmclass && apps[i].wmclass.trim() !== "")
                    return apps[i].wmclass.trim()
                break
            }
        }

        if (item.id && item.id.endsWith(".desktop"))
            return item.id.slice(0, -8).toLowerCase()

        if (item.exec) {
            const first = item.exec.trim().split(/\s+/)[0]
            const base = first.split("/").pop()
            return base.toLowerCase()
        }
        return ""
    }

    function resolveCommand(item: var): string {
        if (!item)
            return ""

        let cmd = ""
        if (item.exec && item.exec.trim() !== "") {
            cmd = root.cleanExec(item.exec)
        } else if (item.id) {
            const apps = LauncherService.applications || []
            for (let i = 0; i < apps.length; i++) {
                if (apps[i].id === item.id && apps[i].exec) {
                    cmd = root.cleanExec(apps[i].exec)
                    break
                }
            }
        }

        if (cmd !== "")
            return cmd

        if (item.id && item.id.endsWith(".desktop"))
            return `gtk-launch ${item.id}`

        return ""
    }

    function add(app: var, monitor: string, workspace: int): void {
        const current = (root.items || []).slice()
        const id = (app && app.id) ? app.id : "custom"
        const name = (app && app.name) ? app.name : "Custom Application"
        const icon = (app && app.icon) ? app.icon : ""
        const exec = (app && app.exec) ? app.exec : ""
        const wmclass = (app && app.wmclass) ? app.wmclass : ""

        current.push({
            id: id,
            name: name,
            icon: icon,
            exec: exec,
            wmclass: wmclass,
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
        const first = trimmedCmd.split(/\s+/)[0]
        const baseCls = first.split("/").pop().toLowerCase()
        current.push({
            id: "custom_" + Date.now(),
            name: trimmedName,
            icon: "",
            exec: trimmedCmd,
            wmclass: baseCls,
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

        const cmd = root.resolveCommand(item)
        if (!cmd || cmd.trim() === "")
            return

        const cls = root.resolveClass(item)

        // 1. Dynamic window rule so Hyprland natively assigns the window by class even if PID tracking is lost
        if (cls !== "" && targetWs > 0) {
            Hyprland.dispatch(`hl.window_rule({ name = "autostart-${cls}", match = { class = "(?i)^(${cls})$" }, workspace = "${targetWs} silent" })`)

            const pending = Object.assign({}, root.pendingLaunches)
            pending[cls.toLowerCase()] = {
                targetWs: targetWs,
                monitor: mon,
                expires: Date.now() + 30000
            }
            root.pendingLaunches = pending
        }

        // 2. In shared mode, if monitor is specified, ensure the workspace is moved to that monitor
        if (mon !== "" && targetWs > 0 && !HyprlandService.perScreen) {
            Hyprland.dispatch(`hl.dispatch(hl.dsp.workspace.move({ workspace = ${targetWs}, monitor = "${mon}" }))`)
        }

        // 3. Dispatch execution with inline rule as well
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

    readonly property Connections hyprEvents: Connections {
        target: Hyprland

        function onRawEvent(event): void {
            if (!event || event.name !== "openwindow")
                return

            // Format: ADDRESS,WORKSPACENAME,WINDOWCLASS,WINDOWTITLE
            const raw = String(event.data || "")
            const parts = raw.split(",")
            if (parts.length < 3)
                return

            const address = parts[0]
            const currentWs = parts[1]
            const winClass = parts[2].toLowerCase()
            const winTitle = parts.slice(3).join(",").toLowerCase()

            let pending = root.pendingLaunches[winClass]
            if (!pending) {
                for (const key in root.pendingLaunches) {
                    if (winClass.includes(key) || key.includes(winClass) || winTitle.includes(key)) {
                        pending = root.pendingLaunches[key]
                        break
                    }
                }
            }

            if (pending && Date.now() < pending.expires) {
                const wanted = String(pending.targetWs)
                if (currentWs !== wanted) {
                    Hyprland.dispatch(`hl.dsp.window.move({ workspace = ${pending.targetWs}, window = "address:${address}", follow = false })`)
                }
                if (pending.monitor && pending.monitor !== "" && !HyprlandService.perScreen) {
                    Hyprland.dispatch(`hl.dispatch(hl.dsp.workspace.move({ workspace = ${pending.targetWs}, monitor = "${pending.monitor}" }))`)
                }
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
