package statusConsole_fla
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public dynamic class Console_1 extends MovieClip
   {
       
      
      public var abTxt_mc:TextField;
      
      public var ap_mc:MovieClip;
      
      public var frame_mc:MovieClip;
      
      public var hbHolder_mc:healthBarHolder;
      
      public var hbTxt_mc:TextField;
      
      public var leftArmourBarHolder_mc:armourBarHolderPhys;
      
      public var mabTxt_mc:TextField;
      
      public var rightArmourBarHolder_mc:armourBarHolder;
      
      public var sourceHolder_mc:MovieClip;
      
      public var root_mc:MovieClip;
      
      public function Console_1()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function setRightArmourBar(param1:Number, param2:String, param3:Boolean) : *
      {
         if(param1 > 1)
         {
            param1 = 1;
         }
         else if(param1 < 0)
         {
            param1 = 0;
         }
         if(this.rightArmourBarHolder_mc.scaleX != 1)
         {
            this.rightArmourBarHolder_mc.scaleX = 1;
         }
         this.mabTxt_mc.htmlText = param2;
         this.rightArmourBarHolder_mc.setBar(param1,param3);
      }
      
      public function setLeftArmourBar(param1:Number, param2:String, param3:Boolean) : *
      {
         if(param1 > 1)
         {
            param1 = 1;
         }
         else if(param1 < 0)
         {
            param1 = 0;
         }
         if(this.leftArmourBarHolder_mc.scaleX != -1)
         {
            this.leftArmourBarHolder_mc.scaleX = -1;
         }
         this.abTxt_mc.htmlText = param2;
         this.leftArmourBarHolder_mc.setBar(param1,param3);
      }
      
      function frame1() : *
      {
         this.root_mc = root as MovieClip;
      }
   }
}
