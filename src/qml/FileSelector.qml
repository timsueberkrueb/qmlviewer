import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3
import Qt.labs.folderlistmodel 2.1

Rectangle {
    id: fileSelector

    property alias rootFolder: folderModel.rootFolder
    property alias folder: folderModel.folder
    property bool canGoUp: folderModel.folder != rootFolder
    property alias count: folderModel.count
    property var nameFilters: ["*.*"]

    signal fileSelected(string fileName, string filePath)

    function goUp() {
        if (canGoUp)
            folderModel.folder = folderModel.parentFolder;
    }

    function fileExists(file) {
        return folderModel.indexOf(file) !== -1;
    }

    color: theme.palette.normal.background

    ColumnLayout {
        anchors.fill: parent

        ListItem {
            Layout.fillWidth: true
            height: canGoUp ? units.gu(6) : 0
            visible: height > 0
            Layout.preferredHeight: height

            ListItemLayout {
                anchors.fill: parent

                Label {
                    SlotsLayout.position: SlotsLayout.Center
                    text: "Go up"
                    color: theme.palette.normal.foregroundText
                }

                Icon {
                    name: "toolkit_chevron-up_2gu"
                    SlotsLayout.position: SlotsLayout.Leading
                    width: units.gu(2)
                }
            }

            onClicked: {
                goUp();
            }

            Behavior on height {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.InOutQuad
                }
            }
        }

        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true

            clip: true

            model: FolderListModel {
                id: folderModel

                // indexOf: introduced in Qt 5.6
                function indexOf(file) {
                    for (var i=0; i<count; i++) {
                        if (get(i, "fileURL") == file)
                            return i;
                    }
                    return -1;
                }

                nameFilters: fileSelector.nameFilters
            }

            delegate: Component {
                ListItem {
                    width: parent.width
                    height: units.gu(6)

                    ListItemLayout {
                        anchors.fill: parent

                        Label {
                            SlotsLayout.position: SlotsLayout.Center
                            text: model.fileName
                            color: theme.palette.normal.foregroundText
                        }

                        Icon {
                            name: model.fileIsDir ? "next" : "stock_document"
                            SlotsLayout.position: SlotsLayout.Leading
                            width: units.gu(2)
                        }

                    }

                    onClicked: {
                        if (model.fileIsDir) {
                            folderModel.folder = Qt.resolvedUrl("file://" + model.filePath);
                        }
                        else {
                            fileSelected(model.fileName, model.filePath)
                        }
                    }
                }
            }
        }
    }
}
