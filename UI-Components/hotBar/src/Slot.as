package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class Slot extends MovieClip
   {
       
      
      public var amount_mc:MovieClip;
      
      public var cd_mc:MovieClip;
      
      public var disable_mc:MovieClip;
      
      public var refreshSlot_mc:MovieClip;
      
      public var unavailable_mc:MovieClip;
      
      public var id:Number;
      
      public var oldCD:Number;
      
      public function Slot()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function setCoolDown(param1:Number) : *
      {
         if(param1 == -1)
         {
            this.oldCD = 0;
            param1 = 0;
         }
         if(param1 == 0)
         {
            this.disable_mc.alpha = 1;
            this.isEnabled = true;
            this.cd_mc.visible = false;
            if(this.oldCD != 0)
            {
               this.refreshSlot_mc.visible = true;
               this.refreshSlot_mc.alpha = 1;
               this.refreshSlot_mc.gotoAndPlay(2);
               ExternalInterface.call("PlaySound","UI_Game_Skill_Cooldown_End");
            }
         }
         else
         {
            this.disable_mc.alpha = 0;
            this.cd_mc.visible = true;
            this.isEnabled = false;
         }
         this.oldCD = param1;
         this.cd_mc.setCoolDown(param1);
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         this.onMouseOver();
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         this.onMouseOut();
      }
      
      public function onClick(param1:MouseEvent) : *
      {
         ExternalInterface.call("SlotPressed",this.id,this.isEnabled);
         if(this.isEnabled)
         {
            ExternalInterface.call("PlaySound","UI_Generic_Click");
         }
         else if(this.cd_mc.visible)
         {
            ExternalInterface.call("PlaySound","UI_Game_Skill_Cooldown_Neg");
         }
      }
      
      public function onMouseOver() : *
      {
         if((root as MovieClip).isDragging || this.inUse && this.isEnabled)
         {
            ExternalInterface.call("PlaySound","UI_Generic_Over");
            ExternalInterface.call("SlotHover",this.id);
         }
      }
      
      public function onMouseOut() : *
      {
         ExternalInterface.call("SlotHoverOut",this.id);
      }
      
      function frame1() : *
      {
         this.amount_mc.mouseEnabled = false;
         this.amount_mc.mouseChildren = false;
         this.refreshSlot_mc.visible = false;
      }
   }
}
