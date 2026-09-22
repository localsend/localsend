# Live Photo sending checks

Use an iPhone with a locally stored Live Photo, a Live Photo stored only in
iCloud, an ordinary photo, and an ordinary video. Use another device as the
receiver. For reception as a Live Photo, use an iOS build with Live Photo support
and enable both saving to the gallery and saving as Live Photo.

First, on iOS with advanced settings off, confirm **Settings > Send > Send Live
Photo video** is visible and off by default. Select a Live Photo and confirm
only its still image is added. Enable the setting, restart the app, and confirm
it remains enabled. Clear the selection before continuing; changing the setting
does not remove already selected files. The checks below use the enabled setting.

1. In LocalSend, choose **Media**, select one Live Photo, and confirm. The
   selection should contain an image and a video with the same basename, for
   example `IMG_1234.HEIC` and `IMG_1234.MOV`. Both should have nonzero sizes.
2. Send both files to a desktop. Confirm that both arrive, the image opens, and
   the video plays with sound when the original contains sound. The sender
   exports the resources without requesting video conversion.
3. Send both files to iOS with Live Photo reception enabled. Confirm that the
   Photos app shows one playable Live Photo. Also check a Live Photo whose key
   frame or duration has been edited in Photos, since the plugin chooses the
   available paired video resource.
4. Select the same Live Photo again. Neither component should be duplicated.
   Remove just one component and reselect the asset; the missing component
   should return with its counterpart's basename.
5. Select two different Live Photos with identical original filenames. The
   second pair should share a suffix, such as `IMG_1234 (2)`. Send both pairs
   and confirm that the photos are not matched with each other's videos.
6. Select a mixture of Live Photos, ordinary photos, and ordinary videos.
   Ordinary assets should still add one file each.
7. Select a Live Photo that needs downloading from iCloud. A loading indicator
   should remain visible until both components are ready. If the download or
   export fails, an error should appear, the previous selection should remain,
   and no part of the failed batch should be added. Retry with network access.

This change covers the in-app **Media** picker. Sharing from Apple's Photos
app into LocalSend uses `share_handler` and is a separate path. A receiver
without Live Photo support receives the two component files separately.

Automated coverage is in `unit/util/native/live_photo_selection_test.dart`.
It uses simulated library assets and real temporary files; it cannot validate
PhotoKit/iCloud behavior or native Live Photo reconstruction on a device.
