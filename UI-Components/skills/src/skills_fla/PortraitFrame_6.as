package skills_fla
{
   import flash.display.MovieClip;
   
   public dynamic class PortraitFrame_6 extends MovieClip
   {
       
      
      public var avatar_mc:MovieClip;
      
      public var char_mc:MovieClip;
      
      public var isAvatar:Boolean;
      
      public var isActive:Boolean;
      
      public var isHL:Boolean;
      
      public function PortraitFrame_6()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function setAvatar(param1:Boolean) : *
      {
         this.isAvatar = param1;
         this.char_mc.visible = !this.isAvatar;
         this.avatar_mc.visible = this.isAvatar;
      }
      
      public function setActive(param1:Boolean) : *
      {
         this.isActive = param1;
         this.setFrames();
      }
      
      public function setHL(param1:Boolean) : *
      {
         this.isHL = param1;
         this.setFrames();
      }
      
      public function setFrames() : *
      {
         var _loc1_:Number = !!this.isActive?Number(1):Number(3);
         if(this.isHL)
         {
            _loc1_++;
         }
         this.char_mc.gotoAndStop(_loc1_);
         this.avatar_mc.gotoAndStop(_loc1_);
      }
      
      function frame1() : *
      {
         this.isAvatar = false;
         this.isActive = false;
         this.isHL = false;
      }
   }
}
