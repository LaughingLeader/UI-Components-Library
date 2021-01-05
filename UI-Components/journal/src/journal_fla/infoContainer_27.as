package journal_fla
{
   import flash.display.MovieClip;
   import flash.text.TextFieldAutoSize;
   
   public dynamic class infoContainer_27 extends MovieClip
   {
       
      
      public var title_mc:MovieClip;
      
      public function infoContainer_27()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init() : *
      {
         this.title_mc.subTitle_txt.autoSize = this.title_mc.title_txt.autoSize = TextFieldAutoSize.CENTER;
      }
      
      function frame1() : *
      {
      }
   }
}
