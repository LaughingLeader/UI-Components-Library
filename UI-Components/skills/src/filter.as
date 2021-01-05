package
{
   import LS_Classes.horizontalList;
   import LS_Classes.textEffect;
   import LS_Classes.tooltipHelper;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   
   public dynamic class filter extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public var hit_mc:MovieClip;
      
      public var iconInactive_mc:MovieClip;
      
      public var icon_mc:MovieClip;
      
      public var inactive_overlay:MovieClip;
      
      public var number_txt:TextField;
      
      public var isKnown:Boolean;
      
      public var prevKnownSkills:uint;
      
      public var knownSkillCounter:uint;
      
      public var root_mc:MovieClip;
      
      public function filter()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init(param1:MovieClip) : *
      {
         this.number_txt.filters = textEffect.createStrokeFilter(0,1.2,0.8,1,4);
         this.setNumberOfKnownSkills(this.prevKnownSkills);
         this.bg_mc.gotoAndStop(1);
         this.inactive_overlay.visible = false;
         this.root_mc = param1;
         this.tooltip = this.root_mc.tabTooltip[this.icon_mc.currentFrame - 1];
      }
      
      public function setNumberOfKnownSkills(param1:uint) : *
      {
         this.number_txt.visible = param1 == 0 || !this.isKnown?false:true;
         this.number_txt.htmlText = new String(param1);
      }
      
      public function setKnown(param1:Boolean) : *
      {
         this.isKnown = param1;
         this.icon_mc.visible = param1;
         visible = param1;
         this.iconInactive_mc.visible = !param1;
         this.inactive_overlay.visible = !param1;
         if(!this.isKnown)
         {
            this.knownSkillCounter = 0;
         }
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         if(this.isKnown)
         {
            this.bg_mc.gotoAndStop(2);
            this.hit_mc.addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
            this.hit_mc.addEventListener("rightMouseDown",this.rightDown);
         }
         this.tooltipYOffset = this.y;
         tooltipHelper.ShowTooltipForMC(this,this.root_mc,"top");
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         if(this.isKnown)
         {
            this.bg_mc.gotoAndStop(1);
            this.hit_mc.removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
            this.hit_mc.removeEventListener("rightMouseUp",this.rightUp);
         }
         ExternalInterface.call("hideTooltip");
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         if(this.isKnown)
         {
            this.bg_mc.gotoAndStop(3);
            this.hit_mc.addEventListener(MouseEvent.MOUSE_UP,this.onUp);
         }
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         var _loc2_:horizontalList = null;
         var _loc3_:Number = NaN;
         var _loc4_:Boolean = false;
         var _loc5_:uint = 0;
         var _loc6_:MovieClip = null;
         if(this.isKnown)
         {
            ExternalInterface.call("PlaySound","UI_Game_Skills_Click");
            _loc2_ = this.root_mc.filterButtons;
            _loc3_ = _loc2_.length;
            if(_loc3_ > 0)
            {
               _loc5_ = 0;
               while(_loc5_ < _loc3_)
               {
                  _loc6_ = _loc2_.getAt(_loc5_);
                  if(_loc6_ && _loc6_.isKnown)
                  {
                     _loc6_.icon_mc.visible = false;
                     _loc6_.iconInactive_mc.visible = true;
                  }
                  _loc5_++;
               }
            }
            this.bg_mc.gotoAndStop(2);
            _loc4_ = this.icon_mc.visible;
            this.icon_mc.visible = !_loc4_;
            this.iconInactive_mc.visible = _loc4_;
            ExternalInterface.call("exclusiveFilter",this.icon_mc.currentFrame - 1);
         }
         this.bg_mc.gotoAndStop(2);
         this.hit_mc.removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function getActiveFilterAmount() : Number
      {
         var _loc3_:MovieClip = null;
         var _loc1_:Number = 0;
         var _loc2_:uint = 0;
         while(_loc2_ < this.root_mc.filterButtons.length)
         {
            _loc3_ = this.root_mc.filterButtons.getAt(_loc2_);
            if(_loc3_ && _loc3_.icon_mc.visible)
            {
               _loc1_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function setFilterActive(param1:Boolean) : *
      {
         if(this.isKnown)
         {
            this.icon_mc.visible = param1;
            this.iconInactive_mc.visible = !param1;
         }
      }
      
      public function rightDown(param1:MouseEvent) : *
      {
         if(this.isKnown)
         {
            this.bg_mc.gotoAndStop(3);
            this.hit_mc.addEventListener("rightMouseUp",this.rightUp);
         }
      }
      
      public function rightUp(param1:MouseEvent) : *
      {
         var _loc2_:Boolean = false;
         if(this.isKnown && (!this.icon_mc.visible || this.getActiveFilterAmount() > 1))
         {
            ExternalInterface.call("PlaySound","UI_Game_Skills_Click");
            ExternalInterface.call("filterOnType",this.icon_mc.currentFrame - 1);
            _loc2_ = this.icon_mc.visible;
            this.icon_mc.visible = !_loc2_;
            this.iconInactive_mc.visible = _loc2_;
         }
         this.hit_mc.removeEventListener("rightMouseUp",this.rightUp);
      }
      
      function frame1() : *
      {
         this.prevKnownSkills = 0;
         this.knownSkillCounter = 0;
         this.hit_mc.addEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         this.hit_mc.addEventListener(MouseEvent.MOUSE_OUT,this.onOut);
         this.hit_mc.mouseEnabled = true;
      }
   }
}
