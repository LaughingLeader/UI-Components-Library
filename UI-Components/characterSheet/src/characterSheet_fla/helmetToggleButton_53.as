package characterSheet_fla
{
   import LS_Classes.tooltipHelper;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class helmetToggleButton_53 extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public var icon_mc:MovieClip;
      
      public var base:MovieClip;
      
      public var tweentime:Number;
      
      public var isOver:Boolean;
      
      public function helmetToggleButton_53()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onMouseOver(param1:MouseEvent) : *
      {
         ExternalInterface.call("PlaySound","UI_Game_Inventory_Over");
         tooltipHelper.ShowTooltipForMC(this,root);
         this.isOver = true;
      }
      
      public function onMouseOut(param1:MouseEvent) : *
      {
         this.isOver = false;
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         ExternalInterface.call("hideTooltip");
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         addEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.stateID++;
         if(this.allowCombatOnly)
         {
            if(this.stateID > 2)
            {
               this.stateID = 0;
            }
         }
         else if(this.stateID > 1)
         {
            this.stateID = 0;
         }
         if(this.stateID == 0)
         {
            ExternalInterface.call("PlaySound","UI_Game_Inventory_Visor_Open");
         }
         else
         {
            ExternalInterface.call("PlaySound","UI_Game_Inventory_Visor_Close");
         }
         this.icon_mc.gotoAndStop(this.stateID + 1);
         ExternalInterface.call("setHelmetOption",this.stateID);
      }
      
      public function setState(param1:Number) : *
      {
         this.stateID = param1;
         this.icon_mc.gotoAndStop(this.stateID + 1);
      }
      
      public function setTooltip(param1:String) : *
      {
         this.tooltip = param1;
         if(this.isOver)
         {
            tooltipHelper.ShowTooltipForMC(this,root);
         }
      }
      
      function frame1() : *
      {
         this.base = root as MovieClip;
         this.tweentime = 0.2;
         this.isOver = false;
         addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         addEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
         addEventListener(MouseEvent.ROLL_OVER,this.onMouseOver);
      }
   }
}
