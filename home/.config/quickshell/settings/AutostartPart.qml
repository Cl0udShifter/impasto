// ╭──────────────────────────────────────────────────────────────────────────╮
// │                                                                          │
// │   A U T O S T A R T   P A R T                                            │
// │   session startup applications · manager and workspace assignment        │
// │                                                                          │
// │   github.com/andreumassanet/impasto                                      │
// │                                                                          │
// ╰──────────────────────────────────────────────────────────────────────────╯

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets

import "../theme"
import "../services"
import "../components"

ColumnLayout {
    id: root

    readonly property string term: search.text.trim().toLowerCase()

    // Applications matching search query
    readonly property var offered: {
        if (root.term === "")
            return []
        const list = []
        for (const app of LauncherService.applications) {
            if (!app.name.toLowerCase().includes(root.term)
                    && !app.keywords.includes(root.term))
                continue
            list.push(app)
        }
        return list
    }

    readonly property var availableMonitors: {
        const list = [""]
        const lit = MonitorService.monitors.filter(m => !m.disabled)
        for (const m of lit) {
            if (m.name && list.indexOf(m.name) < 0)
                list.push(m.name)
        }
        return list
    }

    function cycleMonitor(current: string): string {
        const list = root.availableMonitors
        const idx = list.indexOf(current || "")
        return list[(idx + 1) % list.length]
    }

    Layout.fillWidth: true
    spacing: 12

    // ── CONFIGURED APPLICATIONS ─────────────────────────────────────────────

    SettingGroup {
        title: Tr.t("Startup Applications")
        note: Tr.t("Applications and scripts launched automatically when you log in.")
        hint: Tr.t("Assign each application to a specific workspace and display, so your desktop is arranged the moment you start.")

        SettingBlock {
            visible: AutostartService.items.length === 0

            Text {
                Layout.alignment: Qt.AlignHCenter
                text: Tr.t("No startup applications yet.")
                font.family: Theme.fontFamily
                font.pixelSize: Theme.fontSizeSmall
                color: Theme.textMuted
            }
        }

        Repeater {
            model: ScriptModel {
                values: AutostartService.items
            }

            Item {
                id: row

                required property var modelData
                required property int index

                readonly property bool isEnabled: row.modelData.enabled !== false
                readonly property string picture: row.modelData.icon ? Theme.appIcon(row.modelData.icon) : ""

                Layout.fillWidth: true
                implicitHeight: 52

                SettingDivider {}

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 14
                    anchors.rightMargin: 10
                    spacing: 12

                    ToggleSwitch {
                        checked: row.isEnabled
                        onToggled: AutostartService.toggle(row.index)
                    }

                    Image {
                        Layout.preferredWidth: 24
                        Layout.preferredHeight: 24
                        source: row.picture
                        sourceSize: Qt.size(48, 48)
                        fillMode: Image.PreserveAspectFit
                        visible: row.picture !== "" && status === Image.Ready
                        opacity: row.isEnabled ? 1 : 0.5
                    }

                    Text {
                        visible: row.picture === "" || status !== Image.Ready
                        text: "󰀻"
                        font.family: Theme.fontMono
                        font.pixelSize: 18
                        color: row.isEnabled ? Theme.textMuted : Qt.alpha(Theme.textMuted, 0.4)
                    }

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 1
                        opacity: row.isEnabled ? 1 : 0.5

                        Text {
                            Layout.fillWidth: true
                            text: row.modelData.name || row.modelData.id
                            elide: Text.ElideRight
                            font.family: Theme.fontFamily
                            font.pixelSize: Theme.fontSizeSmall
                            font.weight: Font.Medium
                            color: Theme.text
                        }

                        Text {
                            Layout.fillWidth: true
                            text: row.modelData.exec || row.modelData.id
                            elide: Text.ElideRight
                            font.family: Theme.fontMono
                            font.pixelSize: Theme.fontSizeLabel
                            color: Theme.textMuted
                        }
                    }

                    // Display selector pill
                    PillButton {
                        text: row.modelData.monitor ? row.modelData.monitor : Tr.t("Any display")
                        icon: "󰍹"
                        enabled: row.isEnabled
                        implicitHeight: 26
                        onClicked: {
                            const next = root.cycleMonitor(row.modelData.monitor)
                            AutostartService.update(row.index, { monitor: next })
                        }
                    }

                    // Workspace stepper (1 to 10)
                    Stepper {
                        enabled: row.isEnabled
                        value: row.modelData.workspace !== undefined ? row.modelData.workspace : 1
                        maximum: 10
                        unit: "WS"
                        onChanged: val => {
                            const ws = val === 0 ? 10 : val
                            AutostartService.update(row.index, { workspace: ws })
                        }
                    }

                    // Launch single app now
                    IconButton {
                        icon: "󰐊"
                        iconSize: 12
                        onClicked: AutostartService.launch(row.modelData)
                    }

                    // Remove item
                    IconButton {
                        icon: "󰅖"
                        iconSize: 12
                        onClicked: AutostartService.remove(row.index)
                    }
                }
            }
        }

        SettingRow {
            visible: AutostartService.items.length > 0
            label: Tr.t("Test startup")
            reading: Tr.t("Launch all enabled applications now")

            PillButton {
                text: Tr.t("Launch all")
                icon: "󰐊"
                implicitHeight: 28
                onClicked: AutostartService.launchAll()
            }
        }
    }

    // ── ADD FROM INSTALLED APPLICATIONS ──────────────────────────────────────

    SettingGroup {
        title: Tr.t("Add an application")
        note: Tr.t("Pick an installed application or enter a custom command.")

        SettingRow {
            label: Tr.t("Search applications")

            Rectangle {
                implicitWidth: 320
                implicitHeight: 30
                radius: Theme.radiusSmall
                color: Theme.island
                border.color: search.activeFocus ? Theme.accent : Theme.islandBorder
                border.width: 1

                Behavior on border.color { ColorAnimation { duration: Theme.durationFast } }

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 9
                    anchors.rightMargin: 9
                    spacing: 8

                    Text {
                        text: "󰍉"
                        font.family: Theme.fontMono
                        font.pixelSize: 12
                        color: Theme.textMuted
                    }

                    TextInput {
                        id: search

                        Layout.fillWidth: true
                        font.family: Theme.fontFamily
                        font.pixelSize: Theme.fontSizeSmall
                        color: Theme.text
                        selectByMouse: true
                        selectionColor: Theme.accent
                        selectedTextColor: Theme.accentText
                        clip: true

                        Keys.onEscapePressed: event => {
                            if (search.text === "") {
                                event.accepted = false
                                return
                            }
                            search.text = ""
                        }

                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            visible: search.text === ""
                            text: Tr.t("Search applications")
                            font: search.font
                            color: Theme.textMuted
                        }
                    }
                }
            }
        }

        ListView {
            Layout.fillWidth: true
            Layout.leftMargin: 6
            Layout.rightMargin: 6
            Layout.bottomMargin: root.offered.length > 0 ? 6 : 0
            Layout.preferredHeight: Math.min(root.offered.length, 6) * 34
            visible: root.offered.length > 0
            clip: true
            model: ScriptModel {
                values: root.offered
            }
            boundsBehavior: Flickable.StopAtBounds

            delegate: Rectangle {
                id: option

                required property var modelData

                readonly property string picture: option.modelData.icon
                    ? Theme.appIcon(option.modelData.icon) : ""

                width: ListView.view.width
                height: 34
                radius: Theme.radiusSmall
                color: optionMouse.containsMouse ? Theme.islandSurfaceHover : Qt.alpha(Theme.islandSurfaceHover, 0)

                Behavior on color { ColorAnimation { duration: Theme.durationFast } }

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 8
                    anchors.rightMargin: 10
                    spacing: 10

                    Image {
                        Layout.preferredWidth: 20
                        Layout.preferredHeight: 20
                        source: option.picture
                        sourceSize: Qt.size(40, 40)
                        fillMode: Image.PreserveAspectFit
                        visible: option.picture !== "" && status === Image.Ready
                    }

                    Text {
                        visible: option.picture === "" || status !== Image.Ready
                        Layout.preferredWidth: 20
                        horizontalAlignment: Text.AlignHCenter
                        text: "󰀻"
                        font.family: Theme.fontMono
                        font.pixelSize: 14
                        color: Theme.textMuted
                    }

                    Text {
                        Layout.fillWidth: true
                        text: option.modelData.name
                        elide: Text.ElideRight
                        font.family: Theme.fontFamily
                        font.pixelSize: Theme.fontSizeSmall
                        color: Theme.text
                    }

                    Text {
                        visible: optionMouse.containsMouse
                        text: "󰐕"
                        font.family: Theme.fontMono
                        font.pixelSize: 12
                        color: Theme.accent
                    }
                }

                MouseArea {
                    id: optionMouse

                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        AutostartService.add(option.modelData, "", 1)
                        search.text = ""
                    }
                }
            }
        }

        SettingDivider {}

        // Custom command inputs
        Item {
            Layout.fillWidth: true
            implicitHeight: 46

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 14
                anchors.rightMargin: 10
                spacing: 10

                Text {
                    text: "󰘳"
                    font.family: Theme.fontMono
                    font.pixelSize: 14
                    color: Theme.textMuted
                }

                Rectangle {
                    Layout.preferredWidth: 160
                    Layout.preferredHeight: 30
                    radius: Theme.radiusSmall
                    color: Theme.island
                    border.color: customNameInput.activeFocus ? Theme.accent : Theme.islandBorder
                    border.width: 1

                    TextInput {
                        id: customNameInput
                        anchors.fill: parent
                        anchors.margins: 6
                        font.family: Theme.fontFamily
                        font.pixelSize: Theme.fontSizeSmall
                        color: Theme.text
                        selectByMouse: true
                        clip: true

                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            visible: customNameInput.text === ""
                            text: Tr.t("Application name")
                            font: customNameInput.font
                            color: Theme.textMuted
                        }
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    radius: Theme.radiusSmall
                    color: Theme.island
                    border.color: customCmdInput.activeFocus ? Theme.accent : Theme.islandBorder
                    border.width: 1

                    TextInput {
                        id: customCmdInput
                        anchors.fill: parent
                        anchors.margins: 6
                        font.family: Theme.fontMono
                        font.pixelSize: Theme.fontSizeSmall
                        color: Theme.text
                        selectByMouse: true
                        clip: true

                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            visible: customCmdInput.text === ""
                            text: Tr.t("Command or script to run")
                            font: customCmdInput.font
                            color: Theme.textMuted
                        }

                        Keys.onReturnPressed: addCustomBtn.clicked()
                    }
                }

                PillButton {
                    id: addCustomBtn
                    text: Tr.t("Add command")
                    icon: "󰐕"
                    enabled: customCmdInput.text.trim() !== ""
                    implicitHeight: 30
                    onClicked: {
                        AutostartService.addCustom(customNameInput.text, customCmdInput.text, "", 1)
                        customNameInput.text = ""
                        customCmdInput.text = ""
                    }
                }
            }
        }
    }
}
