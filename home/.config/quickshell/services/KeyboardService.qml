// ╭──────────────────────────────────────────────────────────────────────────╮
// │                                                                          │
// │   K E Y B O A R D   S E R V I C E                                        │
// │   active layout detection and toggle · reactive via hyprland             │
// │                                                                          │
// │   github.com/andreumassanet/impasto                                      │
// │                                                                          │
// ╰──────────────────────────────────────────────────────────────────────────╯

pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Hyprland

Singleton {
    id: root

    property string layout: "US"
    readonly property string icon: "󰌌"
    readonly property string summary: root.layout === "BR" ? "Português (Brasil)" : "English (US)"

    property bool armed: false

    readonly property Timer armTimer: Timer {
        interval: 1200
        running: true
        onTriggered: root.armed = true
    }

    onLayoutChanged: {
        if (!root.armed)
            return
        if (HyprlandService.isFullscreenActive())
            return
        const label = root.layout === "BR" ? "Layout ABNT2 (BR)" : "Layout US"
        OsdService.requested(root.icon, label, -1)
    }

    readonly property Process queryProcess: Process {
        command: ["hyprctl", "devices", "-j"]
        stdout: StdioCollector {
            onStreamFinished: {
                if (!text || text.trim() === "")
                    return
                try {
                    const data = JSON.parse(text)
                    const keyboards = data.keyboards ?? []
                    const mainKb = keyboards.find(kb => kb.main) ?? keyboards[0]
                    if (mainKb && mainKb.active_keymap)
                        root.updateLayoutFromKeymap(mainKb.active_keymap)
                } catch (e) {
                    console.warn("KeyboardService: failed to parse devices:", e)
                }
            }
        }
    }

    readonly property Process switchProcess: Process {
        command: ["hyprctl", "switchxkblayout", "all", "next"]
    }

    function toggle(): void {
        root.layout = root.layout === "BR" ? "US" : "BR"
        root.switchProcess.running = true
    }

    function updateLayoutFromKeymap(keymap: string): void {
        const lower = (keymap || "").toLowerCase()
        if (lower.indexOf("portuguese") >= 0 || lower.indexOf("brazil") >= 0 || lower.indexOf("abnt") >= 0 || lower.indexOf("br") >= 0) {
            root.layout = "BR"
        } else {
            root.layout = "US"
        }
    }

    readonly property Connections hyprlandEvents: Connections {
        target: Hyprland

        function onRawEvent(event): void {
            if (event.name === "activelayout") {
                const parts = String(event.data).split(",")
                const keymap = parts.length > 1 ? parts.slice(1).join(",") : parts[0]
                root.updateLayoutFromKeymap(keymap)
            }
        }
    }

    Component.onCompleted: {
        root.queryProcess.running = true
    }
}
