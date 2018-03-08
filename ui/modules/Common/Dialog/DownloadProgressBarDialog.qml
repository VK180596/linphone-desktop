import QtQuick 2.7
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

import Common 1.0
import Linphone 1.0
import LinphoneUtils 1.0
import Linphone.Styles 1.0
import Utils 1.0

// =============================================================================

DialogPlus {
    id: dialog
	property var fileDownloader
	descriptionText: qsTr('DOWNLOADING CODEC')
	
    ProgressBar {
         id: progressBar

         height: ChatStyle.entry.message.file.status.bar.height
         width: 500

         to: fileDownloader.totalBytes
         value: fileDownloader.readBytes
         indeterminate : true

         background: Rectangle {
            color: ChatStyle.entry.message.file.status.bar.background.color
            radius: ChatStyle.entry.message.file.status.bar.radius
         }

         contentItem: Item {
            Rectangle {
               color: ChatStyle.entry.message.file.status.bar.contentItem.color
               height: parent.height
               width: progressBar.visualPosition * parent.width
            }
         }
     }
     
     Text {
         color: ChatStyle.entry.message.outgoing.text.color
         elide: Text.ElideRight
         font {
            bold: true
            pointSize: ChatStyle.entry.message.outgoing.text.pointSize
         } 

         text: {
            var fileSize = Utils.formatSize(fileDownloader.totalBytes)
            return Utils.formatSize(fileDownloader.readBytes) + '/' + fileSize
         }
      }
      
      centeredButtons: true
      height: 300
      width: 560
}
