package characterSheet_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public dynamic class inventoryBg_26 extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public function inventoryBg_26()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init() : *
      {
         addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         addEventListener(MouseEvent.MOUSE_WHEEL,this.onScroll);
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         stage.focus = null;
         var _loc2_:MovieClip = root as MovieClip;
      }
      
      public function onScroll(param1:MouseEvent) : *
      {
      }
      
      function frame1() : *
      {
      }
   }
}
