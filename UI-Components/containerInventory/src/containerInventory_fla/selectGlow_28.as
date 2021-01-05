package containerInventory_fla
{
   import flash.display.MovieClip;
   
   public dynamic class selectGlow_28 extends MovieClip
   {
       
      
      public var glow_mc:MovieClip;
      
      public function selectGlow_28()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,179,this.frame180);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame2() : *
      {
         play();
      }
      
      function frame180() : *
      {
         gotoAndPlay(2);
      }
   }
}
