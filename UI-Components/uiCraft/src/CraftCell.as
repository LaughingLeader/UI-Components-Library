package
{
   import LS_Classes.textEffect;
   import LS_Classes.tooltipHelper;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   
   public dynamic class CraftCell extends MovieClip
   {
       
      
      public var Spacing_mc:MovieClip;
      
      public var alert_mc:MovieClip;
      
      public var amount_txt:TextField;
      
      public var bg_mc:MovieClip;
      
      public var disabled_mc:MovieClip;
      
      public var iconHolder_mc:MovieClip;
      
      public var base:MovieClip;
      
      public var iconMC:MovieClip;
      
      public var m_amount:Number;
      
      public var isRecipe:Boolean;
      
      public var objEmpty:Boolean;
      
      public function CraftCell()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function initExperiment(param1:Boolean = false) : *
      {
         this.isRecipe = param1;
         addEventListener(MouseEvent.ROLL_OVER,this.showTooltipExp);
         addEventListener(MouseEvent.ROLL_OUT,this.hideTooltip);
         if(!this.isRecipe)
         {
            addEventListener(MouseEvent.MOUSE_DOWN,this.startDragging);
            addEventListener(MouseEvent.MOUSE_UP,this.stopDragging);
            addEventListener(MouseEvent.CLICK,this.clearSlot,false,0,true);
         }
         this.iconMC = new iggyIcon();
         this.iconHolder_mc.addChild(this.iconMC);
      }
      
      public function startDragging(param1:MouseEvent) : *
      {
         if(!this.base.disableActions && !this.base.isDragging && !this.objEmpty)
         {
            ExternalInterface.call("PlaySound","UI_Game_Craft_Click");
            ExternalInterface.call("startDraggingIngredient",this.objHandle);
            this.base.draggingIngredient = true;
         }
      }
      
      public function stopDragging(param1:MouseEvent) : *
      {
         if(this.base.isDragging && !this.base.disableActions)
         {
            ExternalInterface.call("stopDraggingIngredient",this.id);
         }
      }
      
      public function set amount(param1:Number) : *
      {
         this.m_amount = param1;
         if(this.isRecipe || this.m_amount > 1)
         {
            this.amount_txt.htmlText = this.m_amount + "";
         }
         else
         {
            this.amount_txt.htmlText = "";
         }
         this.disabled_mc.visible = this.isRecipe && this.m_amount == 0;
      }
      
      public function get amount() : Number
      {
         return this.m_amount;
      }
      
      public function hideTooltip(param1:MouseEvent = null) : *
      {
         this.Spacing_mc.alpha = 0;
         if(this.base.hasTooltip)
         {
            ExternalInterface.call("hideTooltip");
            this.base.hasTooltip = false;
         }
         this.base.curTooltip = -1;
      }
      
      public function showTooltip(param1:MouseEvent = null) : *
      {
         this.Spacing_mc.alpha = 0.2;
         if(!this.objEmpty)
         {
            this.Spacing_mc.tooltip = this.objName;
            this.base.curTooltip = -3;
            tooltipHelper.ShowTooltipForMC(this.Spacing_mc,root,"right");
         }
      }
      
      public function clearSlot(param1:MouseEvent) : *
      {
         if(!this.objEmpty)
         {
            ExternalInterface.call("clearSlot",this.id,true);
            ExternalInterface.call("hideTooltip");
         }
      }
      
      public function showTooltipExp() : *
      {
         this.Spacing_mc.alpha = 0.2;
         if(!this.objEmpty)
         {
            this.Spacing_mc.itemHandle = this.objHandle;
            ExternalInterface.call("slotOver",this.objHandle);
            this.base.curTooltip = -2;
            tooltipHelper.ShowItemTooltipForMC(this.Spacing_mc,root,"right");
         }
      }
      
      function frame1() : *
      {
         this.alert_mc.mouseEnabled = false;
         this.alert_mc.mouseChildren = false;
         this.alert_mc.visible = false;
         this.Spacing_mc.addEventListener(MouseEvent.ROLL_OUT,this.hideTooltip);
         this.Spacing_mc.addEventListener(MouseEvent.ROLL_OVER,this.showTooltip);
         this.base = root as MovieClip;
         this.bg_mc.mouseEnabled = false;
         this.bg_mc.mouseChildren = false;
         this.amount_txt.filters = textEffect.createStrokeFilter(1050888,1.4,1,1.8,3);
      }
   }
}
