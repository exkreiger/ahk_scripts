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

!a::
  MouseMove, 2873, 289, 0
  Sleep 100
  Click
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

;MAIN SHIPPING
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
  Sleep 7000
  Send !1
  Sleep 100
  Send !1
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


/*
;*****GUI FOR OPTIMIZATION DATA GENERATOR
!+1::

;TODO:::::::::::::::
;tags: 	
;	#ap = asin present and asin ranking > 40,000 and ebay high > asin low + 4$
;	#ep = asin present and asin ranking < 30,000 and ebay high < asin low + 4$
;	#gso = conversions = 0 and cost > .25(current price) OR
;		conversions > 0 and cost / conversion > .15(current price)
;	#comp = sku contains "_NEW" and asin present
;	#am = no #ap and no #ep and asin present and asin low - ebay high < 4$

;suggested price:
;	if not #ap and asin present, amazon low price + shipping - 5$ (shipping)
;	if else, ebay high + .10(ebay high)
;	if the low ebay price is < 11.99, suggested price = 11.99

;add/never:
;	never if # processed > 2x#sold and suggested price < 16
;	never if 0 sold and inventory > 2
; 	else add



;GUI****************

Gui, New,,OPTIMIZATION GENERATOR

sku = testsku_NEW
mpn = testmpn
pid = testpid


Gui, Add, Text,x65 y5, SKU
Gui, Add, Button, x150 y5 w150 vskuGui gskuGui, %sku% 

Gui, Add, Text,x65 y40, MPN
Gui, Add, Button, x150 y40 w150 vmpnGui gmpnGui, %mpn%

Gui, Add, Text,x65 y75, PRODUCT_ID`n
Gui, Add, Button, x150 y75 w150 vpidGui gpidGui, %pid%


Gui, Add, Text,x5 , `n##ODAT
Gui, Add, Text,, Number In Stock
Gui, Add, Edit, vqoh gQOH
Gui, Add, Text,, Number Processed
Gui, Add, Edit, vprocCount gPROC_COUNT

;Gui, Add, Text,, Current Price
;Gui, Add, Edit, vcurrPrice ;gCURR_PRICE

Gui, Add, Text,, `n##SHIPSTATION
Gui, Add, Text,, Quantity Sold
Gui, Add, Edit, vqSold gQ_SOLD

Gui, Add, Text, , `n##AMAZON
Gui, Add, Text,, ASIN
Gui, Add, Edit, vasin gASIN
Gui, Add, Text,, ASIN Ranking
Gui, Add, Edit, vasinRanking gASIN_RANKING
Gui, Add, Text,, Lowest Price + Shipping
Gui, Add, Edit, vasinLow gASIN_LOW

Gui, Add, Text, ,`n##EBAY
Gui, Add, Text,, Ebay Target Price
Gui, Add, Edit, vebayTarget gEBAY_TARGET

Gui, Add, Text, ,`n##GOOGLE ADS
Gui, Add, Text,, Cost
Gui, Add, Edit, vgoogCost gGOOG_COST
Gui, Add, Text,, Conversions
Gui, Add, Edit, vgoogConversions gGOOG_CONVERSIONS

Gui, Add, Text,x150 y210, ##################################
Gui, Add, Text,x200 y+10, ///GENERATED DATA\\\
Gui, Add, Text, x175 y+10, TAGS 
Gui, Add, Edit, w170 vtags gTAGS Disabled

Gui, Add, Text, y+10, SUGGESTED PRICE
Gui, Add, Edit, w170 vsuggPrice gSUGG_PRICE Disabled

Gui, Add, Text, y+10, ADD // NEVER
Gui, Add, Edit, w50 vaddNever gADD_NEVER Disabled

Gui, Add, Text,x200 y+10, \\\GENERATED DATA///
Gui, Add, Text,x150 y+10, ##################################



;;;;;;;;;;;;;;;;;;;;

Gui, Add, Button, x170 y560 w200 h60 Default gGENERATE, GENERATE

;copy buttons
Gui, Add, Button, x350 y274 w20 vtagCopy gTAG_COPY, COPY
Gui, Add, Button, x350 y324 w20 vpriceCopy gPRICE_COPY, COPY

Gui, Show, x0 y0 w400 h725

return

        ;LABELS****************


;	BUTTONS ***************

GENERATE:
Gui, Submit, NoHide
Gosub, TAGS
return

RANDOM_THOUGHT:
return

skuGui:
Gui, Submit, NoHide
clipboard = %sku%
clipwait
return

mpnGui:
Gui, Submit, NoHide
clipboard = %mpn%
clipwait
return

pidGui:
Gui, Submit, NoHide
clipboard = %pid%
clipwait
return


TAGS:
    Gui, Submit, NoHide

    apbool := 0
    epbool := 0
    gsobool := 0
    compbool := 0
    ambool := 0
    asinbool := 0

    aptag := "#AP"
    eptag := "#EP"
    gsotag := "#GSO"
    comptag := "#COMP"
    amtag := "#AM"

    asinLowPlus := asinLow + 5
    asinMidRank := 25000
    asinHighRank := 10000
    cpc := googCost / googConversions

    floorPrice := 11.99
    amaPrice := asinLow - 5

    marketDiff := Abs(amaLow - ebayTarget) ;4
    marketAvg := (amaLow + ebayTarget)/2 ;22
    acceptDiff := .15*marketAvg ;3.9
    

    if (InStr(asin, "B")){
      asinbool := 1
    }

    tagstring := ""
    
    ;pricing and tag condition setting
    if (asinbool && marketDiff <= acceptDiff && amaPrice >= floorPrice) {
     price := amaPrice
     ambool := 1  
    } else if ((asinbool && amaPrice > ebayTarget && marketDiff >= acceptDiff && asinRanking < asinMidRank) || (asinbool && && ebayTarget < 1.5*amaPrice && amaPrice < floorPrice && amaPrice > 1.5 && asinRanking < asinHighRank) ){
      price := amaPrice
      epbool :=1
    } else {
      ;if ((asinbool && amaPrice < ebayPrice && marketDiff >= acceptDiff) || (asinRanking < asinMidRank && asinbool && amaPrice < ebayPrice && marketDiff >= acceptDiff))
          apbool :=1
          price := ebayTarget  
        if (price < floorPrice){
        price := floorPrice
        }
    }

      ;setting #GSO condition
        if ((googConversions = 0 && googCost > (price * 1.25)) || (googConversions > 0 && cpc > (price * .17)) || price < 7.99) {
        gsobool:=1
        }

      ;setting #COMP condition
        if (InStr(sku, "_NEW") && asin > 0 && !apbool) {
        compbool:=1
        }

      ;tagging
        if (apbool) {
          tagstring=%tagstring%%aptag%
        }
        if (epbool){
          tagstring=%tagstring%%eptag%
        }
        if (gsobool){
          tagstring=%tagstring%%gsotag%
        }
        if (compbool){
        tagstring=%tagstring%%comptag%
        }
        if (ambool){
          tagstring=%tagstring%%amtag%
        }

      ;final tagstring
        GuiControl,,tags, %tagstring%
        clipboard = %tagstring%
        clipwait
        Gosub, SUGG_PRICE
        
      return

TAG_COPY:
  Gui, Submit, NoHide
  clipboard = %tagstring%
return

SUGG_PRICE:
  Gui, Submit, NoHide
  price := Format("{:.2f}", price)
  GuiControl,, suggPrice, %price%
  clipboard = %price%
  clipwait
  Gosub, ADD_NEVER
return

PRICE_COPY:
  Gui, Submit, NoHide
  clipboard = %price%
return

ADD_NEVER:
  Gui, Submit, NoHide

  if ((qoh > qSold * 2) || (qSold = 0 && qoh > 2) ){
    GuiControl,, addNever, NEVER
  } else {
    GuiControl,, addNever, ADD
  }

return

;FIELDS**********************

QOH:
Gui, Submit, NoHide
return

PROC_COUNT:
Gui, Submit, NoHide
return

CURR_PRICE:
Gui, Submit, NoHide
return

Q_SOLD:
Gui, Submit, NoHide
return

ASIN:
Gui, Submit, NoHide
return

ASIN_RANKING:
Gui, Submit, NoHide
return

ASIN_LOW:
Gui, Submit, NoHide
return

EBAY_TARGET:
Gui, Submit, NoHide
return

GOOG_COST:
Gui, Submit, NoHide
return

GOOG_CONVERSIONS:
Gui, Submit, NoHide
return

;end of generator gui
return









;EXAMPLE GUI WITH SOME SIMILAR FUNCTIONALITY I'M SHOOTING FOR BELOW*******************************



!+2::
Gui, Add, Edit, x62 y15 w100 h30 vEdit1 gSet100 R1
Gui, Add, Edit, x242 y15 w100 h30 vEdit2 Disabled R1
Gui, Add, Edit, x62 y60 w100 h30 vEdit3 gSet50 R1
Gui, Add, Edit, x242 y60 w100 h30 vEdit4 Disabled R1
Gui, Add, Edit, x242 y110 w100 h30 vTotal Disabled R1
Gui, Add, ListView, x62 y170 w230 h300 vLV_Neg, s no|100|50|total 

;^^^this listview box is for negative values and i added s no column also in it which should contain the serial no as the negative values are entered in this box.

Gui, Add, ListView, x+10 y170 w230 h300 vLV_Pos, s no|100|50|total ; same listview box for positive values.
for i, LV in ["LV_Neg", "LV_Pos"] {
	Gui, ListView, %LV%		; Sets the listview to operate on
	for Col, Width in [40, 60, 60, 70]	; Modifies the column widths
		LV_ModifyCol(Col, Width)
}
Gui, Add, Text, x402 y20 w130 h20 vText1, no of negative values
Gui, Add, Text, x402 y50 w130 h20 vText2, total of negative value
Gui, Add, Edit, x542 y20 w100 h20 vEdit5 Disabled, 0 

;^^^in this edit box i want that there should come only the total no of negative values. say there are 10 nagative values in negative listview box then it should contain only no 10

Gui, Add, Edit, x542 y50 w100 h20 vEdit6 Disabled, 0
Gui, Add, Button, x62 y120 w100 h30 gNext Default, NEXT
Gui, Show,, Untitled GUI
Pos_Count := 0
return

Set100:
Gui, Submit, NoHide
Edit2 := Edit1 * 100
GuiControl,, Edit2, %Edit2%
gosub, SetTotal
return

Set50:
Gui, Submit, NoHide
Edit4 := Edit3 * 50
GuiControl,, Edit4, %Edit4%
gosub, SetTotal
return

SetTotal:
Total := 0
if Edit2 is number
    Total += Edit2
if Edit4 is number
    Total += Edit4
GuiControl,, Total, %Total%
return

Next:
Gui, Submit, NoHide
if (Total < 0) {
	GuiControl,, Edit5, % ++Edit5				; total number of negative values
	GuiControl,, Edit6, % Edit6 += Total		; total of all negative values
	Gui, ListView, LV_Neg
}
else {
	Pos_Count++
	Gui, ListView, LV_Pos
}
LV_Insert(1,, Edit5 + Pos_Count, Edit1, Edit3, Total)

for i, c in ["Edit1", "Edit2", "Edit3", "Edit4", "Total"] {		; Clear these edit boxes
	%c% := ""
	GuiControl,, %c%, % %c%
}
GuiControl, Focus, Edit1
return

*/