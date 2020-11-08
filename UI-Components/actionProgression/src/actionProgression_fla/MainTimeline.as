package actionProgression_fla
{
   import flash.display.MovieClip;
   import flash.external.ExternalInterface;
   
   public dynamic class MainTimeline extends MovieClip
   {
       
      
      public var container_mc:MovieClip;
      
      public var events:Array;
      
      public var layout:String;
      
      public var frame_width:Number;
      
      public var frame_height:Number;
      
      public var frameSpacing:Number;
      
      public var pb_array:Array;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function setWindow(param1:Number, param2:Number) : *
      {
         var _loc3_:Number = param1 / param2;
         var _loc4_:Number = 1920;
         var _loc5_:Number = 1080;
         if(_loc3_ > 1.7)
         {
            _loc5_ = 1920 / param1 * param2;
         }
         else
         {
            _loc4_ = 1080 / param2 * param1;
         }
         this.frame_width = _loc4_;
         this.frame_height = _loc5_;
         this.resetAllPbPositions();
      }
      
      public function onEventInit() : *
      {
      }
      
      public function setAnchor(param1:Number, param2:* = true) : *
      {
         ExternalInterface.call("registerAnchorId","actionProgression_" + param1);
         ExternalInterface.call("setAnchor","topleft","splitscreen","topleft");
      }
      
      public function onEventResize() : *
      {
      }
      
      public function resetAllPbPositions() : *
      {
         var _loc2_:MovieClip = null;
         var _loc1_:* = 0;
         while(_loc1_ < this.pb_array.length)
         {
            _loc2_ = this.pb_array[_loc1_];
            this.checkTooltipBoundaries(_loc2_,_loc2_.myX,_loc2_.myY);
            _loc1_++;
         }
      }
      
      public function removeProgressionBar(param1:Number) : *
      {
         var _loc2_:MovieClip = this.getPBar(param1);
         if(_loc2_)
         {
            this.pb_array.splice(_loc2_.loc,1);
            this.container_mc.removeChild(_loc2_);
         }
      }
      
      public function clearAll() : *
      {
         this.removeChildrenOf(this.container_mc);
         this.pb_array = new Array();
      }
      
      public function showProgressionBar(param1:Number, param2:Number, param3:Number, param4:Number, param5:String) : *
      {
         var _loc6_:MovieClip = this.getPBar(param1);
         if(!_loc6_)
         {
            _loc6_ = new PBar();
            _loc6_.id = param1;
            this.container_mc.addChild(_loc6_);
            this.pb_array.push(_loc6_);
         }
         _loc6_.myX = _loc6_.x = param2;
         _loc6_.myY = _loc6_.y = param3;
         _loc6_.bar_mc.scaleX = param4;
         this.addIggyIcon(_loc6_.img_mc,param5);
         this.checkTooltipBoundaries(_loc6_,param2,param3);
      }
      
      public function addIggyIcon(param1:MovieClip, param2:String) : *
      {
         var _loc3_:MovieClip = null;
         if(param2 != param1.texture)
         {
            this.removeChildrenOf(param1);
            _loc3_ = new IggyIcon();
            _loc3_.name = "iggy_" + param2;
            param1.texture = param2;
            param1.addChild(_loc3_);
         }
      }
      
      public function removeChildrenOf(param1:MovieClip) : void
      {
         var _loc2_:int = 0;
         if(param1.numChildren != 0)
         {
            _loc2_ = param1.numChildren;
            while(_loc2_ > 0)
            {
               _loc2_--;
               param1.removeChildAt(_loc2_);
            }
         }
      }
      
      public function getPBar(param1:Number) : MovieClip
      {
         var _loc2_:* = 0;
         while(_loc2_ < this.pb_array.length)
         {
            if(this.pb_array[_loc2_].id == param1)
            {
               this.pb_array[_loc2_].loc = _loc2_;
               return this.pb_array[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function checkTooltipBoundaries(param1:MovieClip, param2:Number, param3:Number) : *
      {
         var _loc4_:Number = NaN;
         if(param1)
         {
            _loc4_ = param3;
            if(param2 < this.frameSpacing)
            {
               param2 = this.frameSpacing;
            }
            else if(param2 + param1.width + this.frameSpacing > this.frame_width)
            {
               param2 = this.frame_width - param1.width - this.frameSpacing;
            }
            if(param3 < this.frameSpacing)
            {
               param3 = this.frameSpacing;
            }
            else if(param3 + param1.height + this.frameSpacing > this.frame_height)
            {
               param3 = this.frame_height - param1.height - this.frameSpacing;
            }
            param1.x = param2;
            param1.y = param3;
         }
      }
      
      function frame1() : *
      {
         this.events = new Array();
         this.layout = "fitVertical";
         this.frame_width = 1920;
         this.frame_height = 1080;
         this.frameSpacing = 10;
         this.pb_array = new Array();
      }
   }
}
