package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   
   public dynamic class skillSlot extends MovieClip
   {
       
      
      public var cooldown_mc:MovieClip;
      
      public var hit_mc:MovieClip;
      
      public var isMemorised_mc:MovieClip;
      
      public var skillSelectedHL_mc:MovieClip;
      
      public var skillSlot_hitbox:MovieClip;
      
      public const iggyPositionOffset:Point = new Point(-1,-1);
      
      public const tooltipWidth:int = 413;
      
      public var memoryCost:uint;
      
      public var skillSchool:uint;
      
      public var skillSchoolId:uint;
      
      public var isLearned:Boolean;
      
      public var m_isActive:Boolean;
      
      public var skillID:uint;
      
      public var tooltipID:String;
      
      public var root_mc:MovieClip;
      
      public var iggyIcon:MovieClip;
      
      public const startDragDiff = 10;
      
      public var mousePosX:Number;
      
      public var mousePosY:Number;
      
      public var localCellIndex:Number;
      
      public var dragAvailable:Boolean;
      
      public var cooldownRes_mc:MovieClip;
      
      public function skillSlot()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function set isActive(param1:Boolean) : *
      {
         if(this.memoryCost != 0)
         {
            this.m_isActive = param1;
            this.isMemorised_mc.visible = this.m_isActive;
         }
      }
      
      public function get isActive() : Boolean
      {
         return this.m_isActive;
      }
      
      public function initSkill(param1:uint) : *
      {
         if(param1 < 1)
         {
            param1 = 1;
         }
         else if(param1 > 10)
         {
            param1 = 10;
         }
         this.skillSchool = param1;
         this.skillSelectedHL_mc.visible = false;
         this.skillSelectedHL_mc.gotoAndStop(1);
         this.cooldownRes_mc = this.cooldown_mc;
         this.removeChild(this.cooldownRes_mc);
      }
      
      public function setCooldown(param1:Number, param2:Boolean = true) : *
      {
         var _loc3_:Boolean = false;
         if(param1 < 0.001)
         {
            this.removeChild(this.cooldownRes_mc);
         }
         else
         {
            this.addChild(this.cooldownRes_mc);
            this.addChild(this.isMemorised_mc);
         }
         this.cooldown_mc.setCooldown(param1);
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         ExternalInterface.call("PlaySound","UI_Game_Skills_Over");
         this.root_mc.skillPane_mc.currentlyHovering = this;
         var _loc2_:Point = this.root_mc.skillPane_mc.getGlobalPositionOfMC(this,true);
         this.root_mc.showTooltip(this.root_mc.skillPane_mc.characterHandle,this.tooltipID,3 + _loc2_.x - this.tooltipWidth - this.width - this.localCellIndex * 64,_loc2_.y - 18 - 5,90,0);
         this.root_mc.hasTooltip = true;
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         if(this.skillSelectedHL_mc.visible)
         {
            this.skillSelectedHL_mc.visible = false;
         }
         this.root_mc.skillPane_mc.currentlyHovering = null;
         if(this.root_mc.hasTooltip)
         {
            this.root_mc.hideTooltip();
            this.root_mc.hasTooltip = false;
            this.root_mc.curTooltip = -1;
         }
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         this.skillSelectedHL_mc.visible = true;
         if(!this.root_mc.isDragging)
         {
            this.root_mc.addEventListener(Event.ENTER_FRAME,this.dragging);
            this.root_mc.addEventListener(MouseEvent.MOUSE_UP,this.onUp);
            this.mousePosX = stage.mouseX;
            this.mousePosY = stage.mouseY;
         }
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         this.root_mc.removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.root_mc.removeEventListener(Event.ENTER_FRAME,this.dragging);
         ExternalInterface.call("cancelDragging");
         if(!this.root_mc.isDragging)
         {
            ExternalInterface.call(this.root_mc.buttonCallBack[1],this.tooltipID,!this.isActive);
         }
         this.skillSelectedHL_mc.visible = false;
      }
      
      public function dragging() : *
      {
         if(root != null)
         {
            if(this.mousePosX + this.startDragDiff < stage.mouseX || this.mousePosX - this.startDragDiff > stage.mouseX || this.mousePosY + this.startDragDiff < stage.mouseY || this.mousePosY - this.startDragDiff > stage.mouseY)
            {
               if(this.dragAvailable)
               {
                  ExternalInterface.call("startDragging",this.tooltipID,false);
                  this.root_mc.draggingSkillMemory = this.memoryCost;
                  this.root_mc.draggingSkillSchool = this.skillSchoolId;
                  this.root_mc.draggingSkillId = this.tooltipID;
                  this.root_mc.showSkillPreview();
               }
               this.root_mc.removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
               this.root_mc.removeEventListener(Event.ENTER_FRAME,this.dragging);
            }
         }
      }
      
      function frame1() : *
      {
         this.root_mc = root as MovieClip;
         this.mousePosX = 0;
         this.mousePosY = 0;
         this.skillSlot_hitbox.addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         this.skillSlot_hitbox.addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         this.skillSlot_hitbox.addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
      }
   }
}
