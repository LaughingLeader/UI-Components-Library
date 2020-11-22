package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class btnYes_id extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public function btnYes_id()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         var _loc2_:MovieClip = root as MovieClip;
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         ExternalInterface.call("PlaySound","UI_Generic_Click");
         ExternalInterface.call("ButtonPressed",this.id,_loc2_.currentDevice);
         ExternalInterface.call("S7_msgBoxBtnClick", this.id, _loc2_.currentDevice);
         this.bg_mc.gotoAndStop(2);
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         this.bg_mc.gotoAndStop(1);
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         ExternalInterface.call("PlaySound","UI_Generic_Over");
         this.bg_mc.gotoAndStop(2);
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         addEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.bg_mc.gotoAndStop(3);
      }
      
      function frame1() : *
      {
         addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         addEventListener(MouseEvent.ROLL_OVER,this.onOver);
      }
   }
}
