package msgbox_fla
{
   import LS_Classes.tooltipHelper;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class PasteBtn_9 extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public var base:MovieClip;
      
      public var onDownBool:Boolean;
      
      public var pressedFunc:Function;
      
      public function PasteBtn_9()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         if(this.base.hasTooltip)
         {
            ExternalInterface.call("hideTooltip");
            this.base.hasTooltip = false;
         }
         this.bg_mc.gotoAndStop(1);
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         if(this.tooltip != null && this.tooltip != "")
         {
            tooltipHelper.ShowTooltipForMC(this,root,"bottom");
         }
         this.bg_mc.gotoAndStop(2);
         ExternalInterface.call("PlaySound","UI_Generic_Over");
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         if(this.pressedFuncStr != null && this.pressedFuncStr != "")
         {
            ExternalInterface.call("PlaySound","UI_Generic_Click");
            ExternalInterface.call(this.pressedFuncStr);
         }
         this.bg_mc.gotoAndStop(2);
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         this.bg_mc.gotoAndStop(3);
         addEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      function frame1() : *
      {
         this.base = root as MovieClip;
         addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         this.onDownBool = false;
      }
   }
}
