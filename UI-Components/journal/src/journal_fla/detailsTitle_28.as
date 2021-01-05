package journal_fla
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public dynamic class detailsTitle_28 extends MovieClip
   {
       
      
      public var subTitle_txt:TextField;
      
      public var titleDecoL_mc:MovieClip;
      
      public var titleDecoR_mc:MovieClip;
      
      public var title_txt:TextField;
      
      public function detailsTitle_28()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function setDeco() : *
      {
         var _loc1_:Number = 28;
         var _loc2_:Number = Math.round((this.title_txt.width - this.title_txt.textWidth) * 0.5) - _loc1_;
         this.titleDecoL_mc.x = _loc2_;
         this.titleDecoR_mc.x = this.title_txt.width - _loc2_;
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}
