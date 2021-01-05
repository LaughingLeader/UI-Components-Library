package
{
   import LS_Classes.grid;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public dynamic class skillList extends MovieClip
   {
       
      
      public var gridHolder_mc:empty;
      
      public var school_txt:TextField;
      
      public var skillGrid:grid;
      
      public var root_mc:MovieClip;
      
      public function skillList()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init() : *
      {
         this.school_txt.htmlText = this.schoolName;
         this.skillGrid = new grid();
         this.gridHolder_mc.addChild(this.skillGrid);
         this.root_mc = root as MovieClip;
         if(this.root_mc)
         {
            this.skillGrid.col = this.root_mc.skillCols;
            this.skillGrid.row = 0;
            this.skillGrid.ROW_SPACING = this.root_mc.spacingV;
            this.skillGrid.EL_SPACING = this.root_mc.spacingH;
         }
      }
      
      public function addSkill(param1:Number, param2:Number, param3:String, param4:Boolean) : *
      {
         var _loc5_:MovieClip = this.skillGrid.getElementByNumber("skillHandle",param2);
         if(!_loc5_)
         {
            _loc5_ = new skillEl();
            this.skillGrid.addElement(_loc5_,false);
            _loc5_.onInit(this.root_mc);
            _loc5_.skillHandle = param2;
            _loc5_.skillID = param3;
            _loc5_.canBeRemoved = param4;
         }
         _loc5_.sortID = param1;
         _loc5_.isUpdated = true;
      }
      
      public function cleanUpSkills() : *
      {
         var _loc2_:MovieClip = null;
         var _loc1_:uint = 0;
         while(_loc1_ < this.skillGrid.length)
         {
            _loc2_ = this.skillGrid.getAt(_loc1_);
            if(_loc2_.isUpdated)
            {
               _loc2_.isUpdated = false;
               _loc1_++;
            }
            else
            {
               this.skillGrid.removeElement(_loc1_,false);
            }
         }
         this.skillGrid.sortOn("sortID",Array.NUMERIC);
         this.skillGrid.positionElements();
      }
      
      function frame1() : *
      {
      }
   }
}
