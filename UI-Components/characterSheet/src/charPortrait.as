package
{
   import LS_Classes.larTween;
   import fl.motion.easing.Linear;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public dynamic class charPortrait extends MovieClip
   {
       
      
      public var frame_mc:MovieClip;
      
      public var give_mc:MovieClip;
      
      public var icon_mc:empty;
      
      public var isActive:Boolean;
      
      public var base:MovieClip;
      
      public var isDown:Boolean;
      
      public var timeline:larTween;
      
      public var img:MovieClip;
      
      public function charPortrait()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onDoubleClick(param1:MouseEvent) : *
      {
         ExternalInterface.call("centerCamOnCharacter",this.id);
      }
      
      public function init() : *
      {
         this.img = new IggyIcon();
         this.icon_mc.addChild(this.img);
      }
      
      public function setIcon(param1:String) : *
      {
         this.img.name = "iggy_" + param1;
      }
      
      public function onBleh(param1:MouseEvent) : *
      {
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         this.frame_mc.gotoAndStop(!!this.isActive?2:4);
         if(this.base.isDragging)
         {
            this.setHandVisible(true);
         }
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         this.frame_mc.gotoAndStop(!!this.isActive?1:3);
         this.setHandVisible(false);
         this.isDown = false;
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         this.isDown = true;
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         if(this.base.isDragging)
         {
            ExternalInterface.call("stopDraggingOnChar",this.id);
         }
         else if(this.isDown)
         {
            ExternalInterface.call("selectCharacter",this.id);
         }
         this.isDown = false;
      }
      
      public function selectElement() : *
      {
         this.setIsActive(true);
      }
      
      public function deselectElement() : *
      {
         this.setIsActive(false);
      }
      
      public function setIsActive(param1:Boolean) : *
      {
         this.isActive = param1;
         this.frame_mc.gotoAndStop(!!this.isActive?1:3);
      }
      
      public function setHandVisible(param1:Boolean) : *
      {
         if(param1)
         {
            this.timeline = new larTween(this.give_mc,"alpha",Linear.easeNone,this.give_mc.alpha,1,0.01);
            this.give_mc.visible = true;
         }
         else if(this.give_mc.visible)
         {
            this.timeline = new larTween(this.give_mc,"alpha",Linear.easeNone,this.give_mc.alpha,0,0.01,this.hideArrow);
         }
      }
      
      public function hideArrow() : *
      {
         this.give_mc.visible = false;
      }
      
      function frame1() : *
      {
         mouseChildren = false;
         doubleClickEnabled = true;
         this.base = root as MovieClip;
         this.isDown = false;
         addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         addEventListener(MouseEvent.MOUSE_UP,this.onUp);
         addEventListener(MouseEvent.CLICK,this.onBleh);
         addEventListener(MouseEvent.DOUBLE_CLICK,this.onDoubleClick,false,0,true);
      }
   }
}
