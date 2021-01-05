package
{
   import LS_Classes.textEffect;
   import LS_Classes.tooltipHelper;
   import flash.display.MovieClip;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   
   public dynamic class invCell extends MovieClip
   {
       
      
      public var amount_txt:TextField;
      
      public var selector_mc:MovieClip;
      
      public var spacer_mc:MovieClip;
      
      public function invCell()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function selectElement() : *
      {
         this.selector_mc.visible = true;
         var _loc1_:MovieClip = root as MovieClip;
         if(_loc1_.allowSound)
         {
            ExternalInterface.call("PlaySound","UI_Game_Inventory_Over");
         }
         ExternalInterface.call("slotOver",Number(this.itemHandle));
         this.showTooltip();
      }
      
      public function showTooltip() : *
      {
         var _loc1_:MovieClip = null;
         if(this.amount > 0)
         {
            _loc1_ = root as MovieClip;
            this.tooltipYOffset = -9;
            this.tooltipXOffset = 7;
            tooltipHelper.ShowItemTooltipForMC(this,_loc1_,"rightTop");
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
         this.spacer_mc.visible = false;
      }
   }
}
