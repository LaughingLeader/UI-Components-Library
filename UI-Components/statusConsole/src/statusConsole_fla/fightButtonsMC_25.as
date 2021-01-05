package statusConsole_fla
{
   import flash.display.MovieClip;
   import flash.external.ExternalInterface;
   
   public dynamic class fightButtonsMC_25 extends MovieClip
   {
       
      
      public var duoBtns_mc:MovieClip;
      
      public var endBtn_mc:endTurnButton;
      
      public var hit_mc:MovieClip;
      
      public var showTxtHitBox_mc:MovieClip;
      
      public function fightButtonsMC_25()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onBtnTurnEnd() : *
      {
         ExternalInterface.call("EndButtonPressed");
      }
      
      function frame1() : *
      {
         this.endBtn_mc.init(this.onBtnTurnEnd);
         this.endBtn_mc.setEnabled(true);
         this.endBtn_mc.SND_Press = "UI_GM_Generic_BigButton_Press";
         this.endBtn_mc.SND_Click = "UI_GM_Generic_BigButton_Release";
      }
   }
}
