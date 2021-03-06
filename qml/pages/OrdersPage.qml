// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtGraphicalEffects 1.0
import "../common"

Flickable {
    id: flickable
    contentHeight: Math.max(parent.height * 1.2,  root.implicitHeight)
    // index to get access to Loader (Destination)
    property int myIndex: index
    // StackView manages this, so please no anchors here
    // anchors.fill: parent
    property string name: "OrdersPage"
    Pane {
        id: root
        focus: true
        anchors.fill: parent
        ColumnLayout {
            anchors.right: parent.right
            anchors.left: parent.left
            LabelHeadline {
                leftPadding: 10
                text: qsTr("Order Data (List of QObject*)")
            }
            RowLayout {
                IconInactive {
                    imageName: modelData.icon
                    imageSize: 48
                }
                LabelSubheading {
                    text: qsTr("Stored Orders: ")+ dataManager.orderPropertyList.length
                }
            }
            RowLayout {
                LabelBodySecondary {
                    topPadding: 6
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("Activation Policy: ")
                }
                LabelBody {
                    topPadding: 6
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("LAZY")
                }
            }
            HorizontalDivider {}
            RowLayout {
                LabelSubheading {
                    topPadding: 6
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("See the List of Orders ?\nTap on the Floating Action Button (List Icon).\n")
                }
            }
            RowLayout {
                LabelSubheading {
                    topPadding: 6
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("From the List Page you can\n* ADD new Orders\n* EDIT Order (Tap on a Row)\n* DELETE Order (Swipe List Row to left or right site)\n")
                }
            }
            HorizontalDivider {}
            RowLayout {
                LabelSubheading {
                    topPadding: 6
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("No orders available yet ?\nTap on the Floating Action Button (Add Icon).\n")
                }
            }
            HorizontalDivider {}
        } // col layout
    } // pane root
    ScrollIndicator.vertical: ScrollIndicator { }


    // emitting a Signal could be another option
    Component.onDestruction: {
        cleanup()
    }
    // called immediately after Loader.loaded
    function init() {
        console.log("Init done from OrdersPage")
    }
    // called from Component.destruction
    function cleanup() {
        console.log("Cleanup done from OrdersPage")
    }
} // flickable
// primaryDarkColor is used because FAB can overlap Raised Buttons colored in primaryColor

