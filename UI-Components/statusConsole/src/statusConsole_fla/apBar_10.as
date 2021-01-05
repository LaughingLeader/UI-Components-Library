package statusConsole_fla
{
   import LS_Classes.horizontalList;
   import flash.display.MovieClip;
   import flash.geom.Rectangle;
   import flash.text.TextFieldAutoSize;
   
   public dynamic class apBar_10 extends MovieClip
   {
       
      
      public var apGlow_mc:MovieClip;
      
      public var apHolder_mc:MovieClip;
      
      public var apOverflow_mc:MovieClip;
      
      public var apStudHolder_mc:MovieClip;
      
      public var maxAPs:int;
      
      public var standardAP:uint;
      
      public var totalSlots:int;
      
      public var extraApSlots:Number;
      
      public var extraAps:Number;
      
      public var activeAps:int;
      
      public var apLeft:int;
      
      public var slotWidth:Number;
      
      public var apList:horizontalList;
      
      public var originalPosX:int;
      
      public var originalStudX:int;
      
      public function apBar_10()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function initAp() : *
      {
      }
      
      public function setMaxAp(param1:Number) : *
      {
         this.totalSlots = param1;
         var _loc2_:uint = 0;
         if(param1 <= 0)
         {
            this.apGlow_mc.visible = false;
         }
         else
         {
            this.apGlow_mc.visible = true;
         }
         if(param1 > this.maxAPs)
         {
            this.extraApSlots = param1 - this.maxAPs;
            param1 = this.maxAPs;
         }
         else
         {
            this.extraApSlots = 0;
         }
         if(param1 != this.apList.length)
         {
            this.apList.clearElements();
            _loc2_ = 0;
            while(_loc2_ < param1 && _loc2_ < 20)
            {
               this.addApC();
               _loc2_++;
            }
            this.apList.positionElements();
            this.calculateBarOffset();
         }
         else
         {
            _loc2_ = 0;
            while(_loc2_ < this.apList.length)
            {
               this.setMCSTate(this.apList.content_array[_loc2_],1);
               _loc2_++;
            }
         }
         if(param1 != 0)
         {
            this.apStudHolder_mc.visible = true;
            param1 = param1 + 1;
            this.apStudHolder_mc.scrollRect = new Rectangle(0,0,param1 * 22,12);
         }
         else
         {
            this.apStudHolder_mc.visible = false;
         }
         this.ExtraSlotsDisplaying();
      }
      
      public function calculateBarOffset() : *
      {
         var _loc1_:Number = NaN;
         if(this.apList.size > this.standardAP)
         {
            _loc1_ = this.apList.size - this.standardAP;
            this.apHolder_mc.x = this.originalPosX - Math.floor(_loc1_ * 0.5 * (this.slotWidth + this.apList.EL_SPACING));
            this.apStudHolder_mc.x = this.originalStudX + (this.apHolder_mc.x - this.originalPosX);
         }
         else
         {
            this.apHolder_mc.x = this.originalPosX;
            this.apStudHolder_mc.x = this.originalStudX;
         }
      }
      
      public function setBonusAP(param1:Number) : *
      {
         var _loc3_:MovieClip = null;
         var _loc2_:uint = 0;
         while(_loc2_ < param1)
         {
            if(_loc2_ < this.apList.length)
            {
               _loc3_ = this.apList.getElement(_loc2_);
               if(_loc3_)
               {
                  _loc3_.bonus = true;
               }
            }
            _loc2_++;
         }
      }
      
      public function setGreyAP(param1:Number) : *
      {
         var _loc2_:uint = 0;
         while(_loc2_ < this.apList.length)
         {
            if(_loc2_ < param1)
            {
               this.setMCSTate(this.apList.content_array[_loc2_],6);
            }
            else
            {
               this.setMCSTate(this.apList.content_array[_loc2_],0);
               (this.apList.content_array[_loc2_] as MovieClip).bonus = false;
            }
            _loc2_++;
         }
      }
      
      public function addApC(param1:Boolean = false) : *
      {
         var _loc2_:MovieClip = new apUnit();
         var _loc3_:Number = 1;
         _loc2_.gotoAndStop(_loc3_);
         _loc2_.state = _loc3_;
         _loc2_.bonus = param1;
         this.apList.addElement(_loc2_,false);
      }
      
      public function setMCSTate(param1:MovieClip, param2:Number) : *
      {
         if(param1)
         {
            param1.state = param2;
            param1.gotoAndStop(param2);
         }
      }
      
      public function setActiveAp(param1:Number) : *
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc2_:uint = 0;
         var _loc3_:Number = param1;
         if(_loc3_ > this.maxAPs)
         {
            _loc3_ = this.maxAPs;
         }
         if(this.apLeft >= param1)
         {
            this.activeAps = this.apLeft - this.maxAPs;
            if(this.activeAps < 0)
            {
               this.activeAps = 0;
            }
            _loc2_ = 0;
            while(_loc2_ < this.apList.length)
            {
               if(_loc2_ < this.apLeft - param1 - this.activeAps)
               {
                  _loc4_ = 2;
                  if(this.apList.content_array[_loc2_].bonus)
                  {
                     _loc4_ = 5;
                  }
                  this.setMCSTate(this.apList.content_array[_loc2_],_loc4_);
               }
               else if(_loc2_ < this.apLeft - this.activeAps)
               {
                  this.setMCSTate(this.apList.content_array[_loc2_],3);
               }
               _loc2_++;
            }
         }
         else
         {
            this.activeAps = 0;
            _loc5_ = this.apLeft;
            if(_loc5_ > this.apList.content_array.length - 1)
            {
               _loc5_ = this.apList.content_array.length - 1;
            }
            _loc2_ = 0;
            while(_loc2_ < this.apLeft)
            {
               this.setMCSTate(this.apList.content_array[_loc2_],4);
               _loc2_++;
            }
         }
         this.ExtraSlotsDisplaying();
      }
      
      public function setAvailableAp(param1:Number) : *
      {
         var _loc3_:Number = NaN;
         var _loc2_:uint = 0;
         _loc2_ = 0;
         while(_loc2_ < this.apList.length)
         {
            if(_loc2_ < param1)
            {
               _loc3_ = 2;
               if(this.apList.content_array[_loc2_].bonus)
               {
                  _loc3_ = 5;
               }
               this.setMCSTate(this.apList.content_array[_loc2_],_loc3_);
            }
            else
            {
               this.setMCSTate(this.apList.content_array[_loc2_],1);
            }
            _loc2_++;
         }
         this.apLeft = param1;
      }
      
      public function ExtraSlotsDisplaying() : *
      {
         if(this.activeAps > 0)
         {
            this.apOverflow_mc.overflow_txt.htmlText = "+" + this.activeAps;
            this.apOverflow_mc.visible = true;
         }
         else
         {
            this.apOverflow_mc.overflow_txt.htmlText = " ";
            this.apOverflow_mc.visible = false;
         }
      }
      
      function frame1() : *
      {
         this.maxAPs = 20;
         this.apOverflow_mc.overflow_txt.autoSize = TextFieldAutoSize.LEFT;
         this.standardAP = 6;
         this.totalSlots = 0;
         this.extraApSlots = 0;
         this.extraAps = 0;
         this.activeAps = 0;
         this.apLeft = 0;
         this.slotWidth = 28;
         this.apList = new horizontalList();
         this.apList.EL_SPACING = -2;
         this.apHolder_mc.addChild(this.apList);
         this.apHolder_mc.x = 17;
         this.apStudHolder_mc.x = 7;
         this.apStudHolder_mc.y = 17;
         this.originalPosX = this.apHolder_mc.x;
         this.originalStudX = this.apStudHolder_mc.x;
      }
   }
}
