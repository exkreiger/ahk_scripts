CoordMode, Mouse, Screen

;MISC PROJECTS
!^\::
  InputBox, rows, getting ur rows, How many rows to delete leading 0s?
  i := 0
  while i <= rows
  {
	MouseMove, 243, 218, 0
        Sleep 25
  	Click 2
	;Send {Enter}
  	Sleep 25
	Send {Up}
 	Sleep 25
	Send {Delete}
	Sleep 25
	Send {Enter}
	Sleep 25
	i := i + 1
  }
MsgBox, Finished!
return

!\::
  Send ^c
  Clipwait
  Sleep 100
  Send !v
  Sleep 50
  MouseMove, 3313, 424, 0
  Sleep 50
  Click
  Sleep 100
  Send {Home}
  Sleep 300
  MouseMove, 2405, 359, 0
  Sleep 100
  Click 4
  Sleep 100
  Send ^v
  Sleep 200
  Send {Enter}
return

;SCRIPT SPECIFIC UTILITIES
!z::
  Reload
  return

#1::
  Edit
  return

#!c::
  MsgBox, OPT / PHOTO / PRODUCT ADD
return

!#z::
  SetTimer,WatchMouse,1000000
  WatchMouse:
  MouseGetPos,X,Y
  ToolTip,X%X%`,Y%Y%
  return



!^+z::
  Run "C:\Users\Dell\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\shipping_workflow.ahk"
  ExitApp
  return

!1::
  MsgBox, 0,, LIST OF CONTROLS`n********************`nPRODUCT ADD`nAlt+q = product add page 1, with battery cover`nAlt + Shift + q = page 1 product add, nbc`nShift + q = continue from page 2`nAlt + w = product add page 4`nShift + w = continue from page 4`nAlt + e = product add page 5 (finish)`n`nAlt + Shift + w = reset product add page`n`nAlt + Ctrl + q = drag and drop new photo`n*******************`nPHOTO EDITING`nAlt + Shift + a = select to edit newest saved image`nAlt + Shift + s = drag and drop edited photo (REPLACE HORIZONTAL)`nAlt + Shift + d = drag and drop edited photo (REPLACE VERTICAL)`n*******************`nOPTIMIZATION`nCtrl + Alt + a = run optimization script (note, must have windows placed correctly)`nAlt + v = select "COMPLETE"`nAlt + x = send cursor to odat search`nCtrl + Shift = move a tab forward`nCtrl + Shift + Tab = move a tab backward`n********************`nMISCELLANEOUS`nAlt + Win + z = display cooridinates`nAlt + z = reload hotkey`nAlt + 1 = open the 'LIST OF CONTROLS' message box`nWin + 1 = edit the script`nShift + Ctrl + Alt + z = swap between alternate script (must be set up correctly)
  return


;PRODUCT ADD 
!q::
  MouseMove, 1559, 617,0
  Click
  Sleep 100
  MouseMove, 1559, 641,0
  Click
  Sleep 100
  MouseMove, 1559, 661, 0
  Click
  Sleep 100
  MouseMove, 2235, 778, 0
  Sleep 100
  Click
  return 

!+q::
  MouseMove, 1559, 617,0
  Click
  Sleep 100
  MouseMove, 1559, 640,0
  Click
  Sleep 100
  MouseMove, 1559, 665, 0
  Click
  Sleep 100
  MouseMove, 1559, 688, 0
  Sleep 100
  Click
  MouseMove, 2241, 778, 0
  Sleep 100
  Click
  
  return 

+q::
  Send {End}
  MouseMove, 2301, 741, 0
  Sleep 100
  Click
  return 

!^+w::
  MouseGetPos, xx, yy
  Send {Home}
  Sleep 100
  MouseMove, 2643, 329, 0
  Sleep 100
  Click  
  Sleep 100
  MouseMove, xx, yy, 0
  return

!w::
  MouseMove, 1549, 666, 0
  Click
  Sleep 100
  MouseMove, 1763, 666, 0
  Click
  Sleep 100
  MouseMove, 2007, 666, 0
  Sleep 100
  Click
  return

+^w::
  MouseMove, 2290, 737, 0
  Sleep 100
  Click
  return

