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
        anchors.left:add.right
        anchors.top: add.top
        anchors.leftMargin: 5
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
            anchors.leftMargin: 5
            Image {
                id: searchicon
                anchors.fill: parent
                source: "/search.png"
            }
            ScaleAnimator{
                id:scale
                target:searchui
                to:1.1
                duration: 200
                running: false
            }

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    scale.start()
                    console.log(searchtext.text)
                }
            }
        }
    }
    //add button
    Rectangle{
        id:add
        width: 30
        height: 30
        Image {
            id: pluse
            anchors.fill:parent
            source: "/add.png"
        }
        ScaleAnimator{
            id:scaleadd
            target:pluse
            to:1.1
            duration: 200
            running: false
        }
        MouseArea{
            anchors.fill:parent
            hoverEnabled: true
            onClicked: {
                scaleadd.start()

            }
        }
    }

    //table view section
    TableView {
        width: 200
        height: width
        anchors.centerIn: parent
        clip: true
    }
}
