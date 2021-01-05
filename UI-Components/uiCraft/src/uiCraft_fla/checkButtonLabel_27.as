package uiCraft_fla
{
   import LS_Classes.textHelpers;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public dynamic class checkButtonLabel_27 extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public var check_mc:MovieClip;
      
      public var disabled_mc:MovieClip;
      
      public var hit_mc:MovieClip;
      
      public var text_txt:TextField;
      
      public var base:MovieClip;
      
      public var onDownBool:Boolean;
      
      public var pressedFunc:Function;
      
      public var disabledTextAlpha:Number;
      
      public function checkButtonLabel_27()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function setText(param1:String) : *
      {
         this.text_txt.htmlText = param1.toUpperCase();
         if(this.text_txt.width > 250)
         {
            this.text_txt.htmlText = param1;
            textHelpers.smallCaps(this.text_txt,3,true);
            this.check_mc.x = this.bg_mc.x = this.disabled_mc.x = 0;
         }
         else
         {
            this.check_mc.x = this.bg_mc.x = this.disabled_mc.x = 8;
         }
         this.text_txt.x = this.disabled_mc.x + this.disabled_mc.width + 2;
      }
      
      public function setState(param1:Boolean) : *
      {
         this.check_mc.visible = param1;
         if(this.pressedFunc != null)
         {
            this.pressedFunc(this.check_mc.visible);
         }
         var _loc2_:Number = this.bg_mc.currentFrame;
         if(_loc2_ == 4 || _loc2_ == 2)
         {
            this.bg_mc.gotoAndStop(!!this.check_mc.visible?1:3);
         }
         else
         {
            this.bg_mc.gotoAndStop(!!this.check_mc.visible?2:4);
         }
      }
      
      public function setDisabled(param1:Boolean) : *
      {
         this.visible = !param1;
      }
      
      public function onOut(param1:MouseEvent) : *
      {
         if(!this.disabled_mc.visible)
         {
            this.bg_mc.gotoAndStop(!!this.check_mc.visible?1:3);
         }
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function onOver(param1:MouseEvent) : *
      {
         if(!this.disabled_mc.visible)
         {
            this.bg_mc.gotoAndStop(!!this.check_mc.visible?2:4);
            ExternalInterface.call("PlaySound","UI_Generic_Over");
         }
      }
      
      public function onUp(param1:MouseEvent) : *
      {
         var _loc2_:MovieClip = null;
         if(!this.disabled_mc.visible)
         {
            ExternalInterface.call("PlaySound","UI_Generic_Click");
            this.setState(!this.check_mc.visible);
            (parent as MovieClip).filterRecipes(this.check_mc.visible);
            this.bg_mc.gotoAndStop(!!this.check_mc.visible?2:4);
            if(this.check_mc.visible)
            {
               _loc2_ = (root as MovieClip).craftPanel_mc.recipesPanel_mc.recipes_mc.currentActive;
               if(_loc2_)
               {
                  ExternalInterface.call("selectRecipe",_loc2_.id);
               }
               else
               {
                  (parent as MovieClip).selectFirst();
               }
            }
         }
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
      }
      
      public function onDown(param1:MouseEvent) : *
      {
         if(!this.disabled_mc.visible)
         {
            addEventListener(MouseEvent.MOUSE_UP,this.onUp);
         }
      }
      
      function frame1() : *
      {
         this.base = root as MovieClip;
         addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         this.onDownBool = false;
         this.disabled_mc.visible = false;
         this.disabledTextAlpha = 0.4;
         this.text_txt.autoSize = TextFieldAutoSize.CENTER;
         mouseChildren = false;
      }
   }
}
