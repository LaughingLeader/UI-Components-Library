package
{
   import com.flashdynamix.motion.TweensyZero;
   import fl.motion.easing.Quartic;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public dynamic class warning extends MovieClip
   {
       
      
      public var warning_txt:TextField;
      
      public function warning()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function startAnim() : *
      {
         TweensyZero.fromTo(this.warning_txt,{"alpha":0.3},{
            "alpha":1,
            "y":-20
         },0.5,Quartic.easeOut,0,null,this.onEnd);
      }
      
      public function onEnd() : *
      {
         TweensyZero.fromTo(this.warning_txt,{"alpha":1},{"alpha":0},2,Quartic.easeOut,0.5,null,this.removeThis);
      }
      
      public function removeThis() : *
      {
         parent.removeChild(this);
      }
      
      function frame1() : *
      {
      }
   }
}
