import QtQuick 2.4
import QtQuick.Window 2.0
import Ubuntu.Components 1.3
import Qt.labs.settings 1.0

Window {
    title: "QML Viewer"

    width: units.gu(100)
    height: units.gu(75)

    MainView {
        id: mainView
        anchors.fill: parent

        property bool darkTheme: true

        objectName: "mainView"
        applicationName: "qmlviewer.timsueberkrueb"

        theme.name: darkTheme ? "Ubuntu.Components.Themes.SuruDark" : "Ubuntu.Components.Themes.Ambiance"

        Settings {
            category: "theme"
            property alias darkTheme: mainView.darkTheme
        }

        Page {
            header: {
                if (contentItem.filePath)
                    return openHeader;
                else
                    return selectHeader;
            }

            ThemedHeader {
                id: selectHeader
                visible: !contentItem.filePath
                title: "QML Viewer"
                dark: mainView.darkTheme
                trailingActionBar.actions: [
                    Action {
                        iconName: mainView.darkTheme ? "torch-on" : "torch-off"
                        text: i18n.tr("Toggle theme")
                        onTriggered: {
                            mainView.darkTheme = !mainView.darkTheme;
                        }
                    }
                ]
            }

            ThemedHeader {
                id: openHeader
                visible: contentItem.filePath
                title: contentItem.fileName
                dark: mainView.darkTheme
                leadingActionBar.actions: [
                    Action {
                        iconName: "close"
                        text: i18n.tr("Close")
                        onTriggered: {
                            contentItem.fileName = "";
                            contentItem.filePath = Qt.resolvedUrl("");
                        }
                    }
                ]
                trailingActionBar.actions: [
                    Action {
                        iconName: "reload"
                        text: i18n.tr("Reload")
                        onTriggered: {
                            var fp = contentItem.filePath;
                            contentItem.filePath = "";
                            componentCache.clear();
                            contentItem.filePath = fp;
                        }
                    }
                ]
            }

            Item {
                // Content Item
                id: contentItem
                property string filePath: ""
                property string fileName: ""
                property bool error: false
                property string errorString: ""
                property bool loaded: false
                property var sourceComponent

                function loadComponent() {
                    error = false;
                    sourceComponent = undefined;
                    loaded = false;
                    var component = Qt.createComponent(Qt.resolvedUrl("file://%1".arg(filePath)));
                    if (component.status !== Component.Ready) {
                        if (component.status === Component.Error) {
                            error = true;
                            errorString = component.errorString();
                        }
                    }
                    loaded = true;
                    sourceComponent = component;
                }


                property Component fileSelectorComponent: Component {
                    FileSelector {
                        anchors.fill: parent
                        rootFolder: Qt.resolvedUrl("file://%1".arg(homePath))
                        folder: Qt.resolvedUrl("file://%1".arg(documentsPath))
                        nameFilters: ["*.qml"]
                        onFileSelected: {
                            contentItem.fileName = fileName;
                            contentItem.filePath = filePath;
                            contentItem.loadComponent();
                        }
                    }
                }

                anchors {
                    top: parent.header.bottom
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                }

                Loader {
                    id: loader
                    anchors.fill: parent
                    sourceComponent: {
                        if (!contentItem.filePath)
                            return contentItem.fileSelectorComponent;
                        else if (contentItem.loaded)
                            return contentItem.sourceComponent;
                    }
                }

                Item {
                    visible: contentItem.filePath
                    anchors {
                        fill: loader
                        margins: units.gu(1)
                    }

                    Label {
                        id: errorLabel
                        visible: contentItem.error
                        anchors.centerIn: parent
                        text: ("<b>%1</b>:<br/>%2").arg(i18n.tr("Error loading file")).arg(contentItem.errorString)
                        color: UbuntuColors.red
                        width: Math.min(parent.width, metrics.width)
                        wrapMode: Text.WordWrap

                        TextMetrics {
                            id: metrics
                            text: errorLabel.text
                            font: errorLabel.font
                        }
                    }
                }
            }
        }
    }

    Component.onCompleted: {
        show();
    }
}

