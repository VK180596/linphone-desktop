import QtQuick 2.7

import Common 1.0
import Linphone 1.0
import Linphone.Styles 1.0
import Utils 1.0

import App.Styles 1.0
import '../../../../modules/Linphone/Codecs/CodecsWindow.js' as Logic

// =============================================================================

AssistantAbstractView {
  //property var fileDownloader

  title: qsTr('DO YOU AGREE TO DOWNLOAD \nOPENH264 VIDEO CODEC PROVIDED BY CISCO SYSTEMS,INC.?')

  Row {
    anchors.horizontalCenter: title.horizontalCenter
    anchors.bottomMargin: parent.bottomMargin
    anchors.topMargin: parent.topMargin
    
    spacing: DownloadOpenH264Style.buttons.spacing
    width: DownloadOpenH264Style.buttons.button.width



    TextButtonA {
      text: qsTr('no')

      height: DownloadOpenH264Style.buttons.button.height
      width: parent.width

      onClicked: window.setView('Home')
    }
    TextButtonB {
      text: qsTr('yes')
      height: DownloadOpenH264Style.buttons.button.height
      width: parent.width
      onClicked: fileDownloader.download()
    }
  }

  // ---------------------------------------------------------------------------
  // fileDownloader.
  // ---------------------------------------------------------------------------
 FileDownloader  {
    id: fileDownloader
    url: 'http://ciscobinary.openh264.org/libopenh264-1.5.0-android19.so.bz2'
	onDownloadingChanged: {
		  assistant.pushView('DownloadProgressBar', {
          fileDownloader: fileDownloader
          })
    }
	onDownloadFinished: {
		window.attachVirtualWindow(Utils.buildDialogUri('InfoDialog'), {
        descriptionText:  qsTr('Codec DownloadFinished.')
        }, function (status) {
			window.setView('Home')
		})
	} 
  }  
}
