# QML Viewer

[![License](https://img.shields.io/badge/license-GPLv3.0-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.html)
[![GitHub release](https://img.shields.io/github/release/tim-sueberkrueb/qmlviewer.svg)](https://github.com/tim-sueberkrueb/qmlviewer/releases)
[![GitHub issues](https://img.shields.io/github/issues/tim-sueberkrueb/qmlviewer.svg)](https://github.com/tim-sueberkrueb/qmlviewer/issues)
[![Maintained](https://img.shields.io/maintenance/yes/2018.svg)](https://github.com/tim-sueberkrueb/qmlviewer/commits/develop)

A simple QML file viewer for Ubuntu

QML Viewer is available for download from the [Open Store](https://open-store.io/app/qmlviewer.timsueberkrueb).

## Dependencies

Qt >= 5.4.0 with at least the following modules is required:

 * [qtbase](http://code.qt.io/cgit/qt/qtbase.git)
 * [qtdeclarative](http://code.qt.io/cgit/qt/qtdeclarative.git)

The following modules and their dependencies are required:

 * [Ubuntu UI Toolkit 1.3](https://github.com/ubports/ubuntu-ui-toolkit)

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
