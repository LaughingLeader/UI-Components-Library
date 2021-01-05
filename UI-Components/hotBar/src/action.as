package
{
   import LS_Classes.tooltipHelper;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   
   public dynamic class action extends MovieClip
   {
       
      
      public var disabled_mc:MovieClip;
      
      public var hit_mc:MovieClip;
      
      public var preview_mc:MovieClip;
      
      public var startDragDiff:Number;
      
      public var startDragX:Number;
      
      public var startDragY:Number;
      
      public function action()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         if(!this.disabled_mc.visible)
         {
            this.hit_mc.alpha = 0.3;
         }
         var _loc2_:Point = tooltipHelper.getGlobalPositionOfMC(this,root);
         ExternalInterface.call("showSkillTooltip",this.root_mc.hotbar_mc.characterHandle,this.actionID,_loc2_.x,_loc2_.y - Math.round(this.height * 0.5),this.width,this.height);
      }
      
      public function startDragging(param1:MouseEvent) : *
      {
         if(this.startDragX + this.startDragDiff < stage.mouseX || this.startDragY + this.startDragDiff < stage.mouseY || this.startDragX - this.startDragDiff > stage.mouseX || this.startDragY - this.startDragDiff > stage.mouseY)
         {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.startDragging);
            ExternalInterface.call("startDraggingAction",this.actionID);
         }
      }
      
      public function onDown() : *
      {
         addEventListener(MouseEvent.MOUSE_UP,this.onUp);
         if(!(root as MovieClip).isDragging)
         {
            this.startDragX = stage.mouseX;
            this.startDragY = stage.mouseY;
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.startDragging);
         }
      }
      
      public function onUp() : *
      {
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         if(!this.disabled_mc.visible)
         {
            ExternalInterface.call("PlaySound","UI_Gen_XButton_Click");
            ExternalInterface.call("useAction",this.actionID);
         }
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.startDragging);
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         this.hit_mc.alpha = 0;
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      function frame1() : *
      {
         this.startDragDiff = 10;
         this.startDragX = 0;
         this.startDragY = 0;
         addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
      }
   }
}