package uiCraft_fla
{
   import LS_Classes.inventoryClass;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   
   public dynamic class RuneInventory_54 extends MovieClip
   {
       
      
      public var close_mc:myCloseButton;
      
      public var inventoryHolder_mc:MovieClip;
      
      public var select_mc:smallRedBtn;
      
      public var title_txt:TextField;
      
      public var selectRuneTargetMode:Boolean;
      
      public var inv:inventoryClass;
      
      public var selectecItemMC:MovieClip;
      
      public var base:MovieClip;
      
      public var cellHeight:Number;
      
      public var cellWidth:Number;
      
      public var cellSpacing:Number;
      
      public function RuneInventory_54()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init() : *
      {
         this.select_mc.init(this.onSelectPressed);
         this.close_mc.init(this.onClosePressed);
      }
      
      public function showPanel() : *
      {
         this.visible = true;
         this.reset();
      }
      
      public function hidePanel() : *
      {
         this.visible = false;
      }
      
      public function onClosePressed() : *
      {
         var _loc1_:* = undefined;
         if(this.selectecItemMC != null && this.selectRuneTargetMode)
         {
            _loc1_ = parent as MovieClip;
            _loc1_.bgOverlay.gotoAndStop(_loc1_.currRuneCount);
         }
         this.visible = false;
      }
      
      public function onSelectPressed() : *
      {
         if(this.selectecItemMC != null)
         {
            if(this.selectRuneTargetMode)
            {
               ExternalInterface.call("selectRuneTarget",this.selectecItemMC.itemHandle);
            }
            else
            {
               ExternalInterface.call("selectRune",this.selectecItemMC.itemHandle);
               ExternalInterface.call("PlaySound","UI_Game_Runes_Insert");
            }
         }
      }
      
      public function onCellCreate(param1:MovieClip) : *
      {
         if(param1)
         {
            param1.active_mc.visible = false;
            param1.base = root as MovieClip;
         }
      }
      
      public function onCellDoubleClick(param1:MovieClip) : *
      {
         this.onCellClick(param1);
         this.onSelectPressed();
      }
      
      public function onCellClick(param1:MovieClip) : *
      {
         if(param1)
         {
            if(this.selectecItemMC != param1 && param1.itemHandle != 0 && param1.amount > 0)
            {
               if(this.selectecItemMC != null)
               {
                  this.selectecItemMC.active_mc.visible = false;
               }
               this.selectecItemMC = param1;
               param1.active_mc.visible = true;
               this.select_mc.setEnabled(true);
            }
            else
            {
               if(this.selectecItemMC != null)
               {
                  this.selectecItemMC.active_mc.visible = false;
               }
               param1.active_mc.visible = false;
               this.selectecItemMC = null;
               this.select_mc.setEnabled(false);
            }
         }
      }
      
      public function reset() : *
      {
         if(this.selectecItemMC != null)
         {
            this.selectecItemMC.active_mc.visible = false;
         }
         this.select_mc.setEnabled(false);
      }
      
      public function gridChangeCallback(param1:Event) : *
      {
         if(this.inv)
         {
            ExternalInterface.call("rowsChanged",this.inv.row + 1);
         }
      }
      
      public function updateItems() : *
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:* = undefined;
         var _loc1_:MovieClip = root as MovieClip;
         this.inv.gridRefresh = false;
         var _loc2_:Array = _loc1_.itemsUpdateList;
         this.inv.clearSlots();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(_loc2_[_loc3_] != undefined)
            {
               _loc4_ = Number(_loc2_[_loc3_]);
               _loc5_ = Number(_loc2_[_loc3_ + 1]);
               _loc6_ = Number(_loc2_[_loc3_ + 2]);
               _loc7_ = Boolean(_loc2_[_loc3_ + 3]);
               if(_loc6_ > 0)
               {
                  this.inv.addItem(_loc4_,_loc5_,_loc6_);
               }
               else
               {
                  this.inv.removeItem(_loc4_);
               }
            }
            _loc3_ = _loc3_ + 4;
         }
         this.inv.refreshGridSize();
         this.inv.gridRefresh = true;
         _loc1_.itemsUpdateList = new Array();
      }
      
      public function onClearCell(param1:MovieClip) : *
      {
         if(param1)
         {
            param1.active_mc.visible = false;
         }
      }
      
      function frame1() : *
      {
         this.selectRuneTargetMode = true;
         this.selectecItemMC = null;
         this.base = root as MovieClip;
         this.cellHeight = this.base.invCellSize;
         this.cellWidth = this.base.invCellSize;
         this.cellSpacing = this.base.invCellSpacing;
         this.inv = new inventoryClass(0,"CellC",this.base.invRuneCols,this.base.invRuneRows,this.cellHeight,this.cellWidth,this.cellSpacing,this.onCellCreate);
         this.inv.SB_SPACING = 3;
         this.inv.minRows = 13;
         this.inv.m_Base = root as MovieClip;
         this.inv.gridRefresh = true;
         this.inv.customIggyName = "inventoryIcons";
         this.inv.addEventListener("GridChanged",this.gridChangeCallback);
         this.inv.bgDiscrap = -2;
         this.inventoryHolder_mc.addChild(this.inv);
         this.inv.onCellClicked = this.onCellClick;
         this.inv.onCellDoubleClicked = this.onCellDoubleClick;
         this.inv.setFrame(522,346);
         this.inv.m_scrollbar_mc.m_FullSizeBG = true;
         this.inv.onClearCell = this.onClearCell;
         this.inv.m_scrollbar_mc.ScaleBG = true;
         this.inv.m_scrollbar_mc.m_bg_mc.alpha = 0;
         this.inv.mouseWheelWhenOverEnabled = true;
      }
   }
}
