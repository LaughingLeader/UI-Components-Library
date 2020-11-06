package GMJournal_fla
{
   import flash.display.MovieClip;
   
   public dynamic class expandActive_33 extends MovieClip
   {
       
      
      public function expandActive_33()
      {
         super();
         addFrameScript(0,this.frame1,3,this.frame4);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame4() : *
      {
         gotoAndStop(1);
      }
   }
}
