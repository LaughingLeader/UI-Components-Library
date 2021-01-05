package partyInventory_fla
{
   import LS_Classes.LSButton;
   import com.flashdynamix.motion.TweensyZero;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.external.ExternalInterface;
   import flash.utils.Timer;
   
   public dynamic class MainTimeline extends MovieClip
   {
       
      
      public var inventory_mc:MovieClip;
      
      public var events:Array;
      
      public var layout:String;
      
      public var alignment:String;
      
      public var isDragging:Boolean;
      
      public var curTooltip:int;
      
      public var hasTooltip:Boolean;
      
      public var keepCustomInScreen;
      
      public var uiLeft:uint;
      
      public var uiRight:uint;
      
      public var uiTop:uint;
      
      public var uiMinHeight:uint;
      
      public var uiMinWidth:uint;
      
      public var isSplit:Boolean;
      
      public var invCellSize:Number;
      
      public var invCellSpacing:Number;
      
      public var invBgDiscrap:Number;
      
      public var invRows:Number;
      
      public var invCols:Number;
      
      public var allowSound:Boolean;
      
      public var inventoryUpdateList:Array;
      
      public var itemsUpdateList:Array;
      
      public var goldWeightList:Array;
      
      public const sysPanelX:int = 2;
      
      public const sysPanelY:int = 41;
      
      public const sysPanelW:int = 676;
      
      public const sysPanelH:int = 1088;
      
      public const tooltipTweenTime:Number = 0.2;
      
      public var disableActions:Boolean;
      
      public var hasTooltipEnabled:Boolean;
      
      public var hasCanceled:Boolean;
      
      public var tooltip_array:Array;
      
      public var screenWidth:Number;
      
      public var screenHeight:Number;
      
      public var text_array:Array;
      
      public var checkBtn_array:Array;
      
      public var tooltipHandle:Number;
      
      public var TTimer:Timer;
      
      public var equipTooltip_array:Array;
      
      public var equipOffhandTooltip_array:Array;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onEventDown(param1:Number) : *
      {
         var _loc4_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc3_:String = this.events[param1];
         switch(this.events[param1])
         {
            case "IE UIAccept":
               _loc2_ = true;
               break;
            case "IE ControllerContextMenu":
               _loc2_ = true;
               break;
            case "IE UITabPrev":
               this.inventory_mc.subTabPrevious();
               this.inventory_mc.lb_mc.showHL();
               _loc2_ = true;
               break;
            case "IE UITabNext":
               this.inventory_mc.subTabNext();
               this.inventory_mc.rb_mc.showHL();
               _loc2_ = true;
               break;
            case "IE UIShowTooltip":
               _loc4_ = this.canShowTooltip();
               if(_loc4_)
               {
                  this.hasTooltipEnabled = !this.hasTooltipEnabled;
               }
               else
               {
                  this.hasTooltipEnabled = false;
               }
               if(this.hasTooltipEnabled)
               {
                  this.showTooltip();
               }
               else
               {
                  this.hideTooltip();
               }
               if(_loc4_)
               {
                  ExternalInterface.call("PlaySound","UI_Game_Dialog_Click");
               }
               _loc2_ = true;
               break;
            case "IE UITooltipUp":
               this.inventory_mc.tooltips_mc.scrollUp();
               _loc2_ = true;
               break;
            case "IE UITooltipDown":
               this.inventory_mc.tooltips_mc.scrollDown();
               _loc2_ = true;
               break;
            case "IE UICancel":
               if(this.hasTooltipEnabled)
               {
                  this.hideTooltip();
                  this.hasCanceled = true;
                  _loc2_ = true;
               }
               break;
            case "IE ToggleInGameMenu":
               _loc2_ = true;
         }
         return _loc2_;
      }
      
      public function onEventUp(param1:Number) : *
      {
         var _loc2_:Boolean = false;
         switch(this.events[param1])
         {
            case "IE ContextMenu":
               _loc2_ = this.inventory_mc.onContextMenuInputUp();
               break;
            case "IE UIAccept":
               _loc2_ = true;
               break;
            case "IE ControllerContextMenu":
               this.inventory_mc.cursorShowActionMenu();
               _loc2_ = true;
               break;
            case "IE UITabPrev":
               this.inventory_mc.lb_mc.hideHL();
               _loc2_ = true;
               break;
            case "IE UITabNext":
               this.inventory_mc.rb_mc.hideHL();
               _loc2_ = true;
               break;
            case "IE UIShowTooltip":
               _loc2_ = true;
               break;
            case "IE UICancel":
               if(this.hasCanceled)
               {
                  this.hasCanceled = false;
               }
               this.inventory_mc.closeUIBtn();
               _loc2_ = true;
               break;
            case "IE UITooltipUp":
               this.inventory_mc.tooltips_mc.stopScrolling();
               _loc2_ = true;
               break;
            case "IE UITooltipDown":
               this.inventory_mc.tooltips_mc.stopScrolling();
               _loc2_ = true;
               break;
            case "IE UICompareItems":
               if(this.hasTooltipEnabled)
               {
                  this.inventory_mc.toggleCompareMode();
               }
               _loc2_ = true;
               break;
            case "IE ToggleInGameMenu":
               ExternalInterface.call("PlaySound","UI_Game_Inventory_Close");
               ExternalInterface.call("hideUI");
               _loc2_ = true;
         }
         return _loc2_;
      }
      
      public function setMultiplayerMode(param1:Boolean) : *
      {
         this.inventory_mc.setMultiplayerMode(param1);
      }
      
      public function updateInventories() : *
      {
         this.allowSound = false;
         var _loc1_:uint = 0;
         var _loc2_:uint = 0;
         while(_loc2_ < this.inventoryUpdateList.length)
         {
            if(this.inventoryUpdateList[_loc2_] != undefined)
            {
               this.inventory_mc.addInventory(this.inventoryUpdateList[_loc2_++],this.inventoryUpdateList[_loc2_++],this.inventoryUpdateList[_loc2_++],this.inventoryUpdateList[_loc2_++],this.inventoryUpdateList[_loc2_++],_loc1_++);
            }
         }
         this.inventory_mc.cleanupList();
         this.inventoryUpdateList = new Array();
         this.allowSound = true;
      }
      
      public function updateItems() : *
      {
         var _loc3_:Number = NaN;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Boolean = false;
         var _loc1_:uint = 0;
         _loc1_ = 0;
         while(_loc1_ < this.goldWeightList.length)
         {
            if(this.goldWeightList[_loc1_] != undefined)
            {
               _loc3_ = Number(this.goldWeightList[_loc1_]);
               _loc4_ = String(this.goldWeightList[_loc1_ + 1]);
               _loc5_ = String(this.goldWeightList[_loc1_ + 2]);
               this.setCharacterGoldWeight(_loc3_,_loc4_,_loc5_);
            }
            _loc1_ = _loc1_ + 3;
         }
         _loc1_ = 0;
         while(_loc1_ < this.inventory_mc.list.length)
         {
            this.inventory_mc.list.getAt(_loc1_).inv.gridRefresh = false;
            _loc1_++;
         }
         var _loc2_:Array = this.itemsUpdateList;
         _loc1_ = 0;
         while(_loc1_ < _loc2_.length)
         {
            if(_loc2_[_loc1_] != undefined)
            {
               _loc6_ = Number(_loc2_[_loc1_]);
               _loc7_ = Number(_loc2_[_loc1_ + 1]);
               _loc8_ = Number(_loc2_[_loc1_ + 2]);
               _loc9_ = Number(_loc2_[_loc1_ + 3]);
               _loc10_ = Boolean(_loc2_[_loc1_ + 4]);
               this.inventory_mc.addItem(_loc6_,_loc7_,_loc8_,_loc9_,_loc10_);
            }
            _loc1_ = _loc1_ + 5;
         }
         _loc1_ = 0;
         while(_loc1_ < this.inventory_mc.list.length)
         {
            this.inventory_mc.list.getAt(_loc1_).inv.gridRefresh = true;
            this.inventory_mc.list.getAt(_loc1_).inv.cleanUpItems();
            _loc1_++;
         }
         this.inventory_mc.list.positionElements();
         this.itemsUpdateList = new Array();
         this.goldWeightList = new Array();
         this.allowSound = true;
      }
      
      public function setTooltipGroupLabel(param1:Number, param2:String) : *
      {
         this.inventory_mc.tooltips_mc.itemTooltip_mc.setTooltipGroupLabel(param1,param2);
      }
      
      public function setCharacterGoldWeight(param1:Number, param2:String, param3:String) : *
      {
         this.inventory_mc.setCharacterGoldWeight(param1,param2,param3);
      }
      
      public function updateItemTooltip() : *
      {
         if(this.tooltip_array.length > 0)
         {
            this.inventory_mc.tooltips_mc.itemTooltip_mc.setupTooltip(this.tooltip_array);
            if(this.hasTooltipEnabled)
            {
               this.showTooltip();
            }
         }
         this.tooltip_array = new Array();
      }
      
      public function onEventResolution(param1:Number, param2:Number) : *
      {
         if(this.screenWidth != param1 || this.screenHeight != param2)
         {
            ExternalInterface.call("setPosition","topright","screen","topright");
            this.screenWidth = param1;
            this.screenHeight = param2;
         }
      }
      
      public function clearTooltip() : *
      {
         this.hideTooltip(false,true);
      }
      
      public function onEventInit() : *
      {
         this.inventory_mc.init();
         this.inventory_mc.title_txt.mouseEnabled = false;
         var _loc1_:uint = 0;
         while(_loc1_ < this.checkBtn_array.length)
         {
            this.checkBtn_array[_loc1_].id = _loc1_;
            _loc1_++;
         }
         ExternalInterface.call("setPosition","topright","screen","topright");
      }
      
      public function setAnchor(param1:Number, param2:* = true) : *
      {
         ExternalInterface.call("registerAnchorId","partyInventory" + param1);
         this.inventory_mc.setLeft(param2);
      }
      
      public function setSplitScreen(param1:Boolean) : *
      {
         this.inventory_mc.setSplitScreen(param1);
      }
      
      public function setSelectedCharacter(param1:Number) : *
      {
         this.inventory_mc.setSelectedCharacter(param1);
      }
      
      public function setHLOnRT(param1:Boolean) : *
      {
         if(param1)
         {
            this.inventory_mc.RT_mc.showHL();
         }
         else
         {
            this.inventory_mc.RT_mc.hideHL();
         }
      }
      
      public function setHLOnLT(param1:Boolean) : *
      {
         if(param1)
         {
            this.inventory_mc.LT_mc.showHL();
         }
         else
         {
            this.inventory_mc.LT_mc.hideHL();
         }
      }
      
      public function addTab(param1:Number, param2:Number, param3:String) : *
      {
         this.inventory_mc.addTab(param1,param2,param3);
      }
      
      public function setText(param1:Number, param2:String) : *
      {
         if(param1 >= 0 && param1 < this.text_array.length)
         {
            if(this.text_array[param1] == this.inventory_mc.title_txt)
            {
               this.text_array[param1].htmlText = param2.toUpperCase();
            }
            else if(this.text_array[param1] is LSButton)
            {
               this.text_array[param1].setText(param2);
            }
            else
            {
               this.text_array[param1].htmlText = param2;
            }
         }
      }
      
      public function setCheckBtnText(param1:Number, param2:String) : *
      {
         if(param1 >= 0 && param1 < this.checkBtn_array.length)
         {
            this.checkBtn_array[param1].setText(param2);
         }
      }
      
      public function setCheckBtnState(param1:Number, param2:Boolean) : *
      {
         if(param1 >= 0 && param1 < this.checkBtn_array.length)
         {
            this.checkBtn_array[param1].setState(param2);
         }
      }
      
      public function setCheckBtnEnabled(param1:Number, param2:Boolean) : *
      {
      }
      
      public function INV_ShowCellTooltip(param1:Number) : *
      {
         this.tooltipHandle = param1;
         this.TTimer.start();
      }
      
      public function INV_SendTooltipRequest(param1:Event) : *
      {
         ExternalInterface.call("overItem",Number(this.tooltipHandle));
         this.TTimer.reset();
         this.TTimer.stop();
      }
      
      public function setSortBtnTexts(param1:String, param2:String) : *
      {
         this.inventory_mc.setSortBtnTexts(param1,param2);
      }
      
      public function clearSortOptions() : *
      {
         this.inventory_mc.sortBy_mc.clearSort();
      }
      
      public function addSortOption(param1:Number, param2:String, param3:Boolean) : *
      {
         this.inventory_mc.sortBy_mc.addSort(param1,param2,param3);
      }
      
      public function addBtnHint(param1:Number, param2:String, param3:Number) : *
      {
      }
      
      public function clearBtnHints() : *
      {
         this.inventory_mc.buttonHint_mc.clearBtnHints();
      }
      
      public function setInventorySelection(param1:MovieClip) : *
      {
         this.inventory_mc.inventory_mc.setInventorySelection(param1);
      }
      
      public function setInventorySlotSelection(param1:Number) : *
      {
         this.inventory_mc.selectSlot(param1,true);
      }
      
      public function clearSlots() : *
      {
         this.inventory_mc.clearSlots();
      }
      
      public function addInventoryFilter(param1:Number, param2:Number, param3:String) : *
      {
         this.inventory_mc.tabBar_mc.addInvTab(param1,param2,param3);
      }
      
      public function removeInventoryFilters() : *
      {
         this.inventory_mc.tabBar_mc.removeTabs();
      }
      
      public function selectInventoryFilter(param1:Number) : *
      {
         this.inventory_mc.tabBar_mc.selectTab(param1);
      }
      
      public function selectTab(param1:Number) : *
      {
         this.inventory_mc.selectTab(param1);
      }
      
      public function startsWith(param1:String, param2:String) : Boolean
      {
         param1 = param1.toLowerCase();
         param2 = param2.toLowerCase();
         return param2 == param1.substr(0,param2.length);
      }
      
      public function setActionsDisabled(param1:Number, param2:Boolean) : *
      {
         this.inventory_mc.setActionsDisabled(param1,param2);
      }
      
      public function hideTooltip(param1:Boolean = true, param2:Boolean = true) : *
      {
         if(param1)
         {
            this.hasTooltipEnabled = false;
         }
         if(this.inventory_mc.tooltips_mc.tweening)
         {
            TweensyZero.stop(this.inventory_mc.tooltips_mc);
         }
         this.inventory_mc.tooltips_mc.visible = true;
         this.inventory_mc.tooltips_mc.tweening = true;
         this.inventory_mc.tooltips_mc.hideTooltips();
         TweensyZero.to(this.inventory_mc.tooltips_mc,{"alpha":0},this.tooltipTweenTime,null,0.01,null,this.tooltipTweenDone);
      }
      
      public function showTooltip(param1:Boolean = true) : *
      {
         if(param1)
         {
            this.hasTooltipEnabled = true;
         }
         if(this.inventory_mc.tooltips_mc.tweening)
         {
            TweensyZero.stop(this.inventory_mc.tooltips_mc);
         }
         this.inventory_mc.tooltips_mc.visible = true;
         this.inventory_mc.tooltips_mc.tweening = true;
         TweensyZero.to(this.inventory_mc.tooltips_mc,{"alpha":1},this.tooltipTweenTime,null,0.01,null,this.tooltipTweenDone);
      }
      
      public function tooltipTweenDone(param1:Boolean = false) : *
      {
         this.inventory_mc.tooltips_mc.tweening = false;
         if(param1)
         {
            this.inventory_mc.tooltips_mc.itemTooltip_mc.clearTooltip();
         }
      }
      
      public function canShowTooltip() : Boolean
      {
         var _loc1_:* = undefined;
         if(this.inventory_mc.visible)
         {
            _loc1_ = this.inventory_mc.getSlot(this.inventory_mc.currentHLSlot);
            if(_loc1_)
            {
               return _loc1_.itemHandle != 0;
            }
            return false;
         }
         return true;
      }
      
      public function updateEquipTooltip() : *
      {
         if(this.equipTooltip_array.length > 0)
         {
            this.inventory_mc.tooltips_mc.itemTooltip_mc.setupCompareTooltip(this.equipTooltip_array);
         }
         this.equipTooltip_array = new Array();
      }
      
      public function updateEquipOffhandTooltip() : *
      {
         if(this.equipOffhandTooltip_array.length > 0)
         {
            this.inventory_mc.tooltips_mc.itemTooltip_mc.setupCompareOffhandTooltip(this.equipOffhandTooltip_array);
         }
         this.equipOffhandTooltip_array = new Array();
      }
      
      public function clearEquipTooltip() : *
      {
         if(this.inventory_mc.tooltips_mc.itemTooltip_mc)
         {
            this.inventory_mc.tooltips_mc.itemTooltip_mc.clearCompareTooltip();
         }
      }
      
      public function clearEquipOffhandTooltip() : *
      {
         if(this.inventory_mc.tooltips_mc.itemTooltip_mc)
         {
            this.inventory_mc.tooltips_mc.itemTooltip_mc.clearCompareOffhandTooltip();
         }
      }
      
      public function tooltipEquippedString(param1:String) : *
      {
         this.inventory_mc.tooltips_mc.itemTooltip_mc.setEquippedString(param1);
         this.inventory_mc.tooltips_mc.itemTooltip_mc.setCompareEquippedVisible(true);
      }
      
      public function setOffhandString(param1:String) : *
      {
         this.inventory_mc.tooltips_mc.itemTooltip_mc.setOffhandString(param1);
         this.inventory_mc.tooltips_mc.itemTooltip_mc.setCompareOffhandEquippedVisible(true);
      }
      
      public function enableCompare(param1:Boolean) : *
      {
         this.inventory_mc.tooltips_mc.enableCompare(param1);
      }
      
      public function setTooltipCompareHint(param1:Number, param2:String) : *
      {
         this.inventory_mc.tooltips_mc.itemTooltip_mc.addCompareButtonHint(param1,param2);
      }
      
      public function clearTooltipCompareHints() : *
      {
         this.inventory_mc.tooltips_mc.itemTooltip_mc.clearCompareButtonHint();
      }
      
      public function addKeyHint(param1:String, param2:String) : *
      {
         this.inventory_mc.addKeyHint(param1,param2);
      }
      
      public function clearKeyHints() : *
      {
         this.inventory_mc.clearKeyHints();
      }
      
      function frame1() : *
      {
         this.events = new Array("IE UIAccept","IE UICancel","IE ControllerContextMenu","IE UIShowTooltip","IE UITabPrev","IE UITabNext","IE UITooltipUp","IE UITooltipDown","IE UICompareItems","IE ContextMenu","IE Action1","IE ToggleInGameMenu");
         this.layout = "fixed";
         this.alignment = "none";
         this.isDragging = false;
         this.curTooltip = -1;
         this.hasTooltip = false;
         this.keepCustomInScreen = true;
         this.uiLeft = 0;
         this.uiRight = 680;
         this.uiTop = 45;
         this.uiMinHeight = 190;
         this.uiMinWidth = 150;
         this.isSplit = false;
         this.invCellSize = 50;
         this.invCellSpacing = 8;
         this.invBgDiscrap = -1;
         this.invRows = 7;
         this.invCols = 8;
         this.allowSound = false;
         this.inventoryUpdateList = new Array();
         this.itemsUpdateList = new Array();
         this.goldWeightList = new Array();
         this.disableActions = false;
         this.hasTooltipEnabled = false;
         this.hasCanceled = false;
         this.tooltip_array = new Array();
         this.text_array = new Array(this.inventory_mc.title_txt,this.inventory_mc.sortBy_mc.title_txt,this.inventory_mc.allBtn_mc,this.inventory_mc.totalGold_mc.label_txt);
         this.checkBtn_array = new Array(this.inventory_mc.view_mc);
         this.tooltipHandle = 0;
         this.TTimer = new Timer(50,1);
         this.TTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.INV_SendTooltipRequest);
         this.equipTooltip_array = new Array();
         this.equipOffhandTooltip_array = new Array();
      }
   }
}
