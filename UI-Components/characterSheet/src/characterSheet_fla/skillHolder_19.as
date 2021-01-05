package characterSheet_fla
{
   import LS_Classes.scrollList;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class skillHolder_19 extends MovieClip
   {
       
      
      public var iggy_Skills:MovieClip;
      
      public var listHolder_mc:empty;
      
      public var skillLists:scrollList;
      
      public var root_mc:MovieClip;
      
      public function skillHolder_19()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init() : *
      {
         this.iggy_Skills.bg_mc.alpha = 0;
         this.skillLists.containerBG_mc.addChild(this.iggy_Skills);
         this.skillLists.y = 1;
         this.iggy_Skills.y = 43;
         this.iggy_Skills.x = 60;
         this.root_mc = root as MovieClip;
         if(this.root_mc)
         {
            this.skillLists.EL_SPACING = 10;
         }
      }
      
      public function updateSkillList(param1:Array) : *
      {
         var _loc2_:uint = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:String = null;
         var _loc6_:uint = 0;
         var _loc7_:String = null;
         var _loc8_:Boolean = false;
         if(param1.length > 0)
         {
            _loc2_ = 0;
            while(_loc2_ < param1.length)
            {
               _loc3_ = param1[_loc2_++];
               _loc4_ = param1[_loc2_++];
               _loc5_ = param1[_loc2_++];
               _loc6_ = param1[_loc2_++];
               _loc7_ = param1[_loc2_++];
               _loc8_ = param1[_loc2_++];
               this.addSkillToList(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
            }
         }
         this.cleanUpLists();
         this.skillLists.positionElements();
         this.skillLists.sortOn("skillSchool",Array.NUMERIC);
         this.iggy_Skills.bg_mc.width = this.skillLists.width;
         this.iggy_Skills.bg_mc.height = this.skillLists.containerContent_mc.height;
      }
      
      public function addSkillToList(param1:Number, param2:Number, param3:String, param4:uint, param5:String, param6:Boolean) : *
      {
         var _loc7_:MovieClip = this.skillLists.getElementByNumber("skillSchool",param4);
         if(!_loc7_)
         {
            _loc7_ = new skillList();
            this.skillLists.addElement(_loc7_,false);
            _loc7_.skillSchool = param4;
            _loc7_.schoolName = param5.toUpperCase();
            _loc7_.init();
         }
         _loc7_.addSkill(param1,param2,param3,param6);
      }
      
      public function cleanUpLists() : *
      {
         var _loc2_:MovieClip = null;
         var _loc1_:uint = 0;
         while(_loc1_ < this.skillLists.length)
         {
            _loc2_ = this.skillLists.getAt(_loc1_);
            if(_loc2_)
            {
               _loc2_.cleanUpSkills();
               if(_loc2_.skillGrid.length > 0)
               {
                  _loc1_++;
               }
               else
               {
                  this.skillLists.removeElement(_loc1_,false);
               }
            }
         }
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         addEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         if(this.root_mc.isDragging)
         {
            ExternalInterface.call(!!this.root_mc.draggingSkill?"cancelSkillDragging":"LearnSkill");
            this.root_mc.draggingSkill = false;
         }
      }
      
      function frame1() : *
      {
         addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         this.skillLists = new scrollList();
         this.skillLists.setFrame(328,735);
         this.skillLists.m_scrollbar_mc.m_hideWhenDisabled = false;
         this.skillLists.scrollbarSpacing = -351;
         this.skillLists.TOP_SPACING = 13;
         this.skillLists.mouseWheelWhenOverEnabled = true;
         this.skillLists.m_scrollbar_mc.setLength(667);
         this.skillLists.m_scrollbar_mc.x = -24;
         this.skillLists.m_scrollbar_mc.y = 19;
         this.listHolder_mc.addChild(this.skillLists);
      }
   }
}
