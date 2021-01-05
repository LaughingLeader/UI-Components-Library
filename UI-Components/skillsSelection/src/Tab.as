package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   
   public dynamic class Tab extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public var disIcon_mc:MovieClip;
      
      public var icon_mc:MovieClip;
      
      public var lock_mc:MovieClip;
      
      public var base:MovieClip;
      
      public var selected:Boolean;
      
      public var iconY:Number;
      
      public function Tab()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onMouseOver(param1:MouseEvent) : *
      {
         this.showTooltipForMC(this,"showTooltip");
         ExternalInterface.call("PlaySound","UI_Game_Skills_Over");
         if(this.icon_mc.visible)
         {
            this.bg_mc.gotoAndStop(!!this.selected?5:2);
         }
      }
      
      public function showTooltipForMC(param1:MovieClip, param2:String) : *
      {
         var _loc3_:Point = null;
         if(param1.tooltip != null && param1.tooltip != "")
         {
            _loc3_ = this.getGlobalPositionOfMC(param1);
            this.base.hasTooltip = true;
            ExternalInterface.call(param2,param1.tooltip,_loc3_.x,_loc3_.y - 16,param1.width,param1.height,param1.tooltipAlign);
         }
      }
      
      public function getGlobalPositionOfMC(param1:MovieClip) : Point
      {
         var _loc2_:Point = param1.localToGlobal(new Point(0,0));
         _loc2_.x = _loc2_.x - root.x;
         _loc2_.y = _loc2_.y - root.y;
         return _loc2_;
      }
      
      public function onMouseOut(param1:MouseEvent) : *
      {
         if(this.tooltip && this.tooltip != "" && this.base.hasTooltip)
         {
            this.base.hasTooltip = false;
            ExternalInterface.call("hideTooltip");
         }
         if(this.icon_mc.visible)
         {
            this.icon_mc.y = this.iconY;
            this.bg_mc.gotoAndStop(!!this.selected?4:1);
            removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         }
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         if(this.icon_mc.visible)
         {
            this.bg_mc.gotoAndStop(!!this.selected?6:3);
            addEventListener(MouseEvent.MOUSE_UP,this.onUp);
            this.icon_mc.y = this.iconY + 2;
         }
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         if(this.icon_mc.visible)
         {
            removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
            this.bg_mc.gotoAndStop(!!this.selected?5:2);
            this.icon_mc.y = this.iconY;
            this.base.skills_mc.filterList(this.filterType);
            ExternalInterface.call("PlaySound","UI_Game_Skills_Click");
         }
      }
      
      public function deselectElement(param1:*) : *
      {
         this.x = 0;
         this.selected = false;
         this.bg_mc.gotoAndStop(!!this.selected?4:1);
      }
      
      public function selectElement(param1:*) : *
      {
         this.selected = true;
         this.bg_mc.gotoAndStop(!!this.selected?4:1);
      }
      
      function frame1() : *
      {
         this.base = root as MovieClip;
         addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         addEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
         addEventListener(MouseEvent.ROLL_OVER,this.onMouseOver);
         this.iconY = 0;
      }
   }
}
