package uiCraft_fla
{
   import flash.display.MovieClip;
   
   public dynamic class craftResultSlot_37 extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public function craftResultSlot_37()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      function frame1() : *
      {
         this.bg_mc.mouseEnabled = false;
         this.bg_mc.mouseChildren = false;
      }
   }
}
