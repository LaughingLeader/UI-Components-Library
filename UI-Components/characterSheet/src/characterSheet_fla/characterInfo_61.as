package characterSheet_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public dynamic class characterInfo_61 extends MovieClip
   {
       
      
      public var hit_mc:MovieClip;
      
      public var min_mc:MovieClip;
      
      public var plus_mc:MovieClip;
      
      public var renameBtn_mc:renameButton;
      
      public var selCharInfo_txt:TextField;
      
      public var root_mc:MovieClip;
      
      public function characterInfo_61()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onHitOut(param1:MouseEvent) : *
      {
         this.hit_mc.removeEventListener(MouseEvent.MOUSE_UP,this.onHitUp);
      }
      
      public function onHitDown(param1:MouseEvent) : *
      {
         this.hit_mc.addEventListener(MouseEvent.MOUSE_UP,this.onHitUp);
      }
      
      public function onHitUp(param1:MouseEvent) : *
      {
         this.hit_mc.removeEventListener(MouseEvent.MOUSE_UP,this.onHitUp);
         this.root_mc.stats_mc.renameCallback();
      }
      
      function frame1() : *
      {
         this.root_mc = root as MovieClip;
         this.hit_mc.addEventListener(MouseEvent.ROLL_OUT,this.onHitOut);
         this.hit_mc.addEventListener(MouseEvent.MOUSE_DOWN,this.onHitDown);
      }
   }
}
