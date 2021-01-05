package uiCraft_fla
{
   import LS_Classes.tooltipHelper;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   
   public dynamic class stationOverlay_12 extends MovieClip
   {
       
      
      public var disabled_mc:MovieClip;
      
      public var iggy_station:iggyIcon;
      
      public var stationText_txt:TextField;
      
      public var base:MovieClip;
      
      public function stationOverlay_12()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function setStationText(param1:String) : *
      {
         this.stationText_txt.htmlText = param1.toUpperCase();
         this.stationText_txt.y = -Math.round(this.stationText_txt.textHeight * 0.5) + 3;
         this.iggy_station.tooltip = param1;
      }
      
      public function setStationAvailable(param1:Boolean) : *
      {
         this.disabled_mc.visible = !param1;
      }
      
      public function showTooltip() : *
      {
         this.base.curTooltip = -3;
         tooltipHelper.ShowTooltipForMC(this.iggy_station,root,"right");
      }
      
      public function hideTooltip() : *
      {
         ExternalInterface.call("hideTooltip");
      }
      
      function frame1() : *
      {
         this.disabled_mc.mouseEnabled = false;
         this.iggy_station.addEventListener(MouseEvent.ROLL_OUT,this.hideTooltip);
         this.iggy_station.addEventListener(MouseEvent.ROLL_OVER,this.showTooltip);
         this.base = root as MovieClip;
      }
   }
}
