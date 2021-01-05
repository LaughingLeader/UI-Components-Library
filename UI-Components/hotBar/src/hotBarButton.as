package
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public dynamic class hotBarButton extends MovieClip
   {
       
      
      public var active_mc:MovieClip;
      
      public var bg_mc:MovieClip;
      
      public var btn_txt:TextField;
      
      public var disable_mc:MovieClip;
      
      public var myType:Number;
      
      public var toAlpha:Number;
      
      public var icon_bg:MovieClip;
      
      public function hotBarButton()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function setBtnDisabled(param1:Boolean) : *
      {
         this.disable_mc.visible = param1;
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         if(!this.disable_mc.visible)
         {
            addEventListener(MouseEvent.MOUSE_UP,this.onUp);
            this.active_mc.gotoAndStop(3);
            this.bg_mc.gotoAndStop(3);
         }
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         var _loc2_:Boolean = false;
         if(!this.disable_mc.visible)
         {
            removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
            this.active_mc.gotoAndStop(2);
            this.bg_mc.gotoAndStop(2);
            _loc2_ = this.active_mc.visible;
            this.active_mc.visible = !_loc2_;
            this.bg_mc.visible = _loc2_;
            this.onUpCallback();
         }
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         (root as MovieClip).hotbar_mc.showBtnTooltip(this);
         if(!this.disable_mc.visible)
         {
            this.active_mc.gotoAndStop(2);
            this.bg_mc.gotoAndStop(2);
            this.icon_bg.alpha = 1;
         }
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         if(!this.disable_mc.visible)
         {
            removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
            this.active_mc.gotoAndStop(1);
            this.bg_mc.gotoAndStop(1);
         }
         this.icon_bg.alpha = this.toAlpha;
         if(this.tooltip != null && this.tooltip != "")
         {
            ExternalInterface.call("hideTooltip");
         }
      }
      
      public function setText(param1:String) : *
      {
         var _loc2_:Number = 26;
         var _loc3_:TextFormat = this.btn_txt.defaultTextFormat;
         if(param1.length > 1)
         {
            _loc3_.size = 12;
            this.btn_txt.defaultTextFormat = _loc3_;
            this.btn_txt.y = _loc2_ + 6;
         }
         else
         {
            _loc3_.size = 18;
            this.btn_txt.defaultTextFormat = _loc3_;
            this.btn_txt.y = _loc2_;
         }
         this.btn_txt.text = param1.toUpperCase();
      }
      
      public function setButtonActive(param1:Boolean) : *
      {
         if(this.active_mc.visible != param1 && !this.disable_mc.visible)
         {
            this.active_mc.visible = param1;
            this.bg_mc.visible = !param1;
         }
      }
      
      public function setImage(param1:Number) : *
      {
         var _loc2_:BitmapData = null;
         this.myType = param1;
         switch(param1)
         {
            case 0:
               _loc2_ = new ico_menu();
               break;
            case 1:
               _loc2_ = new ico_inventory();
               break;
            case 2:
               _loc2_ = new ico_skills();
               break;
            case 3:
               _loc2_ = new ico_crafting();
               break;
            case 4:
               _loc2_ = new ico_map();
               break;
            case 5:
               _loc2_ = new ico_journal();
         }
         new Bitmap(_loc2_);
         this.icon_bg.addChild(new Bitmap(_loc2_));
         this.addChildAt(this.icon_bg,2);
         this.icon_bg.x = -2;
      }
      
      public function onUpCallback() : *
      {
         ExternalInterface.call("hotbarBtnPressed",this.myType);
      }
      
      function frame1() : *
      {
         addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onOut);
      }
   }
}
