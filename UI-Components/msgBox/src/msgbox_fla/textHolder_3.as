package msgbox_fla
{
   import LS_Classes.scrollbar_text;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public dynamic class textHolder_3 extends MovieClip
   {
       
      
      public var text_txt:TextField;
      
      public var sb:scrollbar_text;
      
      public function textHolder_3()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      function frame1() : *
      {
         stop();
         this.sb = new scrollbar_text();
         this.addChild(this.sb);
         this.sb.m_hideWhenDisabled = true;
         this.sb.addContent(this.text_txt);
         this.sb.mouseWheelWhenOverEnabled = true;
      }
   }
}
