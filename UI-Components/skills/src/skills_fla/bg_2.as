package skills_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public dynamic class bg_2 extends MovieClip
   {
       
      
      public function bg_2()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function handleWheel(param1:MouseEvent) : void
      {
      }
      
      function frame1() : *
      {
         addEventListener(MouseEvent.MOUSE_WHEEL,this.handleWheel);
      }
   }
}