!e::
  Send {End}
  Sleep 300
  MouseMove, 2302, 723, 0
  Sleep 100
  MouseMove, 2303, 724, 0
  Click
  return

!^q::
  MouseClickDrag, Left, 947, 151, 1678, 745, 5, 
  return

;select photo to edit
!+a::
  MouseMove, 1815, 38, 0
  Click
  MouseMove, 1760, 992, 0
  Click
  MouseMove, 1729, 573, 0
  Click 4
  return

;remove background
!+w::
  MouseMove, 1887, 34, 0
  Sleep 150
  Click
  MouseMove, 1729, 573, 0
  Sleep 150
  Click 2
  MouseMove, 2321, 483, 0
  Sleep 150
  Click
  MouseMove, 3178, 230, 0
  Sleep 150
  Click
  Sleep 150
  Send ^s
  Sleep 350
  Send {Enter} 
  Sleep 200
  Send {Enter}
  Sleep 200
  MouseMove, 1824, 33, 0
  Sleep 100
  Click
  MouseMove, 1729, 573, 0
  Sleep 200
  Click 2
return

;save a new pic
!+s::
  MouseClickDrag, Left, 1729, 573, 544, 481, 5
  return

;save a replacement pic
!+d::
  MouseClickDrag, Left, 1729, 573, 549, 645, 5
  return


/* ;; DEPRECATED, USING OPT GEN SCRIPT NOW -- POSTERITY
;OPTIMIZATION HOTKEY
!^a::
 startTime := A_TickCount
 SendMode, Input
clipboard := ""

;start @ sku
;289 484
   MouseGetPos, startx, starty
   Send ^c
   ClipWait
   sku := Trim(clipboard)
   clipboard := ""
;product id from asin field
   ;630 ""
   MouseMove, startx+341, starty, 0
   Sleep 200
   Click 2
   Sleep 350
   Send ^c
   ClipWait
   productId := Trim(clipboard)
   clipboard := ""
;mpn
   ;878 ""
   MouseMove, startx+589, starty, 0
   Sleep 200
   Click 2
   Sleep 350
   Send ^c
   ClipWait
   mpn := Trim(clipboard)
   clipboard := ""
   
;test
;MsgBox, %sku%`n%productId%`n%mpn%
   
;shipstation
   MouseMove, 1707, 703, 0
   Sleep 250
   Click 4
   Sleep 250
   Send %mpn%
   Sleep 350
   Send {Enter}

;processing logs
   MouseMove, 2439, 434, 0
   Sleep 100
   Click
   Sleep 100
   Send {Home}
   Sleep 250
   Click 2
   Send %sku%

;serp
   MouseMove, 2354, 58, 0
   Sleep 250
   Click
   ;search field
   MouseMove, 1918, 169, 0
   Sleep 100
   Click 3
   Sleep 250
   Send %mpn% remote control
   Sleep 300
   Send {Enter}
   Sleep 150

;google ads
   ;products buttons space
   MouseMove, 2718,236, 0
   Sleep 100
   Click
   Sleep 100
   Send {Home}
   Sleep 400
   ;filter
   MouseMove, 2781, 520, 0
   Sleep 350
   Click
   ;item id filter
   MouseMove, 2807, 239, 0
   Sleep 300
   Click
   Sleep 350
   ;blue item id
   MouseMove, 2778, 287, 0
   Sleep 250
   Click
   Sleep 200
   Click
   Sleep 450
   ;filter search field
   MouseMove, 2780, 423, 0
   Sleep 300
   Click 3
   Sleep 450
   Send %productId%
   Sleep 300
   ;click apply
   MouseMove, 2881, 506, 0
   Sleep 350
   Click
   ;return home
   ; near target
   ;241 455
   ;448 592

;SPLIT TIM FOR TRACKING 
if WinExist("Online Split Timer - Google Chrome")
	WinActivate
        MouseMove, 823, 407, 0
        Sleep 200
        Click
        Sleep 50
        WinSet, Bottom

;select page safely
;256 462
;447 604
   MouseMove, 493, 130, 0
   Sleep 150
   Click
   MouseMove, startx+191, starty+142, 0
   clipboard := Trim(sku)



    ;end


   endTime := A_TickCount
   runTime := (endTime - startTime)/1000
   ;MsgBox, took %runTime% seconds  
 
return
*/