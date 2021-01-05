package journal_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class BtnZoomOut_11 extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public var disabled_mc:MovieClip;
      
      public var pressedFunc:Function;
      
      public function BtnZoomOut_11()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         ExternalInterface.call("hideTooltip");
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.bg_mc.gotoAndStop(1);
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         if(this.tooltip && this.tooltip != "")
         {
            ExternalInterface.call("showTooltip",this.tooltip);
         }
         if(!this.disabled_mc.visible)
         {
            ExternalInterface.call("PlaySound","UI_Generic_Over");
            this.bg_mc.gotoAndStop(2);
         }
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         if(!this.disabled_mc.visible)
         {
            addEventListener(MouseEvent.MOUSE_UP,this.onUp);
            this.bg_mc.gotoAndStop(3);
         }
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         if(!this.disabled_mc.visible)
         {
            if(this.pressedFunc != null)
            {
               ExternalInterface.call("PlaySound","UI_Game_MiniMap_In");
               this.pressedFunc();
            }
            this.bg_mc.gotoAndStop(2);
         }
      }
      
      public function enable() : *
      {
         this.disabled_mc.visible = false;
      }
      
      public function disable() : *
      {
         this.disabled_mc.visible = true;
      }
      
      function frame1() : *
      {
         this.bg_mc.mouseEnabled = false;
         this.disabled_mc.mouseEnabled = false;
         this.pressedFunc = null;
         addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
      }
   }
}
