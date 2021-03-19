CoordMode, Mouse, Screen

;UTILITIES
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

;OPTIMIZATION HOTKEY
;#TUTORIAL::
;Loom link: 
;   Press Ctrl + F in the document and search for "#CHANGE"
;   At each change location perform the following steps in the code
;   When the changed is made, write "done" on the same line so you can keep track of the parts that have been updated to your screen layout
;       example: #CHANGE done
;
;   Please pay attention to any #NOTE tags for special instructions
;
;   ---LINES WITH #REF COORDS
;   Navigate to the right-most part of the area of the odat page where the labeled data is 
;     --example in loom
;     click once to make sure that this point on the screen highlights the data that you want
;   Without moving your mouse cursor, press Alt + Windows Key + z, then paste in below the line that says "#REF COORDS"
;     these coords are for reference later 
;   
;   If there is a #REF COORDS tag under the #CHANGE tag, inspect the line starting with "MouseMove" below. 
;     it should have an "x+[number]" section on that line
;   to get [number], subtract the first number in the coordinate that is produced when you hit ctrl + win + z (x cooridinate)
;     and subtract it from the first number that was produced at the #STARTING REF tag coordinates
;   This is the [number] that you will put in x+[number]
;   repeat this step for the #CHANGE tag sections that are marked with #REF COORDS
;
;   ---LINES WITHOUT #REF COORDS
;   For the rest of the #CHANGE tags, simply hover to the point on your screen that is described in the note
;     Also, make sure to reference the loom video for details on each cooridinate location
;   Once to the point, press ctrl + win + z, the copy over the data that is bracketed in the below example
;     Example data to replace: MouseMove, [1297, 125, 0] -- the bracketed data can be selected and replaced
;
;   Make sure to write "done" next to each #CHANGE tag, and you should be done setting up the movement of the script for your screen in no time
;     just double check that the tags are all done, then test it out
;
; ---#running the script
;Hover underneath the sku of the item you are optimizing    
;Click to select the sku, when it is blue and selected you can run the script
;The main script will run with ctrl + alt + A
;
!^a::
 SendMode, Input
clipboard := ""

;#CHANGE done
;#SKU DATA
;#STARTING REF
;#NOTE - NO MouseMove to add coords to 
;#REF COORDS
;297, 669, 0
  MouseGetPos, startx, starty
  Send ^c
  ClipWait
  sku := Trim(clipboard)
  clipboard := ""
;#CHANGE
; #NOTE-- FOR THE BIN ONLY, GO ABOUT IN THE MIDDLE OF THE INVISIBLE "BOX" THE BIN DATA IS IN, THEN CLICK CTRL + WIN + Z, NOT THE RIGHT-MOST POINT
;#BIN DATA
;#REF COORDS
; 402, 662, 0
  MouseMove, startx+105, starty, 0
  Sleep 200
  Click 2
  Sleep 350
  Send ^c
  ClipWait
  cliptags := Trim(clipboard)
  clipboard := ""
;#CHANGE
;#PRODUCT ID DATA
;#REF COORDS
;586, 669, 0
;-20
  MouseMove, startx+269, starty, 0
  Sleep 200
  Click 2
  Sleep 350
  Send ^c
  ClipWait
  pid := Trim(clipboard)
   clipboard := ""
;#CHANGE
;#MPN DATA
;#REF COORDS
;873, 676, 0
;-20
  MouseMove, startx+556, starty, 0
  Sleep 200
  Click 2
  Sleep 350
  Send ^c
  ClipWait
  mpn := Trim(clipboard)
  clipboard := ""*
;#CHANGE
;#PRICE DATA
;#REF COORDS
;1109, 673, 0
;-40
  MouseMove, startx+772, starty, 0
  Sleep 200
  Click 2
  Sleep 350
  Send ^c
  ClipWait
  clipprice := Trim(clipboard)
  clipboard := ""
;#CHANGE
;#UPC / ASIN DATA
;#REF COORDS
;1188, 678, 0
;-40
  MouseMove, startx+851, starty, 0
   Sleep 200
   Click 2
   Sleep 350
   Send ^c
   ClipWait
   clipasin := Trim(clipboard)
   clipboard := ""

;#CHANGE
;#SHIPSTATION
; #NOTE - NAVIGATE TO THE LEFT-MOST SIDE OF THE "ITEM NAME" FIELD IN THE LOWER SHIPSTATION WINDOW
   MouseMove, 1722, 710, 0
   Sleep 250
   Click 4
   Sleep 250
   Send %mpn%
   Sleep 350
   Send {Enter}

