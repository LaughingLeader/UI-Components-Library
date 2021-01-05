package LS_Classes
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class LSButton extends MovieClip
   {
       
      
      private var pressedFunc:Function;
      
      public var onOverFunc:Function;
      
      public var onOutFunc:Function;
      
      public var onUpFunc:Function;
      
      public var onDownFunc:Function;
      
      public var onOverParams:Object = null;
      
      public var onOutParams:Object = null;
      
      public var onDownParams:Object = null;
      
      private var pressedParams:Object;
      
      private var textY:Number;
      
      public var tooltip:String;
      
      public var hoverSound:String;
      
      public var clickSound:String;
      
      public var textNormalAlpha:Number = 1;
      
      public var textClickAlpha:Number = 1;
      
      public var textDisabledAlpha:Number = 0.5;
      
      public var text_txt:TextField = null;
      
      public var bg_mc:MovieClip;
      
      public var disabled_mc:MovieClip;
      
      public var SND_Over:String = "UI_Generic_Over";
      
      public var SND_Click:String = "UI_Gen_XButton_Click";
      
      public function LSButton()
      {
         super();
         if(this.text_txt)
         {
            this.text_txt.mouseEnabled = false;
            this.text_txt.alpha = this.textNormalAlpha;
         }
         addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         addEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
         addEventListener(MouseEvent.ROLL_OVER,this.onMouseOver);
      }
      
      public function init(param1:Function, param2:Object = null, param3:Boolean = false) : *
      {
         this.pressedFunc = param1;
         if(param2)
         {
            this.pressedParams = param2;
         }
         if(this.disabled_mc)
         {
            this.disabled_mc.visible = param3;
         }
      }
      
      public function initialize(param1:String, param2:Function, param3:Object = null, param4:Number = -1, param5:Boolean = false) : *
      {
         this.setText(param1,param4);
         this.pressedFunc = param2;
         if(param3)
         {
            this.pressedParams = param3;
         }
         if(this.disabled_mc)
         {
            this.disabled_mc.visible = param5;
         }
      }
      
      public function setText(param1:String, param2:Number = -1) : *
      {
         var _loc3_:TextFormat = null;
         if(this.text_txt)
         {
            if(param2 != -1)
            {
               _loc3_ = this.text_txt.defaultTextFormat;
               _loc3_.size = param2;
               this.text_txt.defaultTextFormat = _loc3_;
            }
            this.text_txt.htmlText = param1;
            this.textY = this.text_txt.y;
         }
      }
      
      public function setEnabled(param1:Boolean) : *
      {
         if(this.disabled_mc)
         {
            this.disabled_mc.visible = !param1;
         }
         if(this.text_txt)
         {
            this.text_txt.alpha = !!param1?Number(this.textNormalAlpha):Number(this.textDisabledAlpha);
         }
      }
      
      public function onMouseOver(param1:MouseEvent) : *
      {
         if(this.tooltip != null)
         {
            ExternalInterface.call("showTooltip",this.tooltip);
         }
         if(!this.disabled_mc || !this.disabled_mc.visible)
         {
            if(this.SND_Over != null)
            {
               ExternalInterface.call("PlaySound",this.SND_Over);
            }
            if(this.text_txt)
            {
               this.text_txt.alpha = this.textClickAlpha;
            }
            this.bg_mc.gotoAndStop(2);
            if(this.onOverFunc != null)
            {
               if(this.onOverParams == null)
               {
                  this.onOverFunc();
               }
               else
               {
                  this.onOverFunc(this.onOverParams);
               }
            }
         }
      }
      
      public function onMouseOut(param1:MouseEvent) : *
      {
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         if(this.tooltip != null)
         {
            ExternalInterface.call("hideTooltip");
         }
         this.bg_mc.gotoAndStop(1);
         if(this.onOutFunc != null)
         {
            if(this.onOutParams == null)
            {
               this.onOutFunc();
            }
            else
            {
               this.onOutFunc(this.onOutParams);
            }
         }
         if(this.text_txt && (!this.disabled_mc || !this.disabled_mc.visible))
         {
            this.text_txt.alpha = this.textNormalAlpha;
            this.text_txt.y = this.textY;
         }
      }
      
      private function onDown(param1:MouseEvent) : *
      {
         if(!this.disabled_mc || !this.disabled_mc.visible)
         {
            addEventListener(MouseEvent.MOUSE_UP,this.onUp);
            this.bg_mc.gotoAndStop(3);
            if(this.onDownFunc != null)
            {
               if(this.onDownParams == null)
               {
                  this.onDownFunc();
               }
               else
               {
                  this.onDownFunc(this.onDownParams);
               }
            }
            if(this.text_txt)
            {
               this.text_txt.y = this.textY + 2;
            }
         }
      }
      
      private function onUp(param1:MouseEvent) : *
      {
         removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.bg_mc.gotoAndStop(2);
         if(this.SND_Click != null)
         {
            ExternalInterface.call("PlaySound",this.SND_Click);
         }
         if(this.onUpFunc != null)
         {
            this.onUpFunc();
         }
         if(this.text_txt)
         {
            this.text_txt.y = this.textY;
         }
         if(this.pressedFunc != null)
         {
            if(this.pressedParams != null)
            {
               this.pressedFunc(this.pressedParams);
            }
            else
            {
               this.pressedFunc();
            }
         }
      }
   }
}
