package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   
   public dynamic class memorySegment extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public var hit_mc:MovieClip;
      
      public var hl_mc:MovieClip;
      
      public var newSkillEffect_mc:MovieClip;
      
      public const startDragDiff = 10;
      
      public var root_mc:MovieClip;
      
      public var kinSlots:Array;
      
      public var mousePosX:Number;
      
      public var mousePosY:Number;
      
      public var _isExtraSlot:Boolean;
      
      public var memoryCost:uint;
      
      public var skillSchool:uint;
      
      public var localCellIndex:Number;
      
      public function memorySegment()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function set isExtraSlot(param1:Boolean) : void
      {
         this._isExtraSlot = param1;
         this.bg_mc.visible = this.id == null;
      }
      
      public function get isExtraSlot() : Boolean
      {
         return this._isExtraSlot;
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         this.root_mc.hasTooltip = true;
         this.root_mc.showMemoryHighlight();
         var _loc2_:Point = this.root_mc.skillPane_mc.getGlobalPositionOfMC(this,false);
         var _loc3_:uint = Math.max(0,this.memoryCost - this.localCellIndex - 1);
         this.root_mc.showTooltip(this.root_mc.skillPane_mc.characterHandle,this.id,-16 + _loc2_.x + _loc3_ * 64,_loc2_.y - 18 - 13,90,0);
         ExternalInterface.call("PlaySound","UI_Game_Skills_Over");
         if(this.id != null)
         {
            ExternalInterface.call("createHoverIcon",this.id);
         }
         if(this.root_mc.isDragging)
         {
            addEventListener(MouseEvent.MOUSE_UP,this.onUp);
         }
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         this.root_mc.hideMemoryHighlight();
         if(this.root_mc.hasTooltip)
         {
            this.root_mc.hideTooltip();
            this.root_mc.hasTooltip = false;
         }
         if(this.hl_mc.visible)
         {
            this.hl_mc.visible = false;
         }
         if(this.kinSlots != null)
         {
            _loc2_ = this.kinSlots.length;
            if(_loc2_ > 0)
            {
               _loc3_ = 0;
               while(_loc3_ < _loc2_)
               {
                  this.kinSlots[_loc3_].hl_mc.visible = false;
                  _loc3_++;
               }
            }
            this.kinSlots = null;
         }
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         removeEventListener(Event.ENTER_FRAME,this.dragging);
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         if(this.id != null)
         {
            if(!this.root_mc.isDragging)
            {
               addEventListener(Event.ENTER_FRAME,this.dragging);
               addEventListener(MouseEvent.MOUSE_UP,this.onUp);
               this.mousePosX = stage.mouseX;
               this.mousePosY = stage.mouseY;
            }
         }
      }
      
      public function dragging() : *
      {
         if(this.mousePosX + this.startDragDiff < stage.mouseX || this.mousePosX - this.startDragDiff > stage.mouseX || this.mousePosY + this.startDragDiff < stage.mouseY || this.mousePosY - this.startDragDiff > stage.mouseY)
         {
            if(!this.cantUnlearn)
            {
               this.root_mc.isDragging = true;
               this.hl_mc.visible = true;
               addEventListener(MouseEvent.MOUSE_UP,this.onUp);
               ExternalInterface.call("startDragging",this.id,true);
            }
            else
            {
               ExternalInterface.call("startDragging",this.id,true);
            }
            this.root_mc.draggingSkillMemory = this.memoryCost;
            this.root_mc.draggingSkillSchool = this.skillSchool - 1;
            this.root_mc.showSkillPreview();
            removeEventListener(Event.ENTER_FRAME,this.dragging);
         }
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         if(this.root_mc.isDragging)
         {
            if(this.id != null)
            {
               ExternalInterface.call("dragActivate");
            }
            else
            {
               ExternalInterface.call("dragActivate");
            }
         }
         else if(this.id != null)
         {
            if(this.cantUnlearn)
            {
               ExternalInterface.call("cantUnlearn",this.id);
            }
            else
            {
               ExternalInterface.call(this.root_mc.buttonCallBack[1],this.id,false);
            }
            ExternalInterface.call("stopDragging");
            ExternalInterface.call("hideTooltip");
            this.hl_mc.visible = false;
            removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         }
         this.root_mc.clearDragging();
         removeEventListener(Event.ENTER_FRAME,this.dragging);
      }
      
      function frame1() : *
      {
         this.hl_mc.gotoAndStop(1);
         this.hl_mc.visible = false;
         stop();
         this.root_mc = root as MovieClip;
         this.kinSlots = null;
         this.mousePosX = 0;
         this.mousePosY = 0;
         this.hl_mc.alpha = 0.35;
         this.hit_mc.addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         this.hit_mc.addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         this.hit_mc.addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
      }
   }
}
