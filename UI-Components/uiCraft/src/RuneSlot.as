package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.text.TextField;
   
   public dynamic class RuneSlot extends MovieClip
   {
       
      
      public var btn_mc:smallRedBtn;
      
      public var desc_txt:TextField;
      
      public var iconHolder_mc:MovieClip;
      
      public var name_txt:TextField;
      
      public var runeSlotIcon_mc:MovieClip;
      
      public var shine_mc:MovieClip;
      
      public var title_txt:TextField;
      
      public var base:MovieClip;
      
      public function RuneSlot()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function setElemWidth(param1:*) : *
      {
         this.desc_txt.x = -Math.round(param1 * 0.5);
         this.name_txt.x = -Math.round(param1 * 0.5);
         this.title_txt.x = -Math.round(param1 * 0.5);
         this.desc_txt.width = param1;
         this.name_txt.width = param1;
         this.title_txt.width = param1;
      }
      
      public function overTarget(param1:MouseEvent) : *
      {
         var _loc2_:MovieClip = root as MovieClip;
         var _loc3_:Point = this.shine_mc.localToGlobal(new Point(0,0));
         _loc3_.x = _loc3_.x - _loc2_.x;
         _loc3_.y = Math.round(_loc3_.y - _loc2_.y - this.shine_mc.height * 0.5 + 23);
         ExternalInterface.call("showRuneTooltip",this.id,_loc3_.x,_loc3_.y,this.shine_mc.width,this.shine_mc.height);
         this.shine_mc.addEventListener(MouseEvent.ROLL_OUT,this.outTarget);
         this.shine_mc.alpha = 1;
      }
      
      public function outTarget(param1:MouseEvent) : *
      {
         this.shine_mc.removeEventListener(MouseEvent.ROLL_OUT,this.outTarget);
         ExternalInterface.call("hideTooltip");
         this.shine_mc.alpha = 0;
      }
      
      public function onTargetHitClicked(param1:MouseEvent) : *
      {
         this.base.buttonPressed(this);
         ExternalInterface.call("PlaySound","UI_Generic_Click");
      }
      
      public function stopDragging() : *
      {
         ExternalInterface.call("stopDraggingRuneSlot",this.id);
         ExternalInterface.call("PlaySound","UI_Game_Runes_Insert");
      }
      
      function frame1() : *
      {
         this.shine_mc.addEventListener(MouseEvent.ROLL_OVER,this.overTarget);
         this.shine_mc.addEventListener(MouseEvent.CLICK,this.onTargetHitClicked);
         this.shine_mc.addEventListener(MouseEvent.MOUSE_UP,this.stopDragging);
      }
   }
}
