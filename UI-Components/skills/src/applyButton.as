package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public dynamic class applyButton extends MovieClip
   {
       
      
      public var text_txt:TextField;
      
      public function applyButton()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}
