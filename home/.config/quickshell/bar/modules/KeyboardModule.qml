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

    implicitWidth: holder.implicitWidth
    implicitHeight: holder.implicitHeight

    Loader {
        id: holder
        anchors.fill: parent
        sourceComponent: detail
    }

    Component {
        id: detail

        ModuleCard {
            title: KeyboardService.summary
            subtitle: KeyboardService.layout === "BR" ? "Layout ABNT2" : "Layout US"

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
                    text: "Alternar layout"
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
                name: "Layout ativo"
                value: KeyboardService.layout
            }

            CardFact {
                name: "Dispositivos"
                value: "Todos sincronizados"
            }
        }
    }
}
