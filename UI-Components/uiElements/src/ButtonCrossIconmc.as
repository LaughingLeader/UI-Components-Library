package
{
   import LS_Classes.LSButton;
   
   public dynamic class ButtonCrossIconmc extends LSButton
   {
       
      
      public function ButtonCrossIconmc()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      function frame1() : *
      {
         SND_Press = "UI_GM_Generic_Cancel_Press";
         SND_Click = "UI_GM_Generic_Cancel_Release";
      }
   }
}
