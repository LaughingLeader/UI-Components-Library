package
{
   import LS_Classes.LSButton;
   import LS_Classes.textEffect;
   
   public dynamic class ButtonSmall extends LSButton
   {
       
      
      public function ButtonSmall()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      function frame1() : *
      {
         text_txt.filters = textEffect.createStrokeFilter(0,1,0.8,1,3);
      }
   }
}
