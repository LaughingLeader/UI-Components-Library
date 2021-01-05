package statusConsole_fla
{
   import flash.display.MovieClip;
   
   public dynamic class mcSP_18 extends MovieClip
   {
       
      
      public function mcSP_18()
      {
         super();
         addFrameScript(0,this.frame1,230,this.frame231);
      }
      
      function frame1() : *
      {
         gotoAndPlay(Math.random() % 689);
      }
      
      function frame231() : *
      {
      }
   }
}
