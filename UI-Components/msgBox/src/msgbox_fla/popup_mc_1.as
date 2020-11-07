package msgbox_fla
{
   import LS_Classes.listDisplay;
   import LS_Classes.textEffect;
   import LS_Classes.textHelpers;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   import flash.text.TextField;

   public dynamic class popup_mc_1 extends MovieClip
   {
       
      
      public var bg_mc:MovieClip;
      
      public var cButtons_mc:MovieClip;
      
      public var input_mc:MovieClip;
      
      public var text_mc:MovieClip;
      
      public var title_txt:TextField;
      
      public var btnList:listDisplay;

      public var factor:Number;
      
      public var posDis:Number;
      
      public const textOffset:Number = 105;
      
      public var iconId:Number;
      
      public var shownIcon:int;

      public var popupType:Number;
      
      public function popup_mc_1()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init() : *
      {
         this.visible = false;
         this.input_mc.paste_mc.visible = false;
         this.input_mc.copy_mc.visible = false;
         this.input_mc.visible = false;
         this.text_mc.filters = textEffect.createStrokeFilter(0,1.2,0.75,1,3);
      }
      
      public function setPopupType(param1:Number) : *
      {
         this.iconId = param1;
         this.bg_mc.gotoAndStop(param1);
         popupType = param1
         this.INT_SetTextPosition();
      }
      
      public function setInputEnabled(param1:Boolean, param2:Number, param3:Number) : *
      {
         this.input_mc.input_txt.maxChars = param3;
         this.input_mc.visible = param1;

         // Commenting out the separate layouts. Will figure out new positions later.

         // if(param1)
         // {
         //    this.posDis = 30;
         //    this.setPopupType(3);
         // }
         // else
         // {
         //    this.posDis = 70;
         //    this.setPopupType(1);
         // }

         // Commenting out restrictions to text.

         // if(param2 == 0)
         // {
         //    this.input_mc.input_txt.restrict = "^<>\\\\/`´\',.:;|$€%#£+&*?\"";
         // }
         // else
         // {
         //    this.input_mc.input_txt.restrict = "^<>";
         // }
         
         this.INT_SetTextPosition();
      }
      
      public function showPopUp(param1:String, param2:String) : *
      {
         this.title_txt.htmlText = param1;
         textHelpers.smallCaps(this.title_txt,7,true);
         this.setText(param2);
         this.INT_SetTextPosition();
      }
      
      public function setText(param1:String) : *
      {
         this.text_mc.text_txt.htmlText = param1;
         if(this.text_mc.sb)
         {
            this.text_mc.sb.scrollbarVisible();
            this.text_mc.sb.resetHandle();
         }
         this.INT_SetTextPosition();
      }
      
      // Created setTitleText
	  public function setTitleText(param1:String) : * {
		  this.title_txt.htmlText = param1;
		  textHelpers.smallCaps(this.title_txt,7,true);
        this.INT_SetTextPosition();
	  }
	  
      public function INT_SetTextPosition() : *
      {
         // Commenting out positional layouts. Will figure this out later.

         // var _loc3_:Number = NaN;
         // var _loc4_:Number = NaN;
         // var _loc1_:Number = this.posDis;
         // if(this.title_txt.text == "")
         // {
         //    _loc1_ = _loc1_ + 30;
         // }
         // var _loc2_:Number = this.text_mc.text_txt.textHeight;
         // if(_loc2_ > this.text_mc.text_txt.height)
         // {
         //    _loc2_ = this.text_mc.text_txt.height;
         // }
         // this.text_mc.y = this.cButtons_mc.y - _loc1_ - Math.round(_loc2_ * 0.5);
         // if(this.title_txt.text != "")
         // {
         //    if(this.iconId == 3)
         //    {
         //       this.title_txt.y = this.input_mc.y - this.title_txt.textHeight - 8;
         //    }
         //    else
         //    {
         //       _loc3_ = 102;
         //       _loc4_ = 50;
         //       if(this.text_mc.y < _loc3_ + this.title_txt.textHeight)
         //       {
         //          this.title_txt.y = Math.round(this.text_mc.y - this.title_txt.textHeight);
         //          if(this.title_txt.y < _loc4_)
         //          {
         //             this.title_txt.y = _loc4_;
         //          }
         //       }
         //    }
         // }

         // MANUALLY POSITIONING ELEMENTS -- Redo This in LUA if possible

         var _loc1_:Number = this.height/2;
         var _loc2_:Number = (this.title_txt.height + this.text_mc.height + this.input_mc.height + 20)/2;
         var _loc3_:Number = _loc1_ - _loc2_;

         if (this.input_mc.visible) {
            _loc3_ = -47;
         }

         this.title_txt.y = _loc3_;
         this.text_mc.y = _loc3_ + this.title_txt.height + 10;
         this.input_mc.y = _loc3_ + this.title_txt.height + this.text_mc.height + 20;
      }
      
      public function onEF(param1:Event) : *
      {
         removeEventListener(Event.ENTER_FRAME,this.onEF);
      }
      
      public function showMsgbox() : *
      {
         var _loc1_:Boolean = true;
         if(this.visible && this.shownIcon != this.iconId)
         {
            if(this.shownIcon == this.iconId)
            {
               _loc1_ = false;
            }
            else
            {
               removeEventListener(Event.ENTER_FRAME,this.onEF);
            }
         }
         if(_loc1_)
         {
            ExternalInterface.call("PlaySound","UI_Generic_Back");
            addEventListener(Event.ENTER_FRAME,this.onEF);
         }
         this.shownIcon = this.iconId;
         this.visible = true;
         this.INT_SetTextPosition();
      }

      public function addButton(param1:Number, param2:String, param3:String, param4:String) : *
      {
         var _loc5_:MovieClip = null;
         if(this.btnList.length > 0)
         {
            _loc5_ = new btnB_id();
         }
         else
         {
            _loc5_ = new btnA_id();
         }
         _loc5_.label_mc.filters = textEffect.createStrokeFilter(0,1.2,0.75,1,3);
         _loc5_.label_mc.label_txt.htmlText = param2.toUpperCase();
         this.INTaddButton(_loc5_,param1);
         if(param3 != "")
         {
            _loc5_.snd_OnOver = param3;
         }
         if(param4 != "")
         {
            _loc5_.snd_OnUp = param4;
         }
         else
         {
            _loc5_.snd_OnUp = "UI_Gen_BigButton_Click";
         }
      }
      
      public function addBlueButton(param1:Number, param2:String) : *
      {
         var _loc3_:MovieClip = new btnB_id();
         _loc3_.label_mc.filters = textEffect.createStrokeFilter(0,1.2,0.75,1,3);
         _loc3_.label_mc.label_txt.htmlText = param2.toUpperCase();
         this.INTaddButton(_loc3_,param1);
      }
      
      public function addYesButton(param1:Number) : *
      {
         var _loc2_:MovieClip = new btnYes_id();
         this.INTaddButton(_loc2_,param1);
      }
      
      public function addNoButton(param1:Number) : *
      {
         var _loc2_:MovieClip = new btnNo_id();
         this.INTaddButton(_loc2_,param1);
      }
      
      public function INTaddButton(param1:MovieClip, param2:Number) : *
      {
         param1.id = param2;
         param1.bg_mc.gotoAndStop(1);
         param1.x = -param1.width * 0.5;
         this.btnList.addElement(param1);
         this.cButtons_mc.y = 347 - this.btnList.height;

         // There is functionally no difference between 1 and 2 as far as I can tell.

         // if(!this.input_mc.visible)
         // {
         //    if(this.btnList.length > 1)
         //    {
         //       this.setPopupType(2);
         //    }
         //    else
         //    {
         //       this.setPopupType(1);
         //    }
         // }
         this.INT_SetTextPosition();
      }
      
      public function removeButtons() : *
      {
         this.btnList.clearElements();
         this.INT_SetTextPosition();
      }
      
      function frame1() : *
      {
         this.btnList = new listDisplay();
         this.cButtons_mc.addChild(this.btnList);
         this.factor = 0.1;
         this.posDis = 70;
         this.iconId = 0;
         this.shownIcon = -1;
      }
   }
}
