CoordMode, Mouse, Screen

;UTILITIES
;temp hk for refactoring variables and logic, marking things to keep
!q::
SendInput `;OKTG
return

;temp hk for refactoriing -- things to probably trash
!w::
SendInput `;TRASH
return

!z::
Reload
return

!#z::
  SetTimer,WatchMouse,1000000
  WatchMouse:
  MouseGetPos,X,Y
  ToolTip,X%X%`,Y%Y%
  clipboard = %X%, %Y%, 0
  clipwait
  return

#1::
  Edit
  return

;OPTIMIZATION HOTKEY
!^a::
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
   pid := Trim(clipboard)
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
   
;shipstation
   MouseMove, 1722, 710, 0
   Sleep 250
   Click 4
   Sleep 250
   Send %mpn%
   Sleep 350
   Send {Enter}

;processing logs
   MouseMove, 2450, 401, 0
   Sleep 100
   Click
   Sleep 100
   Send {Home}
   Sleep 250
   Click 2
   Send %sku%

;serp
   MouseMove, 2401, 61, 0
   Sleep 250
   Click
   ;search field
   MouseMove, 1950, 168, 0
   Sleep 100
   Click 3
   Sleep 250
   Send %mpn% remote control
   Sleep 300
   Send {Enter}
   Sleep 150

;google ads
   ;products buttons space
   MouseMove, 2739, 236, 0
   Sleep 100
   Click
   Sleep 100
   Send {Home}
   Sleep 400
   ;filter
   MouseMove, 2772, 522, 0
   Sleep 350
   Click
   ;item id filter
   MouseMove, 2845, 244, 0
   Sleep 300
   Click
   Sleep 350
   ;blue item id
   MouseMove, 2807, 289, 0
   Sleep 250
   Click
   Sleep 200
   Click
   Sleep 450
   ;filter search field
   MouseMove, 2789, 425, 0
   Sleep 300
   Click 3
   Sleep 450
   Send %pid%
   Sleep 300
   ;click apply
   MouseMove, 2898, 508, 0
   Sleep 350
   Click

;select page safely
;256 462
;447 604
   MouseMove, 1297, 125, 0
   Sleep 150
   Click
   MouseMove, startx+191, starty+142, 0
   clipboard := Trim(sku)

;return

;*****GUI FOR OPTIMIZATION DATA GENERATOR

;todo-->>
;0--fix logic for ep vs ap (hint, there is something with base price of asin listing, and if a 
;    shipping cost is given)
;ama price == the lowest price on asin, minus shipping cost only if no shipping cost listed
;ebay price == ebay target - 4$
;compare these prices
;if the comparison is within .2, we're okay!


;\\1--make the GUI wide and slim to float above the odat product data line
;2--make a "current tag" field, then produce the corrected tag, and any actions that need
;   to be applied based on old / deleted tags (eg opt1, a30d)


;2--make a "current tag" field, then produce the corrected tag, and any actions that need
;   to be applied based on old / deleted tags (eg opt1, a30d)

;3 - fix spacing on new layout to fillout the unused space on rows 2 and 3

;<<<--- end todos



!+1::

;GUI****************

Gui, New,,OPTIMIZATION GENERATOR

;ROW 1 - DATA FROM OPT SCRIPT
Gui, Add, Text, x5 y5, ##ITEM DATA
Gui, Add, Text,x5 y25, SKU
Gui, Add, Button, x85 y25  w150 vskuGui gskuGui, %sku% 

Gui, Add, Text,x5 y115, MPN
Gui, Add, Button, x85 y115 w150 vmpnGui gmpnGui, %mpn%

Gui, Add, Text,x5 y200, PRODUCT_ID
Gui, Add, Button, x85 y200 w150 vpidGui gpidGui, %pid%

;ROW 2 - ODAT / serp
Gui, Add, Text, x240 y5, ##ODAT
Gui, Add, Text, x240 y25, Number In Stock
Gui, Add, Edit, x240 y40 vqoh gQOH

Gui, Add, Text, x240 y65, Number Processed
Gui, Add, Edit, x240 y80 vprocCount gPROC_COUNT

Gui, Add, Text, x240 y105, Current Price
Gui, Add, Edit, x240 y125 vcurrPrice gCURR_PRICE

Gui, Add, Text, x240 y150, ##SERP
Gui, Add, Text, x240 y165, Serp Ranking
Gui, Add, Edit, x240 y180 vserp gSERP



;ROW3 - amazon
Gui, Add, Text, x365 y5, ##AMAZON
Gui, Add, Text, x365 y25, ASIN
Gui, Add, Edit, x365 y40 vasin gASIN

Gui, Add, Text, x365 y65, ASIN Ranking
Gui, Add, Edit, x365 y80 vasinRanking gASIN_RANKING

Gui, Add, Text, x365 y105, Lowest Listing Price
Gui, Add, Edit, x365 y120 vasinLow gASIN_LOW

Gui, Add, Text, x365 y145, Lowest Listing shipping
Gui, Add, Edit, x365 y160 vasinShip gASIN_SHIP

;ROW4 -shipstation/ebay/google
Gui, Add, Text,x490 y5, ##SHIPSTATION
Gui, Add, Text, x490 y25, Quantity Sold
Gui, Add, Edit, x490 y40 vqSold gQ_SOLD

Gui, Add, Text, x490 y70 ,##EBAY
Gui, Add, Text,x490 y85 , Ebay Target Price
Gui, Add, Edit, x490 y100 vebayTarget gEBAY_TARGET

Gui, Add, Text, x490 y130 ,##GOOGLE ADS
Gui, Add, Text, x490 y145, Cost
Gui, Add, Edit, x490 y160 vgoogCost gGOOG_COST

Gui, Add, Text,x490 y185, Conversions
Gui, Add, Edit, x490 y200 vgoogConversions gGOOG_CONVERSIONS

Gui, Add, Text,x630 y5, ####################################
Gui, Add, Text,x675 y+10, //////GENERATED DATA\\\\\\

Gui, Add, Text, x630 y+20, TAGS 
Gui, Add, Edit, w200 vtags gTAGS Disabled
Gui, Add, Button, x+10 w20 vtagCopy gTAG_COPY, COPY

Gui, Add, Text, x630 y120, SUGGESTED PRICE
Gui, Add, Edit, w200 vsuggPrice gSUGG_PRICE Disabled
Gui, Add, Button, x+10 w20 vpriceCopy gPRICE_COPY, COPY

Gui, Add, Text, x630 y+20, ADD // NEVER
Gui, Add, Edit, w50 vaddNever gADD_NEVER Disabled

Gui, Add, Button, x170 y560 w200 h60 Default gGENERATE, GENERATE

Gui, Show, x0 y0 w890 h230
return

        ;LABELS****************


;	BUTTONS ***************

GENERATE:
Gui, Submit, NoHide
Gosub, TAGS
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

;OKTG
    apbool := 0
    epbool := 0
    gsobool := 0
    compbool := 0
    ambool := 0
    asinbool := 0
    serpbool := 0
;OKTG
    aptag := "#AP"
    eptag := "#EP"
    gsotag := "#GSO"
    comptag := "#COMP"
    amtag := "#AM"
    serptag := "#SEO"

    asinTotal := asinLow + asinShip
    ;TRASH?
    asinLowPlus := asinTotal + 5
    ;OKTG
    asinMidRank := 25000
    asinHighRank := 10000

    ;OKTG
    cpc := googCost / googConversions

;**;OKTG
    shipPrice = 5
    if (asinShip > 0){
      shipPrice := asinShip + .01
    }
    
    floorPrice := 11.99
    marketCutFactor := .15
    assumedShip := 4
    realFloor := (floorPrice - assumedShip - marketCutFactor*floorPrice)

    realAma := asinLow
    realEbay := ebayTarget - assumedShip

    compAma := realAma - realAma*marketCutFactor
    compEbay := realEbay - realEbay*marketCutFactor
    
    marketDiff := Abs(realAma - realEbay) ;
    marketAvg := (realAma + realEbay)/2 ;
    acceptDiff := .2*marketAvg ;
    
    ;TRASH -replace with realAma, similar realEbay
    ;possible deletes
    amaPrice := asinTotal - shipPrice
;oktg
    if (InStr(asin, "B")){
      asinbool := 1
    }
;OKTG
    if (serp is number){
        serpbool := 1
    }
;***************
    
    

;TRASH -- CHANGING
    ;pricing and tag condition setting
    if (asinbool && marketDiff <= acceptDiff && realAma >= realFloor) {
     price := realAma
     ambool := 1  
    } else if ((asinbool && compAma > compEbay && marketDiff >= acceptDiff && asinRanking < asinMidRank) || (asinbool && && realEbay < realAma && amaPrice < floorPrice && amaPrice > 1.5 && asinRanking < asinHighRank) ){
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

    tagstring := ""

      ;setting #GSO condition
        if ((googConversions = 0 && googCost > (price * 1.25)) || (googConversions > 0 && cpc > (price * .17)) || price < 7.99) {
        gsobool:=1
        }

      ;setting #COMP condition
        if (InStr(sku, "_NEW") && asin > 0 && !apbool) {
        compbool:=1
        }

      ;tagging
        if (serpbool) {
        serptag = %serptag%%serp%
        tagstring = %tagstring%%serptag%
    }
        if (gsobool){
          tagstring=%tagstring%%gsotag%
        }
        if (compbool){
        tagstring=%tagstring%%comptag%
        }
        if (apbool) {
          tagstring=%tagstring%%aptag%
        }
        if (epbool){
          tagstring=%tagstring%%eptag%
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
SERP:
Gui, Submit, NoHide
return

ASIN_SHIP:
Gui, Submit, NoHide
return

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
