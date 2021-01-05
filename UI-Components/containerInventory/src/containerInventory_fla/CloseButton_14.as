package containerInventory_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class CloseButton_14 extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public var disabled_mc:MovieClip;
      
      public var base:MovieClip;
      
      public function CloseButton_14()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onMouseOver(param1:MouseEvent) : *
      {
         if(!this.disabled_mc.visible)
         {
            this.bg_mc.gotoAndStop(2);
            ExternalInterface.call("PlaySound","UI_Generic_Over");
         }
         if(this.tooltip != null)
         {
            ExternalInterface.call("showTooltip",this.tooltip);
         }
      }
      
      public function onMouseOut(param1:MouseEvent) : *
      {
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.bg_mc.gotoAndStop(1);
         if(this.tooltip != null)
         {
            ExternalInterface.call("hideTooltip");
         }
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.bg_mc.gotoAndStop(2);
         ExternalInterface.call("PlaySound","UI_Generic_Click");
         (parent as MovieClip).closeUI();
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         if(!this.disabled_mc.visible)
         {
            addEventListener(MouseEvent.MOUSE_UP,this.onUp);
            this.bg_mc.gotoAndStop(3);
         }
      }
      
      function frame1() : *
      {
         this.base = root as MovieClip;
         addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         addEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
         addEventListener(MouseEvent.ROLL_OVER,this.onMouseOver);
      }
   }
}
