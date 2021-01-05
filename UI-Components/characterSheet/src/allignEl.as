package
{
   import LS_Classes.tooltipHelper;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   
   public dynamic class allignEl extends MovieClip
   {
       
      
      public var hl_mc:MovieClip;
      
      public var label_txt:TextField;
      
      public function allignEl()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         if(this.tooltip != null)
         {
            tooltipHelper.ShowTooltipForMC(this,root as MovieClip,"top");
         }
         this.hl_mc.visible = true;
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         if(this.tooltip != null)
         {
            ExternalInterface.call("hideTooltip");
         }
         this.hl_mc.visible = false;
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         var _loc2_:MovieClip = this.elOwner_mc.list;
         if(_loc2_.visible && this.allignID != null)
         {
            this.elOwner_mc.selectAllignment(this.allignID);
            ExternalInterface.call("selectAlignment",this.allignID);
         }
         _loc2_.visible = !_loc2_.visible;
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      function frame1() : *
      {
         addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         addEventListener(MouseEvent.MOUSE_DOWN,function():*
         {
            addEventListener(MouseEvent.MOUSE_UP,onUp);
         });
      }
   }
}
