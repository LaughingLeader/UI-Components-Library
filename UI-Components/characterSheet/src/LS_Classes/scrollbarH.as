package LS_Classes
{
   import flash.display.MovieClip;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   import flash.utils.getDefinitionByName;
   
   public class scrollbarH extends MovieClip
   {
       
      
      private var m_disabled:Boolean = false;
      
      private var m_content_mc:MovieClip;
      
      private var m_SCROLLSPEED:Number = 10;
      
      private var m_last_X:Number = 0;
      
      private var m_scrollerDiff:Number = 0;
      
      public var m_right_mc:MovieClip;
      
      public var m_left_mc:MovieClip;
      
      public var m_handle_mc:MovieClip;
      
      public var m_bg_mc:MovieClip;
      
      public var m_scrolledX = 0;
      
      private var m_scaleBG:Boolean = false;
      
      private var m_scrollWidth:Number = 0;
      
      private var m_customPaneWidth:Number = -1;
      
      private var m_handleResizable:Boolean = false;
      
      private var m_scrollTimer:Timer;
      
      private var m_currentScrollDelay:Number = 200;
      
      private var m_currentScrollDown:Boolean = false;
      
      public var m_initialScrollDelay:Number = 300;
      
      public var m_minScrollDelay:Number = 50;
      
      public var m_scrollMultiplier:Number = 0.55;
      
      public function scrollbarH(param1:String = "left_id", param2:String = "right_id", param3:String = "handleH_id", param4:String = "scrollBg_id")
      {
         super();
         var _loc5_:Class = getDefinitionByName(param1) as Class;
         var _loc6_:Class = getDefinitionByName(param2) as Class;
         var _loc7_:Class = getDefinitionByName(param3) as Class;
         var _loc8_:Class = getDefinitionByName(param4) as Class;
         this.m_left_mc = new _loc5_();
         this.m_right_mc = new _loc6_();
         this.m_handle_mc = new _loc7_();
         this.m_bg_mc = new _loc8_();
         addChild(this.m_bg_mc);
         addChild(this.m_handle_mc);
         addChild(this.m_left_mc);
         addChild(this.m_right_mc);
         var _loc9_:Number = this.m_bg_mc.height;
         if(_loc9_ < this.m_left_mc.height)
         {
            _loc9_ = this.m_left_mc.height;
         }
         if(_loc9_ < this.m_right_mc.height)
         {
            _loc9_ = this.m_right_mc.height;
         }
         if(_loc9_ < this.m_handle_mc.height)
         {
            _loc9_ = this.m_handle_mc.height;
         }
         this.m_bg_mc.y = Math.round((_loc9_ - this.m_bg_mc.height) * 0.5);
         this.m_left_mc.y = Math.round((_loc9_ - this.m_left_mc.height) * 0.5);
         this.m_right_mc.y = Math.round((_loc9_ - this.m_right_mc.height) * 0.5);
         this.m_handle_mc.y = Math.round((_loc9_ - this.m_handle_mc.height) * 0.5);
         this.m_right_mc.addEventListener("mouseDown",this.downPressed);
         this.m_right_mc.addEventListener("mouseOut",this.downOff);
         this.m_right_mc.addEventListener("mouseOver",this.downOn);
         this.m_right_mc.addEventListener("mouseUp",this.onUp);
         this.m_left_mc.addEventListener("mouseDown",this.upPressed);
         this.m_left_mc.addEventListener("mouseOver",this.upOn);
         this.m_left_mc.addEventListener("mouseOut",this.upOff);
         this.m_left_mc.addEventListener("mouseUp",this.onUp);
         this.m_handle_mc.addEventListener("mouseOut",this.handleOff);
         this.m_handle_mc.addEventListener("mouseDown",this.handlePressed);
         this.m_handle_mc.addEventListener("mouseOver",this.handleOn);
         this.m_handle_mc.addEventListener("mouseUp",this.onUp);
         this.m_bg_mc.addEventListener("mouseDown",this.bgDown);
         this.m_scrollerDiff = this.m_right_mc.x - this.m_left_mc.width - this.m_handle_mc.width;
      }
      
      public function setHandle(param1:Class) : *
      {
         removeChild(this.m_handle_mc);
         this.m_handle_mc = new param1();
         addChild(this.m_handle_mc);
         this.m_handle_mc.addEventListener("mouseOut",this.handleOff);
         this.m_handle_mc.addEventListener("mouseDown",this.handlePressed);
         this.m_handle_mc.addEventListener("mouseOver",this.handleOn);
         this.m_handle_mc.addEventListener("mouseUp",this.onUp);
         this.m_scrollerDiff = this.m_right_mc.x - this.m_left_mc.width - this.m_handle_mc.width;
      }
      
      public function set ScaleBG(param1:Boolean) : *
      {
         this.m_scaleBG = param1;
         if(param1)
         {
            if(this.m_left_mc.height <= 0 && this.m_content_mc != null)
            {
               this.m_bg_mc.width = this.m_scrollWidth;
            }
            else
            {
               this.m_bg_mc.width = this.m_right_mc.x - this.m_left_mc.x - this.m_right_mc.width;
            }
         }
         else
         {
            this.m_bg_mc.scaleY = 1;
         }
      }
      
      public function addMouseEvent(param1:MovieClip) : *
      {
         param1.addEventListener(MouseEvent.MOUSE_WHEEL,this.handleMouseWheel);
      }
      
      public function addMouseEventStage(param1:Stage) : *
      {
         param1.addEventListener(MouseEvent.MOUSE_WHEEL,this.handleMouseWheel);
      }
      
      public function removeMouseEventStage(param1:Stage) : *
      {
         param1.removeEventListener(MouseEvent.MOUSE_WHEEL,this.handleMouseWheel);
      }
      
      public function addContent(param1:MovieClip) : void
      {
         this.m_content_mc = param1;
         this.setWidth(this.m_content_mc.scrollRect.width);
      }
      
      public function position() : void
      {
         this.x = this.m_content_mc.x + this.m_content_mc.scrollRect.width;
         this.y = this.m_content_mc.y;
      }
      
      public function set customPaneWidth(param1:Number) : *
      {
         this.m_customPaneWidth = param1;
      }
      
      public function disableCustomPaneWidth() : *
      {
         this.m_customPaneWidth = -1;
      }
      
      public function get handleResize() : Boolean
      {
         return this.m_handleResizable;
      }
      
      public function set handleResize(param1:Boolean) : *
      {
         this.m_handleResizable = param1;
         if(param1)
         {
            this.setWidth(this.m_content_mc.scrollRect.height);
         }
      }
      
      public function resetHandle() : void
      {
         this.m_handle_mc.x = this.m_left_mc.width;
         var _loc1_:Rectangle = this.m_content_mc.scrollRect;
         _loc1_.x = 0;
         this.m_scrolledX = _loc1_.x;
         this.m_content_mc.scrollRect = _loc1_;
      }
      
      public function resetHandleToBottom() : void
      {
         var _loc1_:Rectangle = this.m_content_mc.scrollRect;
         var _loc2_:Number = this.m_content_mc.transform.pixelBounds.width;
         if(this.m_customPaneWidth != -1)
         {
            _loc2_ = this.m_customPaneWidth;
         }
         this.m_handle_mc.x = _loc1_.width - (this.m_right_mc.width + this.m_handle_mc.width);
         _loc1_.x = _loc2_ - _loc1_.width;
         this.m_scrolledX = _loc1_.x;
         this.m_content_mc.scrollRect = _loc1_;
      }
      
      public function scrollbarVisible() : *
      {
         var _loc1_:Number = this.m_content_mc.transform.pixelBounds.width;
         if(this.m_customPaneWidth != -1)
         {
            _loc1_ = this.m_customPaneWidth;
         }
         var _loc2_:Rectangle = this.m_content_mc.scrollRect;
         if(_loc1_ > _loc2_.width)
         {
            this.visible = true;
            this.m_disabled = false;
         }
         else
         {
            this.visible = false;
            this.m_disabled = true;
            _loc2_.x = 0;
            this.m_scrolledX = 0;
            this.m_content_mc.scrollRect = _loc2_;
         }
      }
      
      public function set disabled(param1:Boolean) : void
      {
         this.m_disabled = param1;
      }
      
      public function get disabled() : Boolean
      {
         return this.m_disabled;
      }
      
      public function scrollTo(param1:Number) : void
      {
         var _loc2_:Number = this.m_content_mc.transform.pixelBounds.width / this.m_content_mc.transform.concatenatedMatrix.a;
         if(this.m_customPaneWidth != -1)
         {
            _loc2_ = this.m_customPaneWidth;
         }
         var _loc3_:Rectangle = this.m_content_mc.scrollRect;
         _loc3_.x = param1;
         var _loc4_:Number = _loc2_ - _loc3_.width;
         if(_loc4_ < 0)
         {
            _loc4_ = 0;
         }
         if(_loc3_.x <= 0)
         {
            _loc3_.x = 0;
         }
         else if(_loc3_.x > _loc4_)
         {
            _loc3_.x = _loc4_;
         }
         this.m_handle_mc.x = _loc3_.x * (this.m_scrollerDiff / _loc4_) + this.m_left_mc.width;
         this.m_scrolledX = _loc3_.x;
         this.m_content_mc.scrollRect = _loc3_;
      }
      
      private function setWidth(param1:Number) : void
      {
         this.m_right_mc.x = param1 - this.m_right_mc.width;
         if(this.m_scaleBG)
         {
            this.m_bg_mc.width = param1 - this.m_left_mc.width - this.m_right_mc.width;
         }
         this.m_bg_mc.x = this.m_left_mc.width;
         this.m_handle_mc.x = this.m_left_mc.width;
         if(param1 < 90)
         {
            this.m_handle_mc.visible = false;
         }
         else
         {
            this.m_handle_mc.visible = true;
         }
         this.m_scrollerDiff = this.m_right_mc.x - this.m_left_mc.width - this.m_handle_mc.width;
         this.m_scrollWidth = param1;
      }
      
      private function adjustScrollHandle(param1:Number) : Boolean
      {
         var _loc2_:Number = this.m_content_mc.transform.pixelBounds.width;
         if(this.m_customPaneWidth != -1)
         {
            _loc2_ = this.m_customPaneWidth;
         }
         var _loc3_:Rectangle = this.m_content_mc.scrollRect;
         _loc3_.x = _loc3_.x + param1;
         var _loc4_:Number = this.getContDiff();
         if(_loc4_ < 0)
         {
            _loc4_ = 0;
         }
         if(_loc3_.x <= 0)
         {
            _loc3_.x = 0;
         }
         else if(_loc3_.x > _loc4_)
         {
            _loc3_.x = _loc4_;
            if(this.m_scrolledX == _loc3_.x)
            {
               return false;
            }
         }
         this.m_handle_mc.x = _loc3_.x * (this.m_scrollerDiff / _loc4_) + this.m_left_mc.width;
         this.m_scrolledX = _loc3_.x;
         this.m_content_mc.scrollRect = _loc3_;
         return true;
      }
      
      private function handleMouseWheel(param1:MouseEvent) : void
      {
         if(!this.m_disabled)
         {
            this.adjustScrollHandle(param1.delta * -3);
         }
      }
      
      private function handlePressed(param1:Event) : *
      {
         if(!this.m_disabled)
         {
            this.m_handle_mc.gotoAndStop(3);
            this.m_last_X = mouseX - this.m_handle_mc.x;
            stage.addEventListener("mouseUp",this.handleReleased);
            stage.addEventListener("mouseMove",this.handleMove);
         }
      }
      
      private function handleReleased(param1:Event) : *
      {
         if(!this.m_disabled)
         {
            this.m_handle_mc.gotoAndStop(2);
            stage.removeEventListener("mouseUp",this.handleReleased);
            stage.removeEventListener("mouseMove",this.handleMove);
         }
      }
      
      private function handleMove(param1:Event) : *
      {
         var _loc2_:Number = NaN;
         var _loc3_:Rectangle = null;
         var _loc4_:Number = NaN;
         if(!this.m_disabled)
         {
            _loc2_ = this.m_content_mc.transform.pixelBounds.width / this.m_content_mc.transform.concatenatedMatrix.a;
            if(this.m_customPaneWidth != -1)
            {
               _loc2_ = this.m_customPaneWidth;
            }
            _loc3_ = this.m_content_mc.scrollRect;
            _loc4_ = _loc2_ - _loc3_.width;
            if(this.mouseX - this.m_last_X < this.m_left_mc.width)
            {
               this.m_handle_mc.x = this.m_left_mc.width;
               _loc3_.x = 0;
            }
            else if(this.mouseX - this.m_last_X >= this.m_scrollerDiff + this.m_left_mc.width)
            {
               this.m_handle_mc.x = this.m_scrollerDiff + this.m_left_mc.width;
               _loc3_.x = _loc4_;
            }
            else
            {
               this.m_handle_mc.x = this.mouseX - this.m_last_X;
               _loc3_.x = (this.m_handle_mc.x - this.m_left_mc.width) * (_loc4_ / this.m_scrollerDiff);
            }
            this.m_scrolledX = _loc3_.x;
            this.m_content_mc.scrollRect = _loc3_;
         }
      }
      
      public function startAutoScroll(param1:Boolean) : *
      {
         if(this.m_scrollTimer)
         {
            this.m_scrollTimer.reset();
            this.m_scrollTimer.stop();
         }
         if(this.adjustScrollHandle(!!param1?Number(this.m_SCROLLSPEED):Number(-this.m_SCROLLSPEED)))
         {
            this.m_currentScrollDown = param1;
            this.m_currentScrollDelay = this.m_initialScrollDelay;
            this.m_scrollTimer = new Timer(this.m_currentScrollDelay);
            this.m_scrollTimer.addEventListener(TimerEvent.TIMER,this.onScrollTimer);
            this.m_scrollTimer.start();
         }
      }
      
      public function stopAutoScroll() : *
      {
         this.m_currentScrollDelay = this.m_initialScrollDelay;
         if(this.m_scrollTimer)
         {
            this.m_scrollTimer.stop();
            this.m_scrollTimer = null;
         }
      }
      
      private function onScrollTimer(param1:TimerEvent) : *
      {
         if(this.m_currentScrollDelay > this.m_minScrollDelay)
         {
            this.m_currentScrollDelay = this.m_currentScrollDelay * this.m_scrollMultiplier;
            if(this.m_currentScrollDelay < this.m_minScrollDelay)
            {
               this.m_currentScrollDelay = this.m_minScrollDelay;
            }
         }
         if(!this.adjustScrollHandle(!!this.m_currentScrollDown?Number(this.m_SCROLLSPEED):Number(-this.m_SCROLLSPEED)))
         {
            this.stopAutoScroll();
         }
         else
         {
            this.m_scrollTimer.delay = this.m_currentScrollDelay;
         }
      }
      
      private function getContDiff() : Number
      {
         var _loc1_:Number = this.m_content_mc.transform.pixelBounds.width / this.m_content_mc.transform.concatenatedMatrix.a;
         var _loc2_:Number = 0;
         var _loc3_:Rectangle = this.m_content_mc.scrollRect;
         _loc2_ = _loc3_.width;
         return Math.round(_loc1_ - _loc2_);
      }
      
      private function scrollToPrecent(param1:Number) : void
      {
         if(param1 > 1)
         {
            param1 = 1;
         }
         this.scrollTo(this.getContDiff() * param1);
      }
      
      private function bgDown(param1:Event) : *
      {
         if(!this.m_disabled)
         {
            this.scrollToPrecent((this.mouseX - (this.m_left_mc.x + this.m_left_mc.width)) / this.m_scrollerDiff);
         }
      }
      
      private function handleOff(param1:Event) : *
      {
         this.m_handle_mc.gotoAndStop(1);
      }
      
      function handleOn(param1:Event) : *
      {
         if(!this.m_disabled)
         {
            this.m_handle_mc.gotoAndStop(2);
         }
      }
      
      function upOff(param1:Event) : *
      {
         if(!this.m_disabled)
         {
            this.m_left_mc.gotoAndStop(1);
            this.stopAutoScroll();
         }
      }
      
      function upOn(param1:Event) : *
      {
         if(!this.m_disabled)
         {
            this.m_left_mc.gotoAndStop(2);
         }
      }
      
      private function upPressed(param1:Event) : *
      {
         if(!this.m_disabled)
         {
            this.m_left_mc.gotoAndStop(3);
            this.adjustScrollHandle(-this.m_SCROLLSPEED);
            this.startAutoScroll(false);
         }
      }
      
      private function downPressed(param1:Event) : *
      {
         if(!this.m_disabled)
         {
            this.adjustScrollHandle(this.m_SCROLLSPEED);
            this.m_right_mc.gotoAndStop(3);
            this.startAutoScroll(true);
         }
      }
      
      function downOn(param1:Event) : *
      {
         if(!this.m_disabled)
         {
            this.m_right_mc.gotoAndStop(2);
         }
      }
      
      function downOff(param1:Event) : *
      {
         if(!this.m_disabled)
         {
            this.m_right_mc.gotoAndStop(1);
            this.stopAutoScroll();
         }
      }
      
      private function onUp(param1:Event) : *
      {
         if(!this.m_disabled)
         {
            param1.currentTarget.gotoAndStop(1);
            this.stopAutoScroll();
         }
      }
   }
}
