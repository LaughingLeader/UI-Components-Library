package statusConsole_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class waitButton_35 extends MovieClip
   {
       
      
      public var disabled_mc:MovieClip;
      
      public function waitButton_35()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         if(!this.disabled_mc.visible)
         {
            this.gotoAndStop(3);
            addEventListener(MouseEvent.MOUSE_UP,this.onUp);
         }
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         ExternalInterface.call("PlaySound","UI_Gen_XButton_Click");
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         ExternalInterface.call("GuardPressed");
         this.gotoAndStop(2);
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         if(!this.disabled_mc.visible)
         {
            this.gotoAndStop(2);
         }
         var _loc2_:MovieClip = root as MovieClip;
         if(_loc2_ && _loc2_.turnNotice_mc.visible)
         {
            _loc2_.showTooltipForMC(this);
         }
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.gotoAndStop(1);
         if(this.tooltip != null && this.tooltip != "")
         {
            ExternalInterface.call("hideTooltip");
         }
      }
      
      function frame1() : *
      {
         stop();
         addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onOut);
      }
   }
}
