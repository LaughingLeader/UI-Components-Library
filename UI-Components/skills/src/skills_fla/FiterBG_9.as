package skills_fla
{
   import flash.display.MovieClip;
   
   public dynamic class FiterBG_9 extends MovieClip
   {
       
      
      public var LFBG_mc:MovieClip;
      
      public var MFBG_mc:MovieClip;
      
      public var RFBG_mc:MovieClip;
      
      public function FiterBG_9()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function setWidth(param1:Number) : *
      {
         this.MFBG_mc.width = param1 - this.LFBG_mc.width - this.RFBG_mc.width;
         this.RFBG_mc.x = this.MFBG_mc.width + this.MFBG_mc.x;
      }
      
      function frame1() : *
      {
      }
   }
}
