package
{
   import LS_Classes.grid;
   import flash.display.MovieClip;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public dynamic class skillList extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public var iggySkills_mc:MovieClip;
      
      public var listContainer_mc:MovieClip;
      
      public var memoryCost_mc:MovieClip;
      
      public var title_txt:TextField;
      
      public const darkColour:uint = 3024416;
      
      public const redColour:uint = 7405568;
      
      public var memoryCost:uint;
      
      public var list:grid;
      
      public function skillList()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function initList(param1:uint, param2:uint, param3:uint, param4:MovieClip, param5:Boolean = false) : *
      {
         if(param1 >= 0 && param1 <= 4)
         {
            this.memoryCost = param1;
            this.memoryCost_mc.gotoAndStop(param1 + 1);
            this.memoryCost_mc.text_txt.autoSize = TextFieldAutoSize.LEFT;
            if(param4)
            {
               this.memoryCost_mc.text_txt.htmlText = param4.memoryText[0] + " <font color=\'#710000\'>" + param1 + " " + param4.memoryText[1] + "</font>";
            }
         }
         else
         {
            ExternalInterface.call("UIAssert"," skillList::initList -> This memory amount isn\'t supported in the design: " + param1);
         }
         this.list = new grid();
         this.listContainer_mc.addChild(this.list);
         this.list.col = param3;
         this.list.row = 0;
         this.list.EL_SPACING = -10;
         this.list.ROW_SPACING = -10;
         this.bg_mc.width = param2;
         this.bg_mc.alpha = !!param5?Number(1):Number(0.1);
         this.memoryCost_mc.x = param2 - this.memoryCost_mc.width - 30;
         this.title_txt.autoSize = TextFieldAutoSize.LEFT;
      }
      
      public function deactivateAllSkills() : *
      {
         var _loc2_:uint = 0;
         var _loc3_:MovieClip = null;
         var _loc1_:Number = this.list.length;
         if(_loc1_ > 0)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = this.list.getAt(_loc2_);
               if(_loc3_)
               {
                  _loc3_.isActive = false;
               }
               _loc2_++;
            }
         }
      }
      
      public function findSkillByTooltipID(param1:String) : MovieClip
      {
         var _loc4_:uint = 0;
         var _loc2_:MovieClip = null;
         var _loc3_:Number = this.list.length;
         if(_loc3_ > 0)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc2_ = this.list.getAt(_loc4_);
               if(_loc2_.tooltipID == param1)
               {
                  break;
               }
               _loc2_ = null;
               _loc4_++;
            }
         }
         return _loc2_;
      }
      
      function frame1() : *
      {
         this.memoryCost = 0;
      }
   }
}
