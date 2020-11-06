package GMJournal_fla
{
   import flash.display.MovieClip;
   
   public dynamic class toggleEditButtonActive_6 extends MovieClip
   {
       
      
      public function toggleEditButtonActive_6()
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