;#CHANGE
;#PROCESSING LOGS
; #NOTE - NAVIGATE TO THE PROCESSING LOGS WINDOW, SCROLL TO THE TOP OF THE PAGE, AND HOVER OVER THE RIGHT-MOST SIDE OF THE SEARCH FIELD
   MouseMove, 2450, 401, 0
   Sleep 100
   Click
   Sleep 100
   Send {Home}
   Sleep 250
   Click 2
   Send %sku%

;#CHANGE
;#SERP CHECKER BUTTON
; #NOTE - NAVIGATE TO THE "SEO SERP | INSTANT RANK CHECKER" CHROME EXTENSION BUTTON
;     **MAKE SURE THIS IS THE BUTTON IN THE PROCESSING LOGS WINDOW**
;       HOVER THERE
   MouseMove, 2401, 61, 0
   Sleep 250
   Click
;#CHANGE
;#SERP SEARCH FIELD
; #NOTE - NAVIGATE TO THE SEARCH FIELD IN SERP CHECKER ADD-ON, IN THE TOP LEFT CORNER, HOVER THERE 
   MouseMove, 1950, 168, 0
   Sleep 100
   Click 3
   Sleep 250
   Send %mpn% remote control
   Sleep 300
   Send {Enter}
   Sleep 150

;#CHANGE
;#GOOGLE ADS - PRODUCTS BUTTON AREA
; #NOTE - NAVIGATE TO THE GOOGLE ADS WINDOW, SCROLL TO THE TOP, AND HOVER WHERE THERE IS A SMALL BLUE "PRODUCTS BUTTON", 
;   OR A LARGER BLACK "PRODUCTS" LABEL
   MouseMove, 2739, 236, 0
   Sleep 100
   Click
   Sleep 100
   Send {Home}
   Sleep 400
;#CHANGE
;#GOOGLE ADS - ADD FILTER BUTTON
; #NOTE - HOVER OVER THE "ADD FILTER" BUTTON ON THE MAIN PRODUCTS SEARCH PAGE
   MouseMove, 2772, 522, 0
   Sleep 350
   Click
;#CHANGE
;#GOOGLE ADS - RECENT FILTERS
; #NOTE - HOVER OVER ONE OF THE RECENT FILTERS THAT CONTAINS AN ITEM ID
   MouseMove, 2845, 244, 0
   Sleep 300
   Click
   Sleep 350
;#CHANGE
;#GOOGLE ADS - BLUE "ITEM ID CONTAINS" BUTTON
; #NOTE - HOVER OVER THE EXISTING BLUE FILTER BUTTON
   MouseMove, 2807, 289, 0
   Sleep 250
   Click
   Sleep 200
   Click
   Sleep 450
;#CHANGE
;#GOOGLE ADS - FILTER SEARCH FIELD
; #NOTE - HOVER OVER THE SEARCH TERMS FIELD FOR ITEM ID FILTER
   MouseMove, 2789, 425, 0
   Sleep 300
   Click 3
   Sleep 450
   Send %pid%
   Sleep 300
;#CHANGE
;#GOOGLE ADS - BLUE APPLY BUTTON
; #NOTE - HOVER OVER THE BLUE APPLY BUTTON IN THE ITEM ID FILTER
   MouseMove, 2898, 508, 0
   Sleep 350
   Click

;#CHANGE
;#ODAT SELECTION
; #NOTE - NAVIGATE BACK TO THE ODAT WINDOW, AND HOVER OF THE INACTIVE BAR OF GRAY TO THE LEFT OF YOUR TEST ITEM
   MouseMove, 1297, 125, 0
   Sleep 150
   Click


;***DO NOT EDIT BELOW THIS LINE***
;toggle comment below for lone gui testing
;return
;******************************************
;*****GUI FOR OPTIMIZATION DATA GENERATOR

;toggle comment below for lone gui testing 
;!+1::
;GUI****************
/*testing vars
clipasin := "testasinb"
cliptags := "#AP#GSO#COMP#OPT1#SEO99#A30D"
*/
clipprice := 11.99

Gui, New,,OPTIMIZATION GENERATOR

;ROW 1 - DATA FROM OPT SCRIPT
Gui, Add, Text, x5 y5, ##ITEM DATA
Gui, Add, Text,x5 y25, SKU
Gui, Add, Button, x85 y25  w150 vskuGui gSKUGUI, %sku% 

Gui, Add, Text,x5 y60, MPN
Gui, Add, Button, x85 y60 w150 vmpnGui gMPNGUI, %mpn%

Gui, Add, Text,x5 y95, PRODUCT_ID
Gui, Add, Button, x85 y95 w150 vpidGui gPIDGUI, %pid%

