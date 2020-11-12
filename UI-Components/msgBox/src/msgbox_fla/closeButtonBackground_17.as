package msgBox_fla
{
   import flash.display.MovieClip;
   
   public dynamic class closeButtonBackground_17 extends MovieClip
   {
       
      
      public function closeButtonBackground_17()
      {
         super();
         addFrameScript(0,this.frame1, 1, this.frame2, 2,this.frame3);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame2() : *
      {
         gotoAndStop(2);
      }

      function frame3() : *
      {
         gotoAndStop(2);
      }
   }
}
