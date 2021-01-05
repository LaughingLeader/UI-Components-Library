package hotBar_fla
{
   import LS_Classes.tooltipHelper;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class chatBtnHolder_5 extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public function chatBtnHolder_5()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         this.bg_mc.gotoAndStop(1);
         ExternalInterface.call("hideTooltip");
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         ExternalInterface.call("PlaySound","UI_Generic_Over");
         this.bg_mc.gotoAndStop(2);
         tooltipHelper.ShowTooltipForMC(this.bg_mc,root,"right");
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         this.bg_mc.gotoAndStop(3);
         this.bg_mc.addEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         ExternalInterface.call("PlaySound","UI_Generic_Click");
         ExternalInterface.call("ToggleChatLog");
         this.bg_mc.gotoAndStop(2);
         this.bg_mc.removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      function frame1() : *
      {
         this.bg_mc.addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         this.bg_mc.addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         this.bg_mc.addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
      }
   }
}
