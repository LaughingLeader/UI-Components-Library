package
{
   import LS_Classes.tooltipHelper;
   import com.flashdynamix.motion.TweensyTimelineZero;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class Tab extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public var disabled_mc:MovieClip;
      
      public var icon_mc:empty;
      
      public var select_mc:MovieClip;
      
      public var fadeTime:Number;
      
      public const iconY:Number = 4;
      
      public var timeline:TweensyTimelineZero;
      
      public function Tab()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         if(!this.disabled_mc.visible)
         {
            ExternalInterface.call("PlaySound","UI_Game_Inventory_Over");
            if(!this.select_mc.visible)
            {
               this.bg_mc.gotoAndStop(2);
            }
            else
            {
               this.select_mc.gotoAndStop(2);
            }
         }
         if(this.tooltip && this.tooltip != "")
         {
            this.tooltipYOffset = 2;
            tooltipHelper.ShowTooltipForMC(this,root,"top");
         }
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         if(!this.disabled_mc.visible)
         {
            this.icon_mc.y = this.iconY;
            if(!this.select_mc.visible)
            {
               this.bg_mc.gotoAndStop(1);
            }
            else
            {
               this.select_mc.gotoAndStop(1);
            }
         }
         if(this.tooltip)
         {
            ExternalInterface.call("hideTooltip",this.tooltip);
         }
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         if(!this.disabled_mc.visible)
         {
            addEventListener(MouseEvent.MOUSE_UP,this.onUp);
            this.icon_mc.y = this.iconY + 2;
            if(!this.select_mc.visible)
            {
               this.bg_mc.gotoAndStop(3);
            }
            else
            {
               this.select_mc.gotoAndStop(3);
            }
         }
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         if(!this.disabled_mc.visible)
         {
            this.icon_mc.y = this.iconY;
            if(!this.select_mc.visible)
            {
               this.bg_mc.gotoAndStop(2);
            }
            else
            {
               this.select_mc.gotoAndStop(2);
            }
            (root as MovieClip).inventory_mc.selectTab(this.id,true,true);
         }
      }
      
      public function rightDown(param1:MouseEvent) : *
      {
         if(!this.disabled_mc.visible)
         {
            this.bg_mc.gotoAndStop(3);
            addEventListener("rightMouseUp",this.rightUp);
         }
      }
      
      public function rightUp(param1:MouseEvent) : *
      {
         removeEventListener("rightMouseUp",this.rightUp);
         if(!this.disabled_mc.visible)
         {
            this.icon_mc.y = this.iconY;
            if(!this.select_mc.visible)
            {
               this.bg_mc.gotoAndStop(2);
            }
            else
            {
               this.select_mc.gotoAndStop(2);
            }
            (root as MovieClip).inventory_mc.selectTab(this.id,true);
         }
      }
      
      public function selectElement(param1:*) : *
      {
         this.bg_mc.gotoAndStop(1);
         this.select_mc.gotoAndStop(1);
         this.select_mc.visible = true;
         ExternalInterface.call("addTab",this.id);
      }
      
      public function deselectElement(param1:*) : *
      {
         this.bg_mc.gotoAndStop(1);
         this.select_mc.gotoAndStop(1);
         this.select_mc.visible = false;
         if(this.id != -1)
         {
            ExternalInterface.call("removeTab",this.id);
         }
      }
      
      public function toggleSelection() : *
      {
         if(this.isSelected())
         {
            this.deselectElement(0);
         }
         else
         {
            this.selectElement(0);
         }
      }
      
      public function isSelected() : *
      {
         return this.select_mc.visible;
      }
      
      function frame1() : *
      {
         this.fadeTime = 0.8;
         mouseChildren = false;
         addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         addEventListener("rightMouseDown",this.rightDown);
      }
   }
}
