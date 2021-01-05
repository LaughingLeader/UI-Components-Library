package uiCraft_fla
{
   import LS_Classes.horizontalList;
   import LS_Classes.inventoryClass;
   import LS_Classes.larTween;
   import LS_Classes.tooltipHelper;
   import fl.motion.easing.Linear;
   import fl.motion.easing.Quartic;
   import fl.motion.easing.Sine;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   
   public dynamic class experimentPanel_36 extends MovieClip
   {
       
      
      public var button_mc:smallRedBtn;
      
      public var closeContainerButton_mc:smallBrownBtn;
      
      public var container_mc:MovieClip;
      
      public var currentStep_txt:TextField;
      
      public var ingredients_mc:MovieClip;
      
      public var progressBar_mc:MovieClip;
      
      public var resultHit_mc:MovieClip;
      
      public var resultSpacing_mc:MovieClip;
      
      public var result_mc:MovieClip;
      
      public var result_txt:TextField;
      
      public var sb_mc:MovieClip;
      
      public var station_mc:MovieClip;
      
      public var tabs_mc:MovieClip;
      
      public const resetUITime:Number = 0.05;
      
      public const fadeBarTime:Number = 0.05;
      
      public const fadeResultTime:Number = 0.05;
      
      public var hasResult:Boolean;
      
      public var resultName:String;
      
      public var tweenResultVar:larTween;
      
      public var tweenResultTextVar:larTween;
      
      public var tweenProgressVar:larTween;
      
      public var tweenButtonTextVar:larTween;
      
      public var animationBusy:Boolean;
      
      public var crafting:Boolean;
      
      public var craftDone:Boolean;
      
      public var selectedId:Number;
      
      public var inv:inventoryClass;
      
      public var base:MovieClip;
      
      public var minRows:Number;
      
      public var maxRows:Number;
      
      public var rows:Number;
      
      public var cols:Number;
      
      public var cellHeight:Number;
      
      public var cellWidth:Number;
      
      public var cellSpacing:Number;
      
      public var bgDiscrap:Number;
      
      public var currentHLSlot:Number;
      
      public var overButton:Boolean;
      
      public var resultTooltipVisible:Boolean;
      
      public var filterTabList:horizontalList;
      
      public function experimentPanel_36()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onEventInit() : *
      {
         this.station_mc.visible = false;
         this.ingredients_mc.init();
         this.progressBar_mc.alpha = 0;
         this.result_mc.alpha = 0;
         this.currentStep_txt.alpha = 1;
         this.updateProgress(0);
         this.animationBusy = false;
         this.craftDone = false;
         this.crafting = false;
         this.resultHit_mc.itemHandle = -1;
         this.closeContainerButton_mc.visible = false;
         this.button_mc.init(this.buttonPressed);
      }
      
      public function onClearCell(param1:MovieClip) : *
      {
         if(param1)
         {
            param1.active_mc.visible = false;
         }
      }
      
      public function onCellClick(param1:MovieClip) : *
      {
         if(param1 && param1.amount > 0)
         {
            ExternalInterface.call("clickItem",param1.itemHandle);
            ExternalInterface.call("hideTooltip");
         }
      }
      
      public function gridChangeCallback(param1:Event) : *
      {
         if(this.inv)
         {
            ExternalInterface.call("rowsChanged",this.inv.row + 1);
         }
      }
      
      public function startAnim(param1:Boolean = true) : *
      {
         if(param1)
         {
            this.cancelAnim();
         }
         this.animationBusy = true;
         this.craftDone = false;
         this.tweenProgressVar = new larTween(this.progressBar_mc,"alpha",Quartic.easeIn,this.progressBar_mc.alpha,1,this.fadeBarTime);
         this.button_mc.visible = false;
      }
      
      public function showResult() : *
      {
         this.stepFour();
      }
      
      public function resetAnim() : *
      {
         this.tweenResultVar = this.stopTween(this.tweenResultVar);
         this.tweenResultTextVar = this.stopTween(this.tweenResultTextVar);
         this.tweenProgressVar = this.stopTween(this.tweenProgressVar);
         this.tweenButtonTextVar = this.stopTween(this.tweenButtonTextVar);
         this.updateProgress(0);
         this.resultHit_mc.mouseEnabled = false;
         this.resultOnMouseOut();
         this.progressBar_mc.alpha = 0;
         this.requestShowButton();
         this.result_txt.alpha = 1;
         this.result_mc.alpha = 0;
         this.currentStep_txt.alpha = 1;
         this.animationBusy = false;
         this.crafting = false;
         this.craftDone = false;
         this.resultHit_mc.itemHandle = -1;
         this.updateProgress(0);
      }
      
      public function requestShowButton() : *
      {
         this.button_mc.visible = true;
         this.button_mc.setEnabled(this.canCraft());
      }
      
      public function cancelAnim(param1:TimerEvent = null) : *
      {
         this.tweenResultVar = this.stopTween(this.tweenResultVar);
         this.tweenResultTextVar = this.stopTween(this.tweenResultTextVar);
         this.tweenProgressVar = this.stopTween(this.tweenProgressVar);
         this.tweenButtonTextVar = this.stopTween(this.tweenButtonTextVar);
         this.tweenResultVar = new larTween(this.result_mc,"alpha",Linear.easeNone,this.result_mc.alpha,0,this.resetUITime);
         this.tweenResultTextVar = new larTween(this.result_txt,"alpha",Linear.easeNone,this.result_txt.alpha,1,this.resetUITime);
         this.tweenProgressVar = new larTween(this.progressBar_mc,"alpha",Linear.easeNone,this.progressBar_mc.alpha,0,this.resetUITime,this.requestShowButton);
         this.updateProgress(0);
         this.resultHit_mc.mouseEnabled = false;
         this.resultOnMouseOut();
         this.animationBusy = false;
         this.crafting = false;
         this.craftDone = false;
         this.resultHit_mc.itemHandle = -1;
         ExternalInterface.call("resetUI");
      }
      
      public function stepFour() : *
      {
         this.crafting = false;
         this.craftDone = true;
         this.tweenProgressVar = new larTween(this.progressBar_mc,"alpha",Linear.easeNone,this.progressBar_mc.alpha,0,this.fadeBarTime,this.stepFive);
      }
      
      public function stepFive() : *
      {
         this.updateProgress(0);
         this.requestShowButton();
         this.resultHit_mc.mouseEnabled = true;
         this.result_mc.effect_mc.visible = true;
         this.result_mc.effect_mc.gotoAndPlay(2);
         this.tweenResultVar = new larTween(this.result_mc,"alpha",Linear.easeNone,0,1,this.fadeResultTime,this.finishAnim);
         if(!this.hasResult)
         {
            this.tweenResultTextVar = new larTween(this.result_txt,"alpha",Linear.easeNone,this.result_txt.alpha,0,this.fadeResultTime);
         }
         if(this.result_mc.isEmpty)
         {
            ExternalInterface.call("PlaySound","UI_Handling_Fail");
         }
         else
         {
            ExternalInterface.call("PlaySound","UI_Handling_Crafting_Complete");
         }
         ExternalInterface.call("craftCompleted");
      }
      
      public function finishAnim() : *
      {
         this.animationBusy = false;
      }
      
      public function updateProgress(param1:Number) : *
      {
         if(this.crafting || param1 == 0)
         {
            this.progressBar_mc.progressBar_mc.updateProgress(param1);
         }
      }
      
      public function stopTween(param1:larTween) : larTween
      {
         if(param1)
         {
            param1.stop();
            param1 = null;
         }
         return param1;
      }
      
      public function setResultHandle(param1:Number) : *
      {
         this.resultHit_mc.itemHandle = param1;
         if(this.resultTooltipVisible)
         {
            ExternalInterface.call("hideTooltip");
            tooltipHelper.ShowItemTooltipForMC(this.resultHit_mc,root,"rightTop");
         }
      }
      
      public function resultOnMouseOver(param1:* = null) : *
      {
         if(!this.resultTooltipVisible)
         {
            if(this.resultHit_mc.itemHandle != -1)
            {
               tooltipHelper.ShowItemTooltipForMC(this.resultHit_mc,root,"rightTop");
            }
            else
            {
               this.resultHit_mc.tooltip = this.resultName;
               tooltipHelper.ShowTooltipForMC(this.resultHit_mc,root,"rightTop");
            }
            this.resultTooltipVisible = true;
         }
      }
      
      public function resultOnMouseOut(param1:* = null) : *
      {
         if(this.resultTooltipVisible)
         {
            ExternalInterface.call("hideTooltip");
            this.resultTooltipVisible = false;
         }
      }
      
      public function buttonPressed() : *
      {
         ExternalInterface.call("combine");
      }
      
      public function canCraft() : *
      {
         if(this.ingredients_mc.getCount() > 1)
         {
            return true;
         }
         if(this.ingredients_mc.getCount() == 1 && this.station_mc.visible)
         {
            return true;
         }
         return false;
      }
      
      public function startCraft() : *
      {
         if(this.canCraft())
         {
            this.startAnim(false);
         }
         else
         {
            ExternalInterface.call("PlaySound","UI_Barter_NotEnoughMoney");
            this.ingredients_mc.showAlerts();
         }
         this.crafting = true;
      }
      
      public function onResultMousePressed(param1:* = null) : *
      {
         this.resultHit_mc.addEventListener(MouseEvent.MOUSE_UP,this.onResultMouseReleased);
      }
      
      public function onResultMouseReleased(param1:* = null) : *
      {
         this.resultHit_mc.removeEventListener(MouseEvent.MOUSE_UP,this.onResultMouseReleased);
         this.cancelAnim();
      }
      
      public function setClosePopupButton(param1:String) : *
      {
         this.closeContainerButton_mc.initialize(param1,this.closeContainerPopup,null,-1,false);
      }
      
      public function closeContainerPopup() : *
      {
         ExternalInterface.call("closeContainerUI");
      }
      
      public function updateItems() : *
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:* = undefined;
         var _loc7_:MovieClip = null;
         this.inv.gridRefresh = false;
         var _loc1_:Array = this.base.itemsUpdateList;
         var _loc2_:uint = 0;
         while(_loc2_ < _loc1_.length)
         {
            if(_loc1_[_loc2_] != undefined)
            {
               _loc3_ = Number(_loc1_[_loc2_]);
               _loc4_ = Number(_loc1_[_loc2_ + 1]);
               _loc5_ = Number(_loc1_[_loc2_ + 2]);
               _loc6_ = Boolean(_loc1_[_loc2_ + 3]);
               if(_loc5_ > 0)
               {
                  _loc7_ = this.inv.addItem(_loc3_,_loc4_,_loc5_);
                  if(_loc7_)
                  {
                     _loc7_.active_mc.visible = !_loc6_;
                  }
               }
               else
               {
                  this.inv.removeItem(_loc3_);
               }
            }
            _loc2_ = _loc2_ + 4;
         }
         this.inv.refreshGridSize();
         this.inv.gridRefresh = true;
         this.base.itemsUpdateList = new Array();
         if(this.selectedId == 0 && this.inv.length > 0)
         {
            this.inv.select(this.inv.currentSelection,true);
         }
      }
      
      public function onCellCreate(param1:MovieClip) : *
      {
         if(param1)
         {
            param1.active_mc.visible = false;
            param1.base = root as MovieClip;
            param1.selector_mc.visible = false;
         }
      }
      
      public function resetUI() : *
      {
         this.resetAnim();
      }
      
      public function clearCurrentHL() : *
      {
         this.inv.clearSelection();
      }
      
      public function setContainerMode(param1:Boolean) : *
      {
         this.tabs_mc.visible = !param1;
         this.closeContainerButton_mc.visible = param1;
      }
      
      public function cursorLeft() : *
      {
         this.inv.cursorLeft();
      }
      
      public function cursorRight() : *
      {
         this.inv.cursorRight();
      }
      
      public function cursorUp() : *
      {
         this.inv.cursorUp();
      }
      
      public function cursorDown() : *
      {
         this.inv.cursorDown();
      }
      
      public function cursorAccept() : *
      {
         if(this.craftDone)
         {
            this.cancelAnim();
         }
         else if(this.selectedId == 1)
         {
            ExternalInterface.call("clearSlot",0);
         }
         else if(this.selectedId == 2)
         {
            ExternalInterface.call("clearSlot",1);
         }
         else if(this.currentHLSlot != -1)
         {
            ExternalInterface.call("useItem",this.currentHLSlot);
         }
      }
      
      public function cursorCancel() : Boolean
      {
         if(this.animationBusy)
         {
            this.cancelAnim();
            return true;
         }
         return false;
      }
      
      public function setIngredient(param1:Number, param2:Number, param3:String, param4:Number, param5:Boolean, param6:Boolean) : *
      {
         var _loc7_:Boolean = this.ingredients_mc.setIngredient(param1,param2,param3,param4,param5,param6);
         this.button_mc.setEnabled(this.canCraft());
         if(_loc7_ && (this.crafting || !this.animationBusy))
         {
            this.cancelAnim();
         }
      }
      
      public function craftButton(param1:Boolean) : Boolean
      {
         var _loc2_:Boolean = false;
         if(param1)
         {
            if(this.canCraft() && !this.craftDone)
            {
               if(!this.animationBusy)
               {
                  this.startAnim();
               }
               _loc2_ = true;
            }
         }
         else
         {
            _loc2_ = this.canCraft() || this.craftDone;
            if(this.crafting && !this.craftDone)
            {
               this.cancelAnim();
            }
         }
         return _loc2_;
      }
      
      public function addFilterTab(param1:Number, param2:Number, param3:String) : *
      {
         var _loc5_:larTween = null;
         var _loc4_:MovieClip = this.filterTabList.getElementByNumber("id",param1);
         if(!_loc4_)
         {
            _loc4_ = new FilterTab();
            this.filterTabList.addElement(_loc4_);
            _loc4_.icon_mc.gotoAndStop(param2);
            _loc4_.select_mc.visible = false;
            _loc4_.id = param1;
            _loc5_ = new larTween(_loc4_.icon_mc,"alpha",Sine.easeOut,_loc4_.icon_mc.alpha,1,0.15);
         }
         _loc4_.tooltip = param3;
         _loc4_.imgID = param2;
      }
      
      public function selectFilterTab(param1:Number) : *
      {
         var _loc3_:MovieClip = null;
         var _loc2_:MovieClip = this.filterTabList.getCurrentMovieClip();
         if(!_loc2_ || param1 != _loc2_.id)
         {
            _loc3_ = this.filterTabList.getElementByNumber("id",param1);
            if(_loc3_)
            {
               this.inv.clearSlots();
               ExternalInterface.call("setInventoryView",param1);
               this.filterTabList.selectMC(_loc3_,true);
               this.inv.m_scrollbar_mc.resetHandle();
            }
         }
      }
      
      public function clearSlots() : *
      {
         this.inv.clearSlots();
      }
      
      public function showContextMenu() : *
      {
         if(!this.base.disableActions)
         {
            this.callContextMenu();
            ExternalInterface.call("PlaySound","UI_Game_Craft_Click");
         }
      }
      
      public function callContextMenu() : *
      {
         this.inv.onContextMenuInputUp();
      }
      
      function frame1() : *
      {
         this.hasResult = true;
         this.resultName = "";
         this.tweenResultVar = null;
         this.tweenResultTextVar = null;
         this.tweenProgressVar = null;
         this.tweenButtonTextVar = null;
         this.base = root as MovieClip;
         this.minRows = this.base.invRows;
         this.maxRows = 500;
         this.rows = this.base.invRows;
         this.cols = this.base.invCols;
         this.cellHeight = this.base.invCellSize;
         this.cellWidth = this.base.invCellSize;
         this.cellSpacing = this.base.invCellSpacing;
         this.bgDiscrap = this.base.invBgDiscrap;
         this.currentHLSlot = -1;
         this.inv = new inventoryClass(0,"Cell",this.cols,this.rows,this.cellHeight,this.cellWidth,this.cellSpacing,this.onCellCreate);
         this.inv.allowDoubleClick = false;
         this.inv.SB_SPACING = 0;
         this.inv.minRows = 13;
         this.inv.m_Base = root as MovieClip;
         this.inv.gridRefresh = true;
         this.inv.customIggyName = "inventoryIcons";
         this.inv.addEventListener("GridChanged",this.gridChangeCallback);
         this.inv.bgDiscrap = -2;
         this.container_mc.addChild(this.inv);
         this.inv.onCellClicked = this.onCellClick;
         this.inv.onClearCell = this.onClearCell;
         this.inv.setFrame(635,461);
         this.inv.mouseWheelWhenOverEnabled = true;
         this.button_mc.mouseEnabled = true;
         this.result_mc.mouseEnabled = false;
         this.result_mc.mouseChildren = false;
         this.resultHit_mc.addEventListener(MouseEvent.ROLL_OVER,this.resultOnMouseOver);
         this.resultHit_mc.addEventListener(MouseEvent.ROLL_OUT,this.resultOnMouseOut);
         this.resultHit_mc.addEventListener(MouseEvent.MOUSE_DOWN,this.onResultMousePressed);
         this.overButton = false;
         this.resultTooltipVisible = false;
         this.filterTabList = new horizontalList();
         this.tabs_mc.addChild(this.filterTabList);
         this.filterTabList.EL_SPACING = 14;
      }
   }
}
