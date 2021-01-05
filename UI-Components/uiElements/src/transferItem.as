package
{
   import LS_Classes.larTween;
   import fl.motion.easing.Quadratic;
   import flash.display.MovieClip;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public dynamic class transferItem extends MovieClip
   {
       
      
      public var icon_mc:iconHolder;
      
      public var iconHeight:Number;
      
      public var iconWidth:Number;
      
      public var iconOverlayBg:MovieClip;
      
      public const iconEndAlpha:Number = 0.25;
      
      public const iconEndOffset:Number = -64;
      
      public const tweenTime:Number = 0.5;
      
      public const itemEquipBeginAlpha = 0.5;
      
      public const easingItemTransferIcon:Function = Quadratic.easeIn;
      
      public function transferItem()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function animationFinished() : *
      {
         var _loc1_:MovieClip = parent as MovieClip;
         if(_loc1_)
         {
            _loc1_.removeChild(this);
            if(this.iconOverlayBg != null)
            {
               _loc1_.removeChild(this.iconOverlayBg);
            }
         }
      }
      
      public function startAnim(param1:String, param2:Number, param3:Number, param4:MovieClip = null) : *
      {
         var _loc7_:Timer = null;
         this.setTransferIconImage(param1);
         if(param4 != null)
         {
            this.iconOverlayBg = param4;
         }
         if(param3 == 2 || param3 == 3)
         {
            this.icon_mc.alpha = 0;
            _loc7_ = new Timer(param2 * 1000,1);
         }
         var _loc5_:larTween = null;
         var _loc6_:larTween = null;
         switch(param3)
         {
            case 0:
               _loc5_ = new larTween(this.icon_mc,"alpha",this.easingItemTransferIcon,this.icon_mc.alpha,0,this.tweenTime,this.animationFinished);
               _loc6_ = new larTween(this.icon_mc,"y",this.easingItemTransferIcon,this.icon_mc.y,this.iconEndOffset,this.tweenTime);
               break;
            case 1:
               _loc5_ = new larTween(this.icon_mc,"alpha",this.easingItemTransferIcon,this.itemEquipBeginAlpha,1,this.tweenTime,this.animationFinished);
               _loc6_ = new larTween(this.icon_mc,"y",this.easingItemTransferIcon,this.iconEndOffset,0,this.tweenTime);
               break;
            case 2:
               _loc7_.addEventListener(TimerEvent.TIMER_COMPLETE,this.MoveItemLeft);
               _loc7_.start();
               break;
            case 3:
               _loc7_.addEventListener(TimerEvent.TIMER_COMPLETE,this.MoveItemRight);
               _loc7_.start();
         }
      }
      
      public function MoveItemLeft(param1:*) : *
      {
         var _loc2_:larTween = new larTween(this.icon_mc,"alpha",this.easingItemTransferIcon,1,this.iconEndAlpha,this.tweenTime,this.animationFinished);
         var _loc3_:larTween = new larTween(this.icon_mc,"x",this.easingItemTransferIcon,this.icon_mc.x,this.iconEndOffset,this.tweenTime);
      }
      
      public function MoveItemRight(param1:*) : *
      {
         var _loc2_:larTween = new larTween(this.icon_mc,"alpha",this.easingItemTransferIcon,1,this.iconEndAlpha,this.tweenTime,this.animationFinished);
         var _loc3_:larTween = new larTween(this.icon_mc,"x",this.easingItemTransferIcon,this.icon_mc.x,-this.iconEndOffset,this.tweenTime);
      }
      
      public function setTransferIconImage(param1:String) : *
      {
         var _loc2_:MovieClip = null;
         if(!this.texture || this.texture != param1)
         {
            _loc2_ = new MovieClip();
            _loc2_.name = "iggy_" + param1;
            this.icon_mc.addChild(_loc2_);
            this.texture = param1;
            this.iconHeight = _loc2_.height;
            this.iconWidth = _loc2_.width;
         }
      }
      
      function frame1() : *
      {
         this.iconHeight = 0;
         this.iconWidth = 0;
      }
   }
}
