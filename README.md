# QML Viewer

A simple QML file viewer for Ubuntu

QML Viewer is available for download from the [Open Store](https://open.uappexplorer.com/app/qmlviewer.timsueberkrueb).

## Dependencies

Qt >= 5.4.0 with at least the following modules is required:

 * [qtbase](http://code.qt.io/cgit/qt/qtbase.git)
 * [qtdeclarative](http://code.qt.io/cgit/qt/qtdeclarative.git)

## Installation

We use [clickable](http://clickable.bhdouglass.com/).

To build and package the application, run:

```bash
clickable build
clickable build-click
```

To install the application on your device, make sure your device is
connected to your development machine with an USB cable and developer mode is enabled.

Run:

```
clickable install
clickable launch
```

## Credits

* Thanks to [Sam Hewitt](http://samuelhewitt.com/) for creating the [Ubuntu Icon Resource Kit](https://github.com/snwh/ubuntu-icon-resource-kit) which was used to create the application icon.

## Licensing

Licensed under the terms of the GNU General Public License version 3 or, at your option, any later version.
