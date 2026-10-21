// ╭──────────────────────────────────────────────────────────────────────────╮
// │                                                                          │
// │   K E Y B O A R D   M O D U L E                                          │
// │   keyboard · active input layout and toggle                              │
// │                                                                          │
// │   github.com/andreumassanet/impasto                                      │
// │                                                                          │
// ╰──────────────────────────────────────────────────────────────────────────╯

import QtQuick
import QtQuick.Layouts

import "../../theme"
import "../../services"
import "../../components"

Item {
    id: root

    property bool compact: false

    implicitWidth: holder.implicitWidth
    implicitHeight: holder.implicitHeight

    Loader {
        id: holder
        anchors.fill: parent
        sourceComponent: root.compact ? chip : detail
    }

    Component {
        id: chip

        RowLayout {
            spacing: 5
            Text {
                text: KeyboardService.icon
                font.family: Theme.fontMono
                font.pixelSize: Math.round(Theme.capsuleHeight * 0.44)
                color: Theme.text
            }
            Text {
                text: KeyboardService.layout
                font.family: Theme.fontFamily
                font.pixelSize: Theme.fontSizeSmall
                font.bold: true
                color: Theme.accent
            }
        }
    }

    Component {
        id: detail

        ModuleCard {
            title: KeyboardService.summary
            subtitle: KeyboardService.layout === "BR" ? Tr.t("Layout ABNT2 (BR)") : Tr.t("Layout US")

            mark: RingIndicator {
                anchors.fill: parent
                thickness: 3
                progress: 0
                trackColor: Theme.indicatorDim

                Text {
                    anchors.centerIn: parent
                    text: KeyboardService.icon
                    font.family: Theme.fontMono
                    font.pixelSize: 18
                    color: Theme.indicator
                }
            }

            RowLayout {
                Layout.fillWidth: true
                Layout.preferredHeight: Theme.cardRow
                spacing: 10

                Text {
                    Layout.fillWidth: true
                    text: Tr.t("Toggle layout")
                    font.family: Theme.fontFamily
                    font.pixelSize: Theme.fontSizeSmall
                    color: Theme.textMuted
                }

                ToggleSwitch {
                    checked: KeyboardService.layout === "BR"
                    onToggled: KeyboardService.toggle()
                }
            }

            CardFact {
                name: Tr.t("Active layout")
                value: KeyboardService.layout
            }

            CardFact {
                name: Tr.t("Devices")
                value: Tr.t("All synchronized")
            }
        }
    }
}
