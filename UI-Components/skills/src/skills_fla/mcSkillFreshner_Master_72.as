package skills_fla
{
   import flash.display.MovieClip;
   
   public dynamic class mcSkillFreshner_Master_72 extends MovieClip
   {
       
      
      public function mcSkillFreshner_Master_72()
      {
         super();
         addFrameScript(0,this.frame1,73,this.frame74);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame74() : *
      {
         gotoAndStop(1);
         this.visible = false;
      }
   }
}
