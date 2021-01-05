package journal_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class closeTab_31 extends MovieClip
   {
       
      
      public var btn_mc:MovieClip;
      
      public var hit_mc:MovieClip;
      
      public function closeTab_31()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.btn_mc.gotoAndStop(1);
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         this.btn_mc.gotoAndStop(2);
         ExternalInterface.call("PlaySound","UI_Generic_Over");
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         ExternalInterface.call("PlaySound","UI_Gen_XButton_Click");
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         (root as MovieClip).fadeOut();
         this.btn_mc.gotoAndStop(2);
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         this.btn_mc.gotoAndStop(3);
         this.addEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      function frame1() : *
      {
         this.hit_mc.addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         this.hit_mc.addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         this.hit_mc.addEventListener(MouseEvent.ROLL_OVER,this.onOver);
      }
   }
}
