package
{
   import LS_Classes.textEffect;
   import LS_Classes.tooltipHelper;
   import flash.display.MovieClip;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   
   public dynamic class CellC extends MovieClip
   {
       
      
      public var active_mc:MovieClip;
      
      public var amount_txt:TextField;
      
      public var selector_mc:MovieClip;
      
      public var base:MovieClip;
      
      public function CellC()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function selectElement() : *
      {
         this.selector_mc.visible = true;
         if(this.base && this.base.allowSound)
         {
            ExternalInterface.call("PlaySound","UI_Game_Inventory_Over");
         }
         ExternalInterface.call("slotOver",Number(this.itemHandle));
         this.showTooltip();
      }
      
      public function showTooltip() : *
      {
         var _loc1_:Number = NaN;
         if(this.base && this.amount > 0)
         {
            _loc1_ = -8;
            this.tooltipYOffset = _loc1_;
            this.tooltipXOffset = 4;
            this.contextParam = this.base.craftPanel_mc.runesPanel_mc.targetHit_mc.contextParam;
            tooltipHelper.ShowItemTooltipForMC(this,this.base,"rightTop");
         }
         else
         {
            ExternalInterface.call("hideTooltip");
         }
      }
      
      public function deselectElement() : *
      {
         if(this.amount > 0)
         {
            ExternalInterface.call("slotOut",this.itemHandle);
         }
         this.selector_mc.visible = false;
      }
      
      public function cellInit() : *
      {
      }
      
      function frame1() : *
      {
         this.amount_txt.filters = textEffect.createStrokeFilter(1050888,1.4,1,1.8,3);
         this.amount_txt.mouseEnabled = false;
      }
   }
}
