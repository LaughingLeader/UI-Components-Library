package characterSheet_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public dynamic class playerCycleButton_23 extends MovieClip
   {
       
      
      public var arrow_mc:MovieClip;
      
      public var root_mc:MovieClip;
      
      public var cycleLeft:Boolean;
      
      public function playerCycleButton_23()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function initButton(param1:Boolean) : *
      {
         this.arrow_mc.gotoAndStop(!!param1?1:2);
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
         this.root_mc.cycleCharList(this.cycleLeft);
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      function frame1() : *
      {
         stop();
         this.root_mc = root as MovieClip;
         addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onOut);
      }
   }
}
