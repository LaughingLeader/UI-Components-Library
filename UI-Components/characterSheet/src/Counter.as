package
{
   import LS_Classes.LSInputField;
   
   public dynamic class Counter extends LSInputField
   {
       
      
      public function Counter()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function setPlusPressSound(param1:String) : *
      {
         plus_mc.SND_Press = param1;
      }
      
      public function setPlusReleaseSound(param1:String) : *
      {
         plus_mc.SND_Click = param1;
      }
      
      public function setMinusPressSound(param1:String) : *
      {
         minus_mc.SND_Press = param1;
      }
      
      public function setMinusReleaseSound(param1:String) : *
      {
         minus_mc.SND_Click = param1;
      }
      
      function frame1() : *
      {
         this.maxChars = 5;
         this.setPlusPressSound("UI_GM_Generic_Click_Press");
         this.setPlusReleaseSound("UI_GM_Generic_Click_Release");
         this.setMinusPressSound("UI_GM_Generic_Click_Press");
         this.setMinusReleaseSound("UI_GM_Generic_Click_Release");
      }
   }
}
