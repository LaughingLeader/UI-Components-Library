package
{
   import LS_Classes.textEffect;
   import LS_Classes.tooltipHelper;
   import flash.display.MovieClip;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   
   public dynamic class Cell extends MovieClip
   {
       
      
      public var active_mc:MovieClip;
      
      public var amount_txt:TextField;
      
      public var selector_mc:MovieClip;
      
      public var base:MovieClip;
      
      public function Cell()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function selectElement() : *
      {
         if(this.amount > 0)
         {
            ExternalInterface.call("slotOver",this.itemHandle);
         }
         if(this.base.isDragging && !this.base.draggingIngredient || this.amount > 0)
         {
            ExternalInterface.call("PlaySound","UI_Game_Craft_Over");
            this.selector_mc.visible = true;
            this.showTooltip();
         }
      }
      
      public function showTooltip() : *
      {
         this.base.curTooltip = this.pos;
         if(this.amount > 0)
         {
            if(this.inv)
            {
               this.tooltipYOffset = -8;
               this.tooltipXOffset = 6;
            }
            tooltipHelper.ShowItemTooltipForMC(this,root,"rightTop");
         }
      }
      
      public function deselectElement() : *
      {
         this.selector_mc.visible = false;
         if(this.amount > 0)
         {
            ExternalInterface.call("slotOut",this.itemHandle);
         }
         if(this.base)
         {
            if(this.base.hasTooltip && this.base.curTooltip == this.pos)
            {
               ExternalInterface.call("hideTooltip");
               this.base.hasTooltip = false;
            }
            this.base.curTooltip = -1;
         }
      }
      
      function frame1() : *
      {
         this.amount_txt.filters = textEffect.createStrokeFilter(1050888,1.4,1,1.8,3);
         this.amount_txt.mouseEnabled = false;
      }
   }
}
