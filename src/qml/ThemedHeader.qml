import QtQuick 2.4
import Ubuntu.Components 1.3

PageHeader {
    id: header
    property bool dark: true

    StyleHints {
        backgroundColor: dark ? "#09102b" : "#41cd52"
        foregroundColor: "white"

    }
}

