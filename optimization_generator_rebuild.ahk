!z::
Reload
return

!+3::

;GUI****************

Gui, New,,OPTIMIZATION GENERATOR

;ROW 1 - DATA FROM OPT SCRIPT
Gui, Add, Text, x5 y5, ##ITEM DATA
Gui, Add, Text,x5 y25, SKU
Gui, Add, Button, x85 y25  w150 vskuGui gSKUGUI, %sku% 

Gui, Add, Text,x5 y60, MPN
Gui, Add, Button, x85 y60 w150 vmpnGui gMPNGUI, %mpn%

Gui, Add, Text,x5 y95, PRODUCT_ID
Gui, Add, Button, x85 y95 w150 vpidGui gPIDGUI, %pid%




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

;Gui, Add, Button, x20 y140 w200 h60 Default gGENERATE, GENERATE

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

Gui, Add, Text, x630 y+20, TAGS 
Gui, Add, Edit, w200 vtags gTAGS Disabled
Gui, Add, Button, x+10 w20 vtagCopy gTAG_COPY, COPY

Gui, Add, Text, x630 y120, SUGGESTED PRICE
Gui, Add, Edit, w200 vsuggPrice gSUGG_PRICE Disabled
Gui, Add, Button, x+10 w20 vpriceCopy gPRICE_COPY, COPY

Gui, Add, Text, x630 y+20, ADD // NEVER
Gui, Add, Edit, w50 vaddNever gADD_NEVER Disabled

Gui, Add, Button, x20 y140 w200 h60 Default gGENERATE, GENERATE

Gui, Show, x20 y40 w890 h230
return

;; OLD LABELS
;	BUTTONS ***************

GENERATE:
Gui, Submit, NoHide
Gosub, TAGS
return

SKUGUI:
Gui, Submit, NoHide
clipboard = %sku%
clipwait
return

MPNGUI:
Gui, Submit, NoHide
clipboard = %mpn%
clipwait
return

PIDGUI:
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

    realAma = asinLow - asinLow*marketCutFactor
    realEbay = (ebayTarget - assumedShip - ebayTarget*marketCutFactor)
    
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
    if (serp is integer) {
        serpbool := 1
    }
;***************
    
    

;TRASH -- CHANGING
    ;pricing and tag condition setting
    if (asinbool && marketDiff <= acceptDiff && realAma >= realFloor) {
     price := realAma
     ambool := 1  
    } else if ((asinbool && realAma > realEbay && marketDiff >= acceptDiff && asinRanking < asinMidRank) || (asinbool && && realEbay < realAma && amaPrice < floorPrice && amaPrice > 1.5 && asinRanking < asinHighRank) ){
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
ASIN_SELLERS:
Gui, Submit, Nohide

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


return
