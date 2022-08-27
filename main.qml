import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.3

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("دایره المعارف اتیکا")
    //search bar
    Rectangle {
        id: searchbar
        anchors.centerIn: parent
        TextField{
            id:searchtext
            placeholderText: qsTr("کلمه خود را وارد کنید");
        }
        Rectangle{
            id:searchui
            width: 40
            anchors.left: searchtext.right
            anchors.top: searchtext.top
            anchors.bottom: searchtext.bottom
            Image {
                id: searchicon
                anchors.fill: parent
                source: "/search.png"
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {

                }
                onClicked: {

                }
            }

        }
    }
    //add button
    Rectangle{
        id:add
        width: 30
        height: 30
        anchors.left: searchbar.right
        anchors.top: searchbar.top
        anchors.leftMargin: searchui.width + searchtext.width
        Image {
            id: pluse
            anchors.fill:parent
            source: "/add.png"
        }
        MouseArea{
            anchors.fill:parent
            hoverEnabled: true
            onEntered: {
                textopen.start()
            }
            onExited: {
                textclose.start()
            }

            onClicked: {

            }
        }
    }
    Rectangle{
        id:addrec
        anchors.left: add.right
        anchors.top: add.top
        anchors.bottom: add.bottom
        width:0
        PropertyAnimation{
            id:textopen
            target: addtext
            property: "width"
            to:100
            duration: 200
            running: false
        }
        PropertyAnimation{
            id:textclose
            target: addtext
            property: "width"
            to:0
            duration: 200
            running: false
        }
        Text{
            id:addtext
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            text: "اضافه کردن"
            onWidthChanged: {
                visible = !(addtext.visible)
            }
        }
    }
}
