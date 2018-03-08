import QtQuick 2.7

import Common 1.0
import Linphone 1.0

import App.Styles 1.0
// =============================================================================

DialogPlus {
  id: dialog
  property var fileDownloader
  descriptionText: qsTr('DO YOU AGREE TO DOWNLOAD OPENH264 VIDEO CODEC PROVIDED BY CISCO SYSTEMS,INC.?')

  buttons: [
    TextButtonA {
      text: qsTr('cancel')

      onClicked: exit(0)
    },
    TextButtonB {
      text: qsTr('confirm')

      onClicked: { 
		  exit(1)
		  fileDownloader.download()
    }} 
  ]

  centeredButtons: true
  height: SettingsDownloadOpenH264Style.height
  width: SettingsDownloadOpenH264Style.width 
}
