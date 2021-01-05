package skills_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class playerCycleButtonR_38 extends MovieClip
   {
       
      
      public var cycleLeft:Boolean;
      
      public function playerCycleButtonR_38()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function initButton(param1:Boolean) : *
      {
         this.cycleLeft = param1;
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         gotoAndStop(2);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         gotoAndStop(1);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         gotoAndStop(3);
         addEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         gotoAndStop(2);
         ExternalInterface.call(!!this.cycleLeft?"prevCharacter":"nextCharacter");
      }
      
      function frame1() : *
      {
         stop();
         addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onOut);
      }
   }
}
