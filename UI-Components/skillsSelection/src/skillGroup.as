package
{
   import LS_Classes.grid;
   import LS_Classes.textHelpers;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public dynamic class skillGroup extends MovieClip
   {
       
      
      public var gridContainer_mc:MovieClip;
      
      public var text_txt:TextField;
      
      public var skillGrid:grid;
      
      public var root_mc:MovieClip;
      
      public function skillGroup()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onInit(param1:Number) : *
      {
         this.root_mc = root as MovieClip;
         this.skillGrid = new grid();
         this.skillGrid.x = 3;
         this.skillGrid.col = this.root_mc.numberOfCols;
         this.skillGrid.EL_SPACING = this.root_mc.iconSpacingH - 10;
         this.skillGrid.ROW_SPACING = this.root_mc.iconSpacingV - 10;
         this.gridContainer_mc.addChild(this.skillGrid);
         this.text_txt.htmlText = this.root_mc.skillSchoolString[param1];
         textHelpers.smallCaps(this.text_txt);
         this.tabID = param1;
      }
      
      public function addSkill(param1:String) : *
      {
         var _loc2_:MovieClip = null;
         if(this.skillGrid.getElementByString("skillID",param1) == null)
         {
            _loc2_ = new Skill();
            this.skillGrid.addElement(_loc2_);
            _loc2_.skillID = param1;
            _loc2_.root_mc = this.root_mc;
            _loc2_.isChosenSkill = false;
            _loc2_.skillActivated_mc.visible = false;
         }
      }
      
      public function findSkillbyId(param1:String) : MovieClip
      {
         return this.skillGrid.getElementByString("skillID",param1);
      }
      
      function frame1() : *
      {
      }
   }
}
