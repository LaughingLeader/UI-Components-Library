package GMJournal_fla
{
   import flash.display.MovieClip;
   
   public dynamic class toggleEditButtonBackground_5 extends MovieClip
   {
       
      
      public function toggleEditButtonBackground_5()
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