Gui, Add, Text,x5 y130, OLD TAGS
Gui, Add, Edit, x85 y130 w150 vcliptags gCLIP_TAGS Disabled, %cliptags%

Gui, Add, Button, x5 y205 w230 h20 Default gGENERATE, GENERATE

;ROW 2 - ODAT / serp
Gui, Add, Text, x240 y5, ##ODAT
Gui, Add, Text, x240 y25, Number In Stock
Gui, Add, Edit, x240 y40 vqoh gQOH

Gui, Add, Text, x240 y65, Number Processed
Gui, Add, Edit, x240 y80 vprocCount gPROC_COUNT

Gui, Add, Text, x240 y105, Current Price
Gui, Add, Edit, x240 y125 w120 vcurrPrice gCURR_PRICE Disabled, %clipprice%

Gui, Add, Text, x240 y150, ##SERP
Gui, Add, Text, x240 y165, Serp Ranking
Gui, Add, Edit, x240 y180 vserp gSERP

;ROW3 - amazon
Gui, Add, Text, x365 y5, ##AMAZON
Gui, Add, Text, x365 y25, ASIN
Gui, Add, Edit, x365 y40 w120 vasin gASIN, %clipasin%

Gui, Add, Text, x365 y65, ASIN Ranking
Gui, Add, Edit, x365 y80 vasinRanking gASIN_RANKING

Gui, Add, Text, x365 y105, Lowest Listing Price
Gui, Add, Edit, x365 y120 vasinLow gASIN_LOW

Gui, Add, Text, x365 y145, Lowest Listing shipping
Gui, Add, Edit, x365 y160 vasinShip gASIN_SHIP

Gui, Add, Text, x365 y185, # Current Sellers
Gui, Add, Edit, x365 y200 vasinSellers gASIN_SELLERS

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

Gui, Add, Text, x630 y+20, NEW TAGS 
Gui, Add, Edit, w200 vtags gTAGS Disabled
Gui, Add, Button, x+10 w20 vtagCopy gTAG_COPY, COPY

Gui, Add, Text, x630 y120, SUGGESTED PRICE
Gui, Add, Edit, w200 vsuggPrice gSUGG_PRICE Disabled
Gui, Add, Button, x+10 w20 vpriceCopy gPRICE_COPY, COPY

Gui, Add, Text, x630 y+20, ADD // NEVER
Gui, Add, Edit, w50 vaddNever gADD_NEVER Disabled




Gui, Show, x40 y60 w890 h230

Send !+^9
!+^9::
  WinSet, Topmost, on, OPTIMIZATION GENERATOR

return


;LABELS****************

  ;FIELDS**********************
CLIP_TAGS:
Gui, Submit, NoHide
return

ASIN_SELLERS:
Gui, Submit, NoHide
return

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


  ;BUTTONS ***************
GuiClose:
reload
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
; 
pidGui:
Gui, Submit, NoHide
clipboard = %pid%
clipwait
return

