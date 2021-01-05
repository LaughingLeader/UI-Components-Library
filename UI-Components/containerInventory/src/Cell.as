package
{
   import LS_Classes.larTween;
   import LS_Classes.textEffect;
   import LS_Classes.tooltipHelper;
   import fl.motion.easing.Quadratic;
   import flash.display.MovieClip;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   
   public dynamic class Cell extends MovieClip
   {
       
      
      public var amount_mc:MovieClip;
      
      public var disable_mc:MovieClip;
      
      public var hl_mc:MovieClip;
      
      public var multi_mc:MovieClip;
      
      public var base:MovieClip;
      
      public var timeline:larTween;
      
      public function Cell()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onMouseOver() : *
      {
         var _loc1_:MovieClip = root as MovieClip;
         ExternalInterface.call("slotOver",this.itemHandle,this.pos);
         if(_loc1_.controllerMode)
         {
            if(this.timeline)
            {
               this.timeline.stop();
            }
            this.hl_mc.visible = true;
            this.timeline = new larTween(this.hl_mc,"alpha",Quadratic.easeIn,NaN,1,0.01);
            if(this.amount <= 0)
            {
               _loc1_.clearTooltip();
            }
         }
         else if(_loc1_.isDragging || this.amount > 0)
         {
            if(this.timeline)
            {
               this.timeline.stop();
            }
            this.hl_mc.visible = true;
            this.timeline = new larTween(this.hl_mc,"alpha",Quadratic.easeIn,NaN,1,0.01);
         }
         this.showTooltip();
      }
      
      public function showTooltip() : *
      {
         var _loc2_:Point = null;
         var _loc1_:MovieClip = root as MovieClip;
         if(_loc1_.inv_mc.alpha == 1 && this.itemHandle != 0)
         {
            _loc1_.curTooltip = this.pos;
            if(_loc1_.controllerMode)
            {
               _loc1_.ShowCellTooltip(Number(this.itemHandle));
               _loc1_.hasTooltip = true;
            }
            else if(this.amount > 0)
            {
               _loc2_ = tooltipHelper.getGlobalPositionOfMC(this,root);
               ExternalInterface.call("showItemTooltip",this.itemHandle,_loc2_.x,_loc2_.y,width,height,-1,"rightTop");
               _loc1_.hasTooltip = true;
            }
         }
      }
      
      public function stopTweens() : *
      {
         if(this.timeline)
         {
            this.timeline.stop();
         }
         this.timeline = null;
      }
      
      public function onMouseOut() : *
      {
         var _loc1_:MovieClip = root as MovieClip;
         if(this.timeline)
         {
            this.timeline.stop();
         }
         this.timeline = new larTween(this.hl_mc,"alpha",Quadratic.easeIn,NaN,0,0.1,this.hlInvis);
         ExternalInterface.call("slotOut");
         if(_loc1_.curTooltip == this.pos && _loc1_.hasTooltip)
         {
            ExternalInterface.call("hideTooltip");
            _loc1_.hasTooltip = false;
         }
         _loc1_.curTooltip = -1;
      }
      
      public function hlInvis() : *
      {
         this.hl_mc.visible = false;
      }
      
      public function showSelected(param1:Boolean) : *
      {
         this.multi_mc.visible = param1;
         if(param1)
         {
            this.multi_mc.gotoAndPlay(2);
         }
         else
         {
            this.multi_mc.gotoAndStop(1);
         }
      }
      
      function frame1() : *
      {
         this.base = root as MovieClip;
         this.amount_mc.filters = textEffect.createStrokeFilter(0,1.4,1,1.8,3);
         this.amount_mc.mouseEnabled = false;
         this.showSelected(false);
      }
   }
}
