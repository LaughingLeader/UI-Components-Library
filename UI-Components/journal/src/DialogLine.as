package
{
   import com.flashdynamix.motion.TweensyTimelineZero;
   import com.flashdynamix.motion.TweensyZero;
   import fl.motion.easing.Cubic;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public dynamic class DialogLine extends MovieClip
   {
       
      
      public var bulletAnim_mc:MovieClip;
      
      public var bullet_mc:MovieClip;
      
      public var iline_txt:TextField;
      
      public var line_txt:TextField;
      
      public var animTl:TweensyTimelineZero;
      
      public var _speaker:String;
      
      public function DialogLine()
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
         var _loc1_:Number = 3;
         this.animTl = TweensyZero.to(this.bulletAnim_mc,{
            "scaleX":_loc1_,
            "scaleY":_loc1_,
            "alpha":0
         },0.7,Cubic.easeOut);
         this.animTl.onComplete = this.restartAnim;
      }
      
      public function restartAnim() : *
      {
         if(this.bulletAnim_mc && this.bulletAnim_mc.visible)
         {
            this.bulletAnim_mc.alpha = 1;
            this.bulletAnim_mc.scaleY = 1;
            this.bulletAnim_mc.scaleX = 1;
         }
         this.INTStartAnim();
      }
      
      function frame1() : *
      {
      }
   }
}
