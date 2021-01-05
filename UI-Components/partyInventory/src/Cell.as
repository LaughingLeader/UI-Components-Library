package
{
   import LS_Classes.textEffect;
   import LS_Classes.tooltipHelper;
   import flash.display.MovieClip;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   
   public dynamic class Cell extends MovieClip
   {
       
      
      public var amount_txt:TextField;
      
      public var isnewitem_mc:MovieClip;
      
      public var selector_mc:MovieClip;
      
      public var base:MovieClip;
      
      public var isNewItem:Boolean;
      
      public var _itemHandle:Number;
      
      public function Cell()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function set itemHandle(param1:Number) : void
      {
         this._itemHandle = param1;
         if(this._itemHandle == 0)
         {
            this.setIsNewItem(false);
         }
      }
      
      public function get itemHandle() : Number
      {
         return this._itemHandle;
      }
      
      public function selectElement() : void
      {
         this.selector_mc.visible = true;
         this.isNewItem = false;
         this.isnewitem_mc.visible = false;
         if(this.base && this.base.allowSound)
         {
            ExternalInterface.call("PlaySound","UI_Game_Inventory_Over");
         }
         ExternalInterface.call("slotOver",Number(this.itemHandle));
         if(root != null)
         {
            this.showTooltip();
         }
      }
      
      public function setIsNewItem(param1:Boolean) : void
      {
         this.isNewItem = param1;
         this.isnewitem_mc.visible = this.isNewItem;
      }
      
      public function showTooltip() : *
      {
         if(this.base)
         {
            this.base.curTooltip = this.pos;
            if(this.amount > 0)
            {
               tooltipHelper.ShowItemTooltipForMC(this,this.base,"rightTop");
            }
            else
            {
               ExternalInterface.call("hideTooltip");
            }
         }
      }
      
      public function deselectElement() : void
      {
         if(this.amount > 0)
         {
            ExternalInterface.call("slotOut",this.itemHandle);
         }
         this.selector_mc.visible = false;
         if(this.base)
         {
            this.base.curTooltip = -1;
         }
      }
      
      public function cellInit() : *
      {
         this.isnewitem_mc.visible = false;
         this.isNewItem = false;
      }
      
      function frame1() : *
      {
         this.amount_txt.filters = textEffect.createStrokeFilter(1050888,1.4,1,1.8,3);
         this.amount_txt.mouseEnabled = false;
      }
   }
}
