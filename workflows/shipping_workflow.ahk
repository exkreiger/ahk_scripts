CoordMode, Mouse, Screen

!\::
MouseMove, 554, 461, 0
sleep 100
Click
sleep 100
Send ^c
Clipwait
return

F1 & 1::
  SendMode, event
  InputBox, number, row count, How many rows to delete leading zeroes from?
  i=0
  while i<=number
	{
	  Send {Enter}
	  Sleep 300
	  Send {Up}
	  Sleep 300
	  Send {Delete}
	  Sleep 300
	  Send {Enter}
	  Sleep 300
	  i=i+1
	}
  MsgBox, Finished!
return

!z::
  Reload
  return

!#z::
  SetTimer,WatchMouse,1000000
  WatchMouse:
  MouseGetPos,X,Y
  ToolTip,X%X%`,Y%Y%
  return

#1::
  Edit
  return

!^+z::
  Run "C:\Users\Dell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\product_add_workflow.ahk"
  ExitApp
  return

#!c::
  MsgBox, SHIPPING
return

;MAIN SHIPPING
!a::
  MouseMove, 2873, 289, 0
  Sleep 100
  Click
  return

!1::
  MouseMove, 1734, 180, 0 
  Click
  Click
  Click
  return

!2::
  MouseMove, 3130, 317,  0
  Sleep 300
  MouseMove, 3132, 317, 0
  Click
  return

!3::
  MouseMove, 2920, 813, 0
  Click
  Sleep 4000
  MouseMove, 2916, 854, 0
  Click
  Sleep 750
  Click
  Sleep 8000
  MouseMove, 1734, 180, 0 
  Click
  Click
  Click
  return 

!4::
  MouseMove, 3041, 443, 0 
  Click
  Sleep 1000
  MouseMove, 2930, 754, 0
  Sleep 100
  Click
  Send !3
  return

;;UPDATE
!0::
  Send ^a
  Sleep 50
  Send ^c
  Sleep 50
  Send ^t
  Sleep 50
  Send ^v
  Sleep 50
  Send {Enter}
  Sleep 6000
  ;nav to url bar
  ;MouseMove, 1666, 51, 0
  Send ^p
  Sleep 3000
  Send {Enter}
  Sleep 500
  Send ^w
  Sleep 100
  ;nav to click off of shipstation url, inactive spot
  MouseMove, 2298, 629, 0
  Click
  Send !3
  return

!9::
  Send ^a
  Sleep 50
  Send ^c
  Sleep 50
  Send ^t
  Sleep 50
  Send ^v
  Sleep 50
  Send {Enter}
  Sleep 6000
  ;nav to url bar
  ;MouseMove, 1666, 51, 0
  Send ^p
  Sleep 3000
  Send {Enter}
  Sleep 500
  Send ^w
  Sleep 100
  ;nav to click off of shipstation url, inactive spot
  MouseMove, 2298, 629, 0
  Click
  Sleep 100
  Send !6
  return

;international switch on
!8::
  ;settings
  MouseMove, 3215, 133, 0
  Sleep 100
  Click
  Sleep 600
  ;document options
  MouseMove, 2457, 272, 0
  Sleep 100
  Click
  Sleep 200
  ;labels printer select
  MouseMove, 2198, 364, 0
  Sleep 100
  Click
  Sleep 200
  ;preview in browser
  MouseMove, 2424, 455, 0
  Sleep 100
  Click
  Sleep 200
  ;exit modal
  MouseMove, 2679, 302, 0
  Sleep 100
  Click
  Sleep 200
  ;orders screen
  MouseMove, 2011, 130, 0
  Sleep 100
  Click
  Sleep 200
  Send !1
return


;international switch off
!7::
  ;settings
  MouseMove, 3215, 133, 0
  Sleep 100
  Click
  Sleep 600
  ;document options
  MouseMove, 2457, 272, 0
  Sleep 100
  Click
  Sleep 200
  ;labels printer select
  MouseMove, 2198, 364, 0
  Sleep 100
  Click
  Sleep 200
  ;shipstation connect
  MouseMove, 2453, 392, 0
  Sleep 100
  Click
  Sleep 400
  ;mousedown to prep for zebra
  Sleep 100
  MouseMove, 2441, 684, 0
  Sleep 200
  Send {WheelDown}
  Sleep 200
  ;zebra select
  Click
  Sleep 200
  ;orders screen
  MouseMove, 2011, 130, 0
  Sleep 100
  Click
  Sleep 200
  Send !1
return

;international with weight ship
!6::
  ;create label
   MouseMove, 2920, 813, 0
  Click
  Sleep 4000
  MouseMove, 2916, 854, 0
  Click
  Sleep 750
  Click
  Sleep 5500
  ;select to print the preview
  MouseMove, 3163, 208, 0
  Sleep 150
  Click
  Sleep 3500
  ;blue print button
  MouseMove, 2952, 786, 0
  Sleep 100
  Click
  Sleep 200 
  ;escape modal
  MouseMove, 3197, 151, 0
  Sleep 100
  Click
  Sleep 200
  Send !1  
return

;international no weight ship
!5::
  ;weigh
  MouseMove, 3045, 442, 0
  Sleep 50
  Click
  Sleep 1000
  ;save default
  MouseMove, 2914, 777, 0
  Sleep 150
  Send !6
return