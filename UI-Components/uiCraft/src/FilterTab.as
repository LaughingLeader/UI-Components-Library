package
{
   import LS_Classes.tooltipHelper;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class FilterTab extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public var icon_mc:MovieClip;
      
      public var select_mc:MovieClip;
      
      public var fadeTime:Number;
      
      public var iconY:Number;
      
      public function FilterTab()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onOver(param1:MouseEvent = null) : *
      {
         ExternalInterface.call("PlaySound","UI_Game_Inventory_Over");
         if(!this.select_mc.visible)
         {
            this.bg_mc.gotoAndStop(2);
         }
         else
         {
            this.select_mc.gotoAndStop(2);
         }
         if(this.tooltip && this.tooltip != "")
         {
            this.tooltipYOffset = -8;
            tooltipHelper.ShowTooltipForMC(this,root,"right");
         }
      }
      
      public function onOut(param1:MouseEvent = null) : *
      {
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         if(!this.select_mc.visible)
         {
            this.bg_mc.gotoAndStop(1);
         }
         else
         {
            this.select_mc.gotoAndStop(1);
         }
         if(this.tooltip)
         {
            ExternalInterface.call("hideTooltip",this.tooltip);
         }
         this.icon_mc.y = this.iconY;
      }
      
      public function onDown(param1:MouseEvent = null) : *
      {
         addEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.icon_mc.y = this.iconY + 2;
         if(!this.select_mc.visible)
         {
            this.bg_mc.gotoAndStop(3);
         }
         else
         {
            this.select_mc.gotoAndStop(3);
         }
      }
      
      public function onUp(param1:MouseEvent = null) : *
      {
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.icon_mc.y = this.iconY;
         if(!this.select_mc.visible)
         {
            this.bg_mc.gotoAndStop(2);
            ExternalInterface.call("PlaySound","UI_Game_Inventory_Click");
            (root as MovieClip).selectFilterTab(this.id);
         }
         else
         {
            this.select_mc.gotoAndStop(2);
         }
      }
      
      public function selectElement(param1:* = null) : *
      {
         this.bg_mc.gotoAndStop(2);
         this.select_mc.gotoAndStop(2);
         this.select_mc.visible = true;
      }
      
      public function deselectElement(param1:* = null) : *
      {
         this.bg_mc.gotoAndStop(1);
         this.select_mc.gotoAndStop(1);
         this.select_mc.visible = false;
      }
      
      function frame1() : *
      {
         this.fadeTime = 0.8;
         mouseChildren = false;
         this.iconY = 4;
         addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
      }
   }
}
