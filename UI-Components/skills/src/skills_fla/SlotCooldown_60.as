package skills_fla
{
   import LS_Classes.textEffect;
   import com.flashdynamix.motion.TweensyTimelineZero;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public dynamic class SlotCooldown_60 extends MovieClip
   {
       
      
      public var cd_txt:TextField;
      
      public var mask_mc:MovieClip;
      
      public var timeline:TweensyTimelineZero;
      
      public var lineOpacity:Number;
      
      public var rot:Number;
      
      public var cellSize:Number;
      
      public function SlotCooldown_60()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function setCooldown(param1:Number) : *
      {
         var _loc2_:MovieClip = root as MovieClip;
         var _loc3_:Boolean = _loc2_ != null && _loc2_.isInCombat != null && _loc2_.isInCombat;
         if(!_loc3_)
         {
            param1 = param1 + 1;
         }
         this.cd_txt.filters = textEffect.createStrokeFilter(16777215,1.2,0.8,1,3);
         this.cd_txt.text = int(param1).toString();
         this.cd_txt.background = false;
         this.cd_txt.border = false;
         if(_loc3_)
         {
            this.lineOpacity = 0;
         }
         else
         {
            this.lineOpacity = 1;
         }
         this.mask_mc.drawWedge(this.cellSize * 0.5,this.cellSize * 0.5,this.cellSize,(1 - param1) * 360 - 90,270,0.6,this.lineOpacity,2);
      }
      
      public function onDraw(param1:Event) : *
      {
         this.mask_mc.drawWedge(this.cellSize * 0.5,this.cellSize * 0.5,this.cellSize,this.rot,270);
      }
      
      public function drawDone() : *
      {
         removeEventListener(Event.ENTER_FRAME,this.onDraw);
         if(this.rot == 270)
         {
            this.mask_mc.deleteWedge();
         }
         (parent as MovieClip).isEnabled = true;
      }
      
      function frame1() : *
      {
         this.lineOpacity = 1;
         this.rot = -90;
         this.cellSize = 68;
         scrollRect = new Rectangle(0,0,this.cellSize,this.cellSize);
      }
   }
}
