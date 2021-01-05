package statusConsole_fla
{
   import flash.display.MovieClip;
   
   public dynamic class duoBtns_31 extends MovieClip
   {
       
      
      public var blackBG_mc:MovieClip;
      
      public var duoFrame_mc:MovieClip;
      
      public var fleeBtn_mc:MovieClip;
      
      public var waitBtn_mc:MovieClip;
      
      public function duoBtns_31()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      function frame1() : *
      {
         this.duoFrame_mc.mouseEnabled = false;
         this.duoFrame_mc.mouseChildren = false;
      }
   }
}
