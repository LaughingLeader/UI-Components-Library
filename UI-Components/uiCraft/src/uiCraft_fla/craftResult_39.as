package uiCraft_fla
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public dynamic class craftResult_39 extends MovieClip
   {
       
      
      public var effect_mc:MovieClip;
      
      public var noResult_txt:TextField;
      
      public var resultIcon_mc:MovieClip;
      
      public var isEmpty:Boolean;
      
      public function craftResult_39()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      function frame1() : *
      {
         this.isEmpty = false;
      }
   }
}