GENERATE:
Gui, Submit, NoHide
;new stuff for generation

    ;price types      
    amaSetPrice := asinLow
    ebaySetPrice := ebayTarget
    floorPrice := 11.99
    priceSuggestion := floorPrice

    ;bools for tags and states
    epbool := 0
    gsobool := 0
    compbool := 0
    ambool := 0
    apbool := 0
    asinbool := 0
    serpbool := 0
    loneasinbool := 0
    tagswapcheck := 0

    ;setting bools for evaluation
    if (InStr(asin, "B")){
      asinbool := 1
    }
    if (serp > 0){
      serpbool := 1
    }
    if (qoh > 0 
        && asinSellers = 1){
      loneasinbool := 1
    }

    if (InStr(sku, "_NEW") 
        && asinbool 
        && !apbool) {
      compbool:=1
    }

    ;tags
    aptag := "#AP"
    eptag := "#EP"
    gsotag := "#GSO"
    comptag := "#COMP"
    amtag := "#AM"
    serptag := "#SEO"
    tagstring := ""

    ;math vars
    marketCutFactor := .15
    regAssumeShip := 4
  
    ;amaAssumeShip
    amaAssumeShip := 5
        if (asinShip = 0 && asinbool){
          amaSetPrice := asinLow - amaAssumeShip
        } else if (asinShip > 0 && !loneasinbool){
          amaSetPrice := asinLow - .01
        }

    asinLowRank := 40000
    asinMidRank := 25000
    asinHighRank := 10000

    ;math fields
    realFloor := (floorPrice - regAssumeShip - (floorPrice*marketCutFactor))
    realAma := (amaSetPrice - (amaSetPrice*marketCutFactor))
    realEbay := (ebaySetPrice - regAssumeShip - (ebaySetPrice*marketCutFactor))
    marketDiff := Abs(realAma - realEbay)
    marketAvg := ((realAma + realEbay)/2)
    acceptDiff := marketAvg * .1
    cpc := (googCost / googConversions)
     

 ;NEW PRICING RULES
    ;#AM
    if (asinbool 
        && marketDiff <= acceptDiff 
        && asinRanking > asinHighRank 
        && amaSetPrice > floorPrice){
      priceSuggestion := amaSetPrice
      ambool := 1
      apbool := 0
      epbool := 0
    } 
    ;market exclusions / inclusions
    ;#EP
    else if ((asinbool  
            && asinRanking < asinLowRank
            && realAma > realEbay
            && marketDiff > acceptDiff)
              || (loneasinbool
              && asinRanking < asinHighRank)){
          priceSuggestion := amaSetPrice
          epbool := 1
          apbool := 0
          ambool := 0
        } 
    ;#AP
    else if (asinbool 
        && realEbay > realAma 
        && marketDiff > acceptDiff){
      priceSuggestion := ebaySetPrice
      apbool := 1
      epbool := 0
      ambool := 0
    } 
    ;NO TAGS
    else if ((!asinbool && ebaySetPrice)){
      priceSuggestion := ebaySetPrice
    } 
    ;NO TAGS AND LOW PRICE
    if (!apbool && !epbool && !ambool){
      tagswapcheck := 1
    }

    if (tagswapcheck && ebaySetPrice < floorPrice) {
      priceSuggestion := floorPrice
    } 
    ;ensure market swapping
    if (InStr(cliptags, "#EP") && tagswapcheck){
      apbool := 1
    }
    if (InStr(cliptags, "#AP") && tagswapcheck){
      epbool := 1
    }
    if (!InStr(cliptags, "#AP") && !InStr(cliptags, "#EP") && tagswapcheck){
      ambool := 1
    }
    

    ;B148-2#OGS#CK#BCO1#SEO46#AP#EP

  ;set gso tag after price has been determined
  if ((googConversions
        && googCost > (priceSuggestion * 1.25)) 
          || (googConversions > 0 
              && cpc > (priceSuggestion * .17)) 
          || priceSuggestion < 7.99) {
    gsobool:=1
  }

;add some logic to fix the old string and paste it to new string
oldtags := cliptags
  if (InStr(cliptags, "#GSO") && gsobool){
    oldtags := StrReplace(oldtags, "#GSO", "")
  } else if (InStr(cliptags, "#GSO") && !gsobool){
    oldtags := StrReplace(oldtags, "#GSO", "#OGS")
  }
oldtags := StrReplace(oldtags, "#EP", "")
oldtags := StrReplace(oldtags, "#AM", "")
oldtags := StrReplace(oldtags, "#AP", "")
oldtags := RegExReplace(oldtags, "#SEO[1-9]*", "")
oldtags := StrReplace(oldtags, "#COMP", "")

    ;tagging
  tagstring = %oldtags%%tagstring%

      if (serpbool) {
      tagstring = %tagstring%%serptag%%serp%
      }
      if (gsobool){
        tagstring = %tagstring%%gsotag%
      }
      if (compbool){
      tagstring = %tagstring%%comptag%
      }
      if (apbool) {
        tagstring = %tagstring%%aptag%
      }
      if (epbool){
        tagstring = %tagstring%%eptag%
      }
      if (ambool){
        tagstring = %tagstring%%amtag%
      }

Gosub, TAGS
return
;#AP#GSO#COMP#OPT1#A30D#SEO1

TAGS:
  Gui, Submit, NoHide
  GuiControl,,tags, %tagstring%
  Gosub, SUGG_PRICE 
  return

TAG_COPY:
  Gui, Submit, NoHide
  clipboard = %tagstring%
  clipwait
return

SUGG_PRICE:
  Gui, Submit, NoHide
  priceSuggestion := Format("{:.2f}", priceSuggestion)
  GuiControl,, suggPrice, %priceSuggestion%
  Gosub, ADD_NEVER
return

PRICE_COPY:
  Gui, Submit, NoHide
  clipboard = %priceSuggestion%
return

ADD_NEVER:
  Gui, Submit, NoHide

  if ((qoh > qSold * 2) 
      || (qSold = 0 
        && qoh > 2) ){
    GuiControl,, addNever, NEVER
  } else {
    GuiControl,, addNever, ADD
  }

return

;end of generator gui
return

