package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class Skill extends MovieClip
   {
       
      
      public var hl_mc:MovieClip;
      
      public var skillActivated_mc:MovieClip;
      
      public const minMouseOffset:Number = 10;
      
      public var root_mc:MovieClip;
      
      public var mousePosX:Number;
      
      public var mousePosY:Number;
      
      public function Skill()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         if(!this.root_mc.isDragging)
         {
            ExternalInterface.call("showSkillTooltip",this.root_mc.characterHandle,this.skillID,stage.mouseX,stage.mouseY,90,0);
         }
         else
         {
            addEventListener(MouseEvent.MOUSE_UP,this.onUp);
         }
         if(!this.root_mc.isDragging || this.isChosenSkill)
         {
            this.hl_mc.alpha = 0.3;
         }
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         removeEventListener(MouseEvent.MOUSE_MOVE,this.dragging);
         ExternalInterface.call("hideTooltip");
         this.hl_mc.alpha = 0;
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         addEventListener(MouseEvent.MOUSE_MOVE,this.dragging);
         addEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.hl_mc.alpha = 0.3;
         this.mousePosX = stage.mouseX;
         this.mousePosY = stage.mouseY;
      }
      
      public function dragging() : *
      {
         if((this.mousePosX + this.minMouseOffset > stage.mouseX || this.mousePosX - this.minMouseOffset < stage.mouseX || this.mousePosY + this.minMouseOffset > stage.mouseY || this.mousePosY - this.minMouseOffset < stage.mouseY) && !this.root_mc.isDragging)
         {
            ExternalInterface.call("startDragging",this.skillID,this.listPos != null?this.listPos:-1);
         }
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         ExternalInterface.call("PlaySound","UI_Game_Skills_Click");
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         ExternalInterface.call("useSkill",this.skillID,this.listPos != null?this.listPos:-1);
         this.hl_mc.alpha = 0;
      }
      
      function frame1() : *
      {
         addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         this.hl_mc.alpha = 0;
         if(this.isChosenSkill)
         {
            this.skillActivated_mc.visible = false;
         }
         this.mousePosX = 0;
         this.mousePosY = 0;
      }
   }
}
