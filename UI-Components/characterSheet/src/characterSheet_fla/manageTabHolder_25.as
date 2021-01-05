package characterSheet_fla
{
   import LS_Classes.inventoryClass;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   
   public dynamic class manageTabHolder_25 extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public var btnClear_mc:btnClear;
      
      public var btnGenerate_mc:btnGenerate;
      
      public var cbRarity_mc:GenStockCombo;
      
      public var cbTreasures_mc:GenStockCombo;
      
      public var lblLevel_txt:TextField;
      
      public var nbLevel_mc:Counter;
      
      public var slotHolder_mc:empty;
      
      public var inventory:MovieClip;
      
      public var root_mc:MovieClip;
      
      public function manageTabHolder_25()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onContextMenuInputUp(param1:Number) : *
      {
         if(this.inventory)
         {
            this.inventory.id = param1;
            this.inventory.onContextMenuInputUp();
         }
      }
      
      public function init() : *
      {
         var _loc1_:MovieClip = root as MovieClip;
         this.btnGenerate_mc.init(_loc1_.onBtnGenerateStock);
         this.btnGenerate_mc.setEnabled(false);
         this.btnClear_mc.init(_loc1_.onBtnClearInventory);
         this.cbTreasures_mc.init(_loc1_.onSelectTreasure);
         this.cbTreasures_mc.bgHeightMax = 128;
         this.cbTreasures_mc.scrollbarOffsetX = -30;
         this.cbTreasures_mc.scrollbarOffsetY = -2;
         this.cbTreasures_mc.setOnOpenFunction(_loc1_.onOpenDropList);
         this.cbRarity_mc.init(_loc1_.onSelectGenerationRarity);
         this.cbRarity_mc.bgHeightMax = 128;
         this.cbRarity_mc.scrollbarOffsetX = -30;
         this.cbRarity_mc.scrollbarOffsetY = -2;
         this.cbRarity_mc.setOnOpenFunction(_loc1_.onOpenDropList);
         this.root_mc = root as MovieClip;
         this.inventory = new inventoryClass(0,"invCell",this.root_mc.invCols,this.root_mc.invRows,this.root_mc.invCellSize,this.root_mc.invCellSize,this.root_mc.invCellSpacing);
         this.slotHolder_mc.addChild(this.inventory);
         this.inventory.x = 4;
         this.inventory.y = -1;
         this.inventory.m_Base = this.root_mc;
         this.inventory.bgDiscrap = -3;
         this.inventory.minRows = 8;
         this.inventory.gridRefresh = true;
         this.inventory.addEventListener("GridChanged",this.gridChangeCallback);
         this.inventory.customIggyName = "inv";
         this.inventory.setFrame(308,529);
         this.inventory.m_scrollbar_mc.m_hideWhenDisabled = false;
         this.inventory.mouseWheelWhenOverEnabled = true;
         this.inventory.m_scrollbar_mc.x = -19;
         this.inventory.m_scrollbar_mc.y = 0;
         this.inventory.m_scrollbar_mc.ScaleBG = true;
         this.inventory.m_scrollbar_mc.setLength(529);
         this.nbLevel_mc.setOnValueChangedCallback(_loc1_.onChangeGenerationLevel);
         this.nbLevel_mc.minimum = 1;
         this.nbLevel_mc.maximum = 50;
         this.nbLevel_mc.value = 1;
         this.bg_mc.init();
      }
      
      public function gridChangeCallback(param1:Event) : *
      {
         var _loc2_:inventoryClass = param1.currentTarget as inventoryClass;
         ExternalInterface.call("rowsChanged",_loc2_.row);
         this.root_mc.invRows = _loc2_.row;
         this.inventory.m_scrollbar_mc.scrollDown();
      }
      
      function frame1() : *
      {
      }
   }
}
