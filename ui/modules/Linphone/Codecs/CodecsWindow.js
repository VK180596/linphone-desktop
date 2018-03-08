// =============================================================================
// `SettingsVideo.qml` Logic.
// =============================================================================

.import Linphone 1.0 as Linphone
.import 'qrc:/ui/scripts/Utils/utils.js' as Utils
// =============================================================================
function downloadCodec (fileDownloader) {
  window.attachVirtualWindow(Qt.resolvedUrl('../../../views/App/Settings/Dialogs/SettingsDownloadOpenH264.qml'), {
    fileDownloader: fileDownloader
  })
}

function downloadProgress (fileDownloader) {
  window.attachVirtualWindow(Qt.resolvedUrl('../../Common/Dialog/DownloadProgressBarDialog.qml'), {
     fileDownloader: fileDownloader
  })
}

function downloadFinished () {
	window.detachVirtualWindow()
	window.attachVirtualWindow(Utils.buildDialogUri('InfoDialog'), {
     descriptionText:  qsTr('Codec DownloadFinished.')
     }, function (status) {})
}