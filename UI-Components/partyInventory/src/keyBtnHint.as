package
{
   import LS_Classes.LSButton;
   import flash.text.TextFieldAutoSize;
   
   public dynamic class keyBtnHint extends LSButton
   {
       
      
      public function keyBtnHint()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function setupBtn(param1:String, param2:String) : *
      {
         text_txt.autoSize = TextFieldAutoSize.LEFT;
         text_txt.htmlText = "<font color=#dca048>[" + param1 + "]</font>" + param2;
         bg_mc.width = Math.round(text_txt.textWidth + text_txt.x * 2);
      }
      
      function frame1() : *
      {
      }
   }
}
