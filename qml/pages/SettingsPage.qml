// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtGraphicalEffects 1.0

import "../common"
import org.ekkescorner.data 1.0

Flickable {
    property string name: "SettingsPage"
    // index to get access to Loader (Destination)
    property int myIndex: index
    contentHeight: root.implicitHeight
    // StackView manages this, so please no anchors here
    // anchors.fill: parent
    clip: true

    Pane {
        id: root
        anchors.fill: parent
        property SettingsData settings

        ColumnLayout {
            id: theContent
            anchors.right: parent.right
            anchors.left: parent.left
            LabelHeadline {
                leftPadding: 10
                text: qsTr("Settings Biz Data")
            }
            IconInactive {
                imageName: modelData.icon
                imageSize: 48
            }
            HorizontalDivider {}
            RowLayout {
                LabelSubheading {
                    topPadding: 6
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("Settings is initialItem of StackView.\nSettings is marked as Favorite, so can be opened from Bottom Navigation (in Portrait Mode)")
                }
            }
            RowLayout {
                LabelBodySecondary {
                    Layout.preferredWidth: 1
                    topPadding: 6
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("Activation Policy: ")
                }
                LabelBody {
                    Layout.preferredWidth: 1
                    topPadding: 6
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("WHILE SELECTED")
                }
            }
            HorizontalDivider {}
            LabelTitle {
                topPadding: 6
                text: qsTr("Theme")
                color: primaryColor
            }
            RowLayout {
                LabelSubheading {
                    topPadding: 6
                    leftPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("Dark Theme")
                }
                Switch {
                    topPadding: 6
                    anchors.right: parent.right
                    focusPolicy: Qt.NoFocus
                    checked: isDarkTheme
                    onCheckedChanged: {
                        if(checked != isDarkTheme) {
                            themePalette = myApp.swapThemePalette()
                        }
                    }
                } // switch darktheme
            } // row switch dar theme
            LabelTitle {
                topPadding: 6
                text: qsTr("Colors")
                color: primaryColor
            }
            RowLayout {
                LabelSubheading {
                    id: labelPrimary
                    topPadding: 6
                    leftPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("Primary Color:\nTap on Color Rectangle to edit")
                }
                Rectangle {
                    anchors.verticalCenter: labelPrimary.verticalCenter
                    anchors.right: parent.right
                    width: 100
                    height: 40
                    color: primaryColor
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            navPane.pushPrimaryColorPage()
                        }
                    } // mouse
                }
            } // row primary
            Item {
                height: 6
            }
            RowLayout {
                LabelSubheading {
                    id: labelAccent
                    topPadding: 6
                    leftPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("Accent Color:\nTap on Color Rectangle to edit")
                }
                Rectangle {
                    anchors.verticalCenter: labelAccent.verticalCenter
                    anchors.right: parent.right
                    width: 100
                    height: 40
                    color: accentColor
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            navPane.pushAccentColorPage()
                        }
                    } // mouse
                }
            } // row accent
            HorizontalDivider {}
            LabelTitle {
                topPadding: 6
                text: qsTr("Navigation Style")
                color: primaryColor
            }
            RowLayout {
                LabelSubheading {
                    topPadding: 6
                    leftPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("Classic Material Navigation")
                    color:accentColor
                }
                Switch {
                    id: classicNavigationSwitch
                    topPadding: 6
                    anchors.right: parent.right
                    focusPolicy: Qt.NoFocus
                    checked: root.settings? root.settings.navigationStyle == 2:false
                    onCheckedChanged: {
                        if(root.settings && checked ) {
                            root.settings.navigationStyle = 2
                            oneHandComfortNavigationSwitch.checked = false
                            bottomNavigationSwitch.checked = false
                        }
                    }
                } // classicNavigationSwitch
            } // row classicNavigationSwitch
            LabelBody {
                leftPadding: 20
                rightPadding: 16
                wrapMode: Text.WordWrap
                text: qsTr("Menu and Back Buttons: Top-Left\nBack Button on Android also at bottom.\nOpen Drawer: swipe from left side or tap on Menu Button.\nThis is the classic Navigation Style using a Drawer to get access to all destinations.")
            }
            RowLayout {
                LabelSubheading {
                    topPadding: 6
                    leftPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("Material Bottom Navigation")
                    color: accentColor
                }
                Switch {
                    id: bottomNavigationSwitch
                    topPadding: 6
                    anchors.right: parent.right
                    focusPolicy: Qt.NoFocus
                    checked: root.settings? root.settings.navigationStyle == 1:false
                    onCheckedChanged: {
                        if(root.settings && checked ) {
                            root.settings.navigationStyle = 1
                            oneHandComfortNavigationSwitch.checked = false
                            classicNavigationSwitch.checked = false
                        }
                    }
                } // bottomNavigationSwitch
            } // row bottomNavigationSwitch
            LabelBody {
                leftPadding: 20
                rightPadding: 16
                wrapMode: Text.WordWrap
                text: qsTr("Same as Classic Navigation\nplus: Bottom Navigation Bar.\nBottom Navigation is a new way Google added recently to Google Material Style Guide.\nBottom Navigation Bar is only visible in Portrait Mode - in Landscape Mode it would occupy too much space from available height.\nQtCon Conference App uses Bottom Navigation Bar for easy access to Home, Schedule, Speaker and Tracks.\nTo access other destinations you must open Drawer from Menu Button or swipe from left side.")
            }
            RowLayout {
                LabelSubheading {
                    topPadding: 6
                    leftPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("One Hand Comfort Navigation")
                    color: accentColor
                }
                Switch {
                    id: oneHandComfortNavigationSwitch
                    topPadding: 6
                    anchors.right: parent.right
                    focusPolicy: Qt.NoFocus
                    checked: root.settings? root.settings.navigationStyle == 0:false
                    onCheckedChanged: {
                        if(root.settings && checked ) {
                            root.settings.navigationStyle = 0
                            bottomNavigationSwitch.checked = false
                            classicNavigationSwitch.checked = false
                        }
                    }
                } // oneHandComfortNavigationSwitch
            } // row bottomNavigationSwitch
            LabelBody {
                text: qsTr("Same as Classic Navigation plus Bottom Navigation Bar\nplus: Menu Button (Hamburger Button) added to left most position of Bottom Navigation Bar.\nNow the Menu Button can be reached easy without moving fingers to Top Left Menu Button.\nComing from BlackBerry 10 ? Then you already used the Menu Button from bottom left.")
                leftPadding: 20
                rightPadding: 16
                wrapMode: Text.WordWrap
            }
            RowLayout {
                visible: root.settings && root.settings.navigationStyle == 0? true:false
                LabelSubheading {
                    topPadding: 6
                    leftPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("Only one Menu Button")
                    color: accentColor
                }
                Switch {
                    id: oneMenuSwitch
                    topPadding: 6
                    anchors.right: parent.right
                    focusPolicy: Qt.NoFocus
                    checked: root.settings && root.settings.oneMenuButton? true:false
                    onCheckedChanged: {
                        root.settings.oneMenuButton = checked
                    }
                } // oneMenuSwitch
            } // row oneMenuSwitch
            LabelBody {
                visible: root.settings? root.settings.navigationStyle == 0:false
                text: qsTr("Using the Comfort Navigation and you don't like to have two Menu Buttons ?\nYou can hide the Top-Left Menu Button in Portrait Mode and always use the one from Bottom Navigation Bar.")
                leftPadding: 20
                rightPadding: 16
                wrapMode: Text.WordWrap
            }
            HorizontalDivider {}
            RowLayout {
                LabelBodySecondary {
                    Layout.preferredWidth: 1
                    topPadding: 6
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("Last Number:")
                }
                LabelBody {
                    Layout.preferredWidth: 1
                    topPadding: 6
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    text: dataManager.settingsData().lastUsedNumber
                }
            }
            RowLayout {
                LabelBodySecondary {
                    Layout.preferredWidth: 1
                    topPadding: 6
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("Version:")
                }
                LabelBody {
                    Layout.preferredWidth: 1
                    topPadding: 6
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    text: dataManager.settingsData().version
                }
            }
        } // col layout

    } // root

    ScrollIndicator.vertical: ScrollIndicator { }

    Component.onDestruction: {
        cleanup()
    }

    // called immediately after Loader.loaded
    function init() {
        root.settings = dataManager.settingsData()
        console.log("Init done from SettingsPage")
    }
    // called from Component.destruction
    function cleanup() {
        console.log("Cleanup done from SettingsPage")
    }

} // flickable
