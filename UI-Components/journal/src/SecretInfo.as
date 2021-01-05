package
{
   import com.flashdynamix.motion.TweensyTimelineZero;
   import com.flashdynamix.motion.TweensyZero;
   import fl.motion.easing.Sine;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public dynamic class SecretInfo extends MovieClip
   {
       
      
      public var bulletAnim_mc:MovieClip;
      
      public var bullet_mc:MovieClip;
      
      public var name_txt:TextField;
      
      public var animTl:TweensyTimelineZero;
      
      public function SecretInfo()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function startAnim() : *
      {
         this.bulletAnim_mc.visible = true;
         this.restartAnim();
      }
      
      public function INTStartAnim() : *
      {
         var _loc1_:Number = 1.5;
         this.animTl = TweensyZero.to(this.bulletAnim_mc,{
            "scaleX":_loc1_,
            "scaleY":_loc1_,
            "alpha":0.3
         },0.35,Sine.easeIn);
         this.animTl.onComplete = this.restartAnim;
      }
      
      public function restartAnim() : *
      {
         if(this.bulletAnim_mc)
         {
            this.bulletAnim_mc.alpha = 1;
            this.bulletAnim_mc.scaleY = 1;
            this.bulletAnim_mc.scaleX = 1;
         }
         this.INTStartAnim();
      }
      
      public function stopAnim() : *
      {
         if(this.animTl && this.bulletAnim_mc != null)
         {
            TweensyZero.stop(this.bulletAnim_mc);
            this.bulletAnim_mc = null;
         }
         this.bulletAnim_mc.visible = false;
      }
      
      function frame1() : *
      {
      }
   }
}
