package
{
   import LS_Classes.grid;
   import flash.display.MovieClip;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public dynamic class memoryList extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public var frameHolder_mc:MovieClip;
      
      public var memoryContainer_mc:MovieClip;
      
      public var title_txt:TextField;
      
      public var maxMemory:int;
      
      public var memoryHolder:grid;
      
      public var usedMemory:uint;
      
      public var skillFrame_mc:MovieClip;
      
      public function memoryList()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function setMaxMemory(param1:int) : *
      {
         this.setupGrid(param1);
      }
      
      public function initMemory(param1:uint, param2:int = -1) : *
      {
         this.usedMemory = 0;
         this.memoryHolder = new grid();
         this.memoryContainer_mc.addChild(this.memoryHolder);
         this.memoryHolder.col = param1;
         this.memoryHolder.row = 0;
         this.memoryHolder.EL_SPACING = -10;
         this.memoryHolder.ROW_SPACING = 6;
         this.title_txt.autoSize = TextFieldAutoSize.LEFT;
         this.setupGrid(param2);
      }
      
      public function setupGrid(param1:int) : *
      {
         var _loc2_:uint = 0;
         var _loc3_:MovieClip = null;
         var _loc4_:int = 0;
         if(param1 > this.maxMemory)
         {
            _loc2_ = this.maxMemory;
            while(_loc2_ < param1)
            {
               _loc3_ = new memorySegment();
               _loc3_.bg_mc.gotoAndStop(1);
               this.memoryHolder.addElement(_loc3_,false,false);
               _loc2_++;
            }
         }
         else if(param1 <= 0)
         {
            this.memoryHolder.clearElements();
         }
         else if(param1 < this.maxMemory)
         {
            _loc4_ = this.maxMemory - 1;
            while(_loc4_ >= param1)
            {
               this.memoryHolder.removeElement(_loc4_,false);
               _loc4_--;
            }
         }
         this.maxMemory = param1;
         this.memoryHolder.positionElements();
         this.setBG();
      }
      
      public function clearSlots() : *
      {
         var _loc1_:uint = 0;
         var _loc2_:MovieClip = null;
         if(this.maxMemory == -1)
         {
            this.memoryHolder.clearElements();
         }
         else
         {
            _loc1_ = 0;
            while(_loc1_ < this.memoryHolder.length)
            {
               _loc2_ = this.memoryHolder.getAt(_loc1_);
               if(_loc2_)
               {
                  _loc2_.id = null;
                  _loc2_.kinSlots = null;
                  _loc2_.slotUpdated = false;
                  _loc2_.isExtraSlot = false;
                  _loc2_.localCellIndex = 0;
               }
               _loc1_++;
            }
         }
         this.usedMemory = 0;
         this.setBG();
      }
      
      public function setMemory(param1:uint, param2:String, param3:uint, param4:Boolean) : *
      {
         var _loc7_:MovieClip = null;
         var _loc8_:uint = 0;
         var _loc9_:int = 0;
         var _loc10_:uint = 0;
         var _loc5_:MovieClip = this.memoryHolder.getElementByString("id",param2);
         var _loc6_:uint = 0;
         if(_loc5_)
         {
            _loc6_ = 0;
            while(_loc6_ < this.memoryHolder.length)
            {
               _loc7_ = this.memoryHolder.getAt(_loc6_);
               if(_loc7_.id == param2)
               {
                  _loc7_.slotUpdated = true;
                  _loc7_.memoryCost = param1;
                  _loc7_.skillSchool = param3;
                  _loc7_.localCellIndex = 0;
               }
               _loc6_++;
            }
         }
         else
         {
            _loc8_ = this.memoryHolder.length;
            _loc9_ = _loc8_ - this.usedMemory;
            if(_loc9_ >= param1)
            {
               _loc7_ = this.memoryHolder.getAt(this.usedMemory++);
               if(_loc7_)
               {
                  _loc7_.id = param2;
                  _loc7_.slotUpdated = true;
                  _loc7_.isExtraSlot = false;
                  _loc7_.memoryCost = param1;
                  _loc7_.skillSchool = param3;
                  _loc7_.localCellIndex = 0;
               }
               _loc10_ = param1 - 1;
               if(_loc10_ > 0)
               {
                  _loc6_ = 0;
                  while(_loc6_ < _loc10_)
                  {
                     _loc7_ = this.memoryHolder.getAt(this.usedMemory++);
                     if(_loc7_)
                     {
                        _loc7_.id = param2;
                        _loc7_.isExtraSlot = true;
                        _loc7_.cantUnlearn = param4;
                        _loc7_.slotUpdated = true;
                        _loc7_.memoryCost = param1;
                        _loc7_.skillSchool = param3;
                        _loc7_.localCellIndex = _loc6_ + 1;
                     }
                     _loc6_++;
                  }
               }
            }
         }
         this.setBG();
      }
      
      public function cleanUpUnusedMemory() : *
      {
         var _loc5_:MovieClip = null;
         var _loc6_:MovieClip = null;
         var _loc7_:Array = null;
         var _loc8_:Number = NaN;
         var _loc9_:Object = null;
         var _loc1_:MovieClip = (root as MovieClip).skillPane_mc;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:uint = 0;
         while(_loc4_ < this.memoryHolder.length)
         {
            _loc5_ = this.memoryHolder.getAt(_loc4_);
            if(_loc5_.slotUpdated)
            {
               _loc5_.slotUpdated = false;
               if(_loc2_)
               {
                  _loc3_ = true;
               }
            }
            else if(_loc5_.id != null)
            {
               _loc6_ = _loc1_.getSkillByTooltipID(_loc5_.id);
               if(_loc6_ && _loc6_.isActive)
               {
                  _loc6_.isActive = false;
               }
               _loc5_.id = null;
               _loc5_.kinSlots = null;
               _loc5_.isExtraSlot = false;
               this.usedMemory--;
               _loc2_ = true;
            }
            _loc4_++;
         }
         if(_loc3_)
         {
            _loc7_ = new Array();
            _loc4_ = 0;
            while(_loc4_ < this.memoryHolder.length)
            {
               _loc5_ = this.memoryHolder.getAt(_loc4_);
               if(_loc5_.id != null)
               {
                  _loc9_ = new Object();
                  _loc9_.id = _loc5_.id;
                  _loc9_.isExtraSlot = _loc5_.isExtraSlot;
                  _loc9_.cantUnlearn = _loc5_.cantUnlearn;
                  _loc9_.memoryCost = _loc5_.memoryCost;
                  _loc9_.skillSchool = _loc5_.skillSchool;
                  _loc5_.id = null;
                  _loc5_.kinSlots = null;
                  _loc5_.isExtraSlot = false;
                  _loc5_.localCellIndex = 0;
                  _loc7_.push(_loc9_);
               }
               _loc4_++;
            }
            _loc8_ = 0;
            _loc4_ = 0;
            while(_loc4_ < _loc7_.length)
            {
               _loc9_ = _loc7_[_loc4_];
               _loc5_ = this.memoryHolder.getAt(_loc4_);
               _loc5_.id = _loc9_.id;
               _loc5_.isExtraSlot = _loc9_.isExtraSlot;
               _loc5_.cantUnlearn = _loc9_.cantUnlearn;
               _loc5_.memoryCost = _loc9_.memoryCost;
               _loc5_.skillSchool = _loc9_.skillSchool;
               _loc5_.localCellIndex = 0;
               _loc4_++;
            }
         }
      }
      
      public function addMemory(param1:String, param2:uint, param3:Boolean) : *
      {
         var _loc5_:uint = 0;
         var _loc6_:MovieClip = null;
         var _loc4_:MovieClip = this.memoryHolder.getElementByString("id",param1);
         if(!_loc4_)
         {
            _loc5_ = this.memoryHolder.length;
            if(_loc5_ < this.maxMemory || this.maxMemory == -1)
            {
               _loc6_ = new memorySegment();
               _loc6_.id = param1;
               _loc6_.cantUnlearn = param3;
               _loc6_.slotUpdated = true;
               _loc6_.bg_mc.alpha = 0;
               _loc6_.skillSchool = param2;
               _loc6_.localCellIndex = 0;
               this.memoryHolder.addElement(_loc6_,false,false);
               this.setBG();
            }
            else
            {
               ExternalInterface.call("UIAssert",this.debugName + "::memoryList::addMemory -> Can\'t add any more memory slots, this isn\'t a dynamic memoryList! listSize:" + _loc5_ + " maxMemory:" + this.maxMemory);
            }
         }
      }
      
      public function findSlotsBySkillId(param1:String) : Array
      {
         var _loc4_:uint = 0;
         var _loc5_:MovieClip = null;
         var _loc2_:Array = new Array();
         var _loc3_:uint = this.memoryHolder.length;
         if(_loc3_ > 0)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = this.memoryHolder.getAt(_loc4_);
               if(_loc5_ && _loc5_.id == param1)
               {
                  _loc2_.push(_loc5_);
               }
               _loc4_++;
            }
         }
         return _loc2_;
      }
      
      public function setBG() : *
      {
         this.bg_mc.width = this.memoryHolder.x + this.memoryHolder.width;
         this.bg_mc.height = this.memoryHolder.y + this.memoryHolder.height;
      }
      
      function frame1() : *
      {
      }
   }
}
