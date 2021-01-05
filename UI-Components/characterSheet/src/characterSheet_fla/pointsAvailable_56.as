package characterSheet_fla
{
   import LS_Classes.textHelpers;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public dynamic class pointsAvailable_56 extends MovieClip
   {
       
      
      public var civilAbilPoints_txt:TextField;
      
      public var combatAbilPoints_txt:TextField;
      
      public var label_txt:TextField;
      
      public var statPoints_txt:TextField;
      
      public var talentPoints_txt:TextField;
      
      public function pointsAvailable_56()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function setTab(param1:uint) : *
      {
         this.statPoints_txt.visible = Boolean(param1 == 0);
         this.combatAbilPoints_txt.visible = Boolean(param1 == 1);
         this.civilAbilPoints_txt.visible = Boolean(param1 == 2);
         this.talentPoints_txt.visible = Boolean(param1 == 3);
      }
      
      function frame1() : *
      {
         textHelpers.smallCaps(this.label_txt);
      }
   }
}
