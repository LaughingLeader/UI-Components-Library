package hotBar_fla
{
   import LS_Classes.larTween;
   import fl.motion.easing.Sine;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class expBar_23 extends MovieClip
   {
       
      
      public var exp1_mc:MovieClip;
      
      public var exp2_mc:MovieClip;
      
      public var expHit_mc:MovieClip;
      
      public var timeline:larTween;
      
      public var cachedPerc:Number;
      
      public var WTweenTime:Number;
      
      public var TweenTime:Number;
      
      public var WDelayTime:Number;
      
      public var lvlDelayTime:Number;
      
      public function expBar_23()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         ExternalInterface.call("hideTooltip");
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         ExternalInterface.call("showExpTooltip");
      }
      
      public function addExpAnimated(param1:Number) : *
      {
         if(param1 < this.cachedPerc)
         {
            this.timeline = new larTween(this.exp2_mc,"scaleX",Sine.easeOut,NaN,1,this.WTweenTime,this.continueExpLvlUpAnimated1);
         }
         else
         {
            this.timeline = new larTween(this.exp2_mc,"scaleX",Sine.easeOut,NaN,param1,this.WTweenTime,this.continueExpAnimated);
         }
         this.cachedPerc = param1;
      }
      
      public function continueExpLvlUpAnimated1() : *
      {
         this.timeline = new larTween(this.exp1_mc,"scaleX",Sine.easeOut,NaN,1,this.TweenTime,this.continueExpLvlUpAnimated2,null,this.WDelayTime);
      }
      
      public function continueExpLvlUpAnimated2() : *
      {
         this.exp1_mc.scaleX = 0;
         this.exp2_mc.scaleX = 0;
         this.timeline = new larTween(this.exp2_mc,"scaleX",Sine.easeOut,NaN,this.cachedPerc,this.WTweenTime,this.continueExpLvlUpAnimated3,null,this.lvlDelayTime);
      }
      
      public function continueExpLvlUpAnimated3() : *
      {
         this.timeline = new larTween(this.exp1_mc,"scaleX",Sine.easeOut,NaN,this.cachedPerc,this.TweenTime,null,null,this.WDelayTime);
      }
      
      public function continueExpAnimated() : *
      {
         this.timeline = new larTween(this.exp1_mc,"scaleX",Sine.easeOut,NaN,this.cachedPerc,this.TweenTime,null,null,this.WDelayTime);
      }
      
      public function setExp(param1:Number) : *
      {
         this.exp1_mc.scaleX = param1;
         this.exp2_mc.scaleX = param1;
         this.cachedPerc = param1;
      }
      
      function frame1() : *
      {
         this.cachedPerc = 0;
         this.WTweenTime = 0.3;
         this.TweenTime = 0.5;
         this.WDelayTime = 0.2;
         this.lvlDelayTime = 0.1;
         this.expHit_mc.addEventListener(MouseEvent.MOUSE_OUT,this.onOut);
         this.expHit_mc.addEventListener(MouseEvent.MOUSE_OVER,this.onOver);
      }
   }
}
