package hotBar_fla
{
   import flash.display.MovieClip;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   
   public dynamic class hotBarBrowser_9 extends MovieClip
   {
       
      
      public var downBtn_mc:browseButtonDown;
      
      public var text_txt:TextField;
      
      public var upBtn_mc:browseButtonUp;
      
      public var currentHotBarIndex:uint;
      
      public var root_mc:MovieClip;
      
      public function hotBarBrowser_9()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function showUpTooltip() : *
      {
         if(this.upBtn_mc.tooltip)
         {
            ExternalInterface.call("showTooltip",this.upBtn_mc.tooltip);
         }
      }
      
      public function showDownTooltip() : *
      {
         if(this.downBtn_mc.tooltip)
         {
            ExternalInterface.call("showTooltip",this.downBtn_mc.tooltip);
         }
      }
      
      public function hideTooltip() : *
      {
         ExternalInterface.call("hideTooltip");
      }
      
      public function onInit() : *
      {
         this.upBtn_mc.initialize("",this.cycleHotBar,[false]);
         this.downBtn_mc.initialize("",this.cycleHotBar,[true]);
         this.setCurrentBar(1);
         this.upBtn_mc.onOverFunc = this.showUpTooltip;
         this.downBtn_mc.onOverFunc = this.showDownTooltip;
         this.upBtn_mc.onOutFunc = this.hideTooltip;
         this.downBtn_mc.onOutFunc = this.hideTooltip;
      }
      
      public function setCurrentBar(param1:uint) : *
      {
         this.currentHotBarIndex = param1;
         this.text_txt.htmlText = String(this.currentHotBarIndex);
      }
      
      public function cycleHotBar(param1:Array) : *
      {
         var _loc2_:* = param1[0];
         if(_loc2_)
         {
            this.currentHotBarIndex--;
            if(this.currentHotBarIndex < 1)
            {
               this.currentHotBarIndex = 5;
            }
            ExternalInterface.call("prevHotbar");
         }
         else
         {
            this.currentHotBarIndex++;
            if(this.currentHotBarIndex > 5)
            {
               this.currentHotBarIndex = 1;
            }
            ExternalInterface.call("nextHotbar");
         }
         this.text_txt.htmlText = String(this.currentHotBarIndex);
      }
      
      function frame1() : *
      {
         this.text_txt.mouseEnabled = false;
         this.root_mc = root as MovieClip;
      }
   }
}
