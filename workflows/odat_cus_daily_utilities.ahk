CoordMode, Mouse, Screen

;odat utilities
!x::
  MouseMove, 1557, 127, 0
  Sleep 100
  Click 3
  Sleep 100
  Send {Home}
  Sleep 150
  MouseMove, 1515, 368, 0
  Sleep 50
  Click 3
  return

!v::
;312 623
;369 863
  MouseGetPos, xx, yy
  Click, right
  Sleep 100
  MouseMove, xx+57, yy+240, 0
  Sleep 100
  Click
  Sleep 100
  MouseMove, xx, yy, 0
  return

  ;CS TEXT

!d::
  SendInput `nYou can return the remote at any time to the following address:`n`nRCD`n951 Washington Blvd`nSTE 517`nRoseville, CA, 95678`n`nWe'll issue you a refund when it arrives, or when you can forward us the tracking number.
  return

!t::
  FormatTime, today,, ShortDate
  SendInput %today% RETURNED / REFUNDED
  return

!f::
  SendInput, `n`nThank you for your recent purchase, and I'm sorry to hear about this issue with the remote.
  return

!j::
  SendInput -Josh, Remote Control Depot
  return

!l::
  SendInput -Josh, Lifetime Warranty Remotes
  return

!h::
  SendInput Thank you for your business, and we hope you and your loved ones stay safe and healthy,
  return