package
{
   import LS_Classes.LSStateButton;
   
   public dynamic class btnGMCombo extends LSStateButton
   {
       
      
      public function btnGMCombo()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function foo() : void
      {
      }
      
      function frame1() : *
      {
         textY = text_txt.y;
         init(this.foo);
      }
   }
}
