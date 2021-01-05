package uiCraft_fla
{
   import flash.display.MovieClip;
   
   public dynamic class progressBar_7 extends MovieClip
   {
       
      
      public var bar_mc:MovieClip;
      
      public function progressBar_7()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function updateProgress(param1:Number) : *
      {
         this.bar_mc.scaleX = param1;
      }
      
      function frame1() : *
      {
      }
   }
}
