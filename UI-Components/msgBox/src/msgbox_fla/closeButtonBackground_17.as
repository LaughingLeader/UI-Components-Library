package msgBox_fla
{
   import flash.display.MovieClip;
   
   public dynamic class closeButtonBackground_17 extends MovieClip
   {
       
      
      public function closeButtonBackground_17()
      {
         super();
         addFrameScript(0,this.frame1,2,this.frame3);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame3() : *
      {
         gotoAndStop(2);
      }
   }
}
