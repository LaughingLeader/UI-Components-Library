package msgbox_fla
{
   import LS_Classes.larTween;
   import fl.motion.easing.Quartic;
   import flash.display.MovieClip;
   import flash.external.ExternalInterface;
   
   public dynamic class MainTimeline extends MovieClip
   {
      public var popup_mc:MovieClip;
      
      public var CloseTimeline:larTween;
      
      public var events:Array;
      
      public var layout:String;
      
      public var alignment:String;
      
      public var isOkCancel:Boolean;
      
      public var isShared:Boolean;
      
      public var hasTooltip:Boolean;
      
      public var allowCancel:Boolean;
      
      public var downInput:String;
      
      public var currentDevice:Number;
      
      public const anchorId:String = "msgBox" + Math.random();
      
      public const anchorPos:String = "center";
      
      public const anchorTPos:String = "center";
      
      public const anchorTarget:String = "screen";
      
      public var closeButton_mc:closeButton;

      public var S7_InputText:String = "";

      public function MainTimeline()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onEventResize() : *
      {
         ExternalInterface.call("setPosition","center","screen","center");
      }
      
      public function onEventUp(param1:Number) : Boolean
      {
         var _loc2_:Boolean = false;
         if(this.downInput == this.events[param1])
         {
            this.downInput = "";
            switch(this.events[param1])
            {
               case "IE UITakeAll":
                  if(this.popup_mc.btnList.length == 1 && !this.popup_mc.input_mc.visible)
                  {
                     ExternalInterface.call("ButtonPressed",!!this.isOkCancel?3:1,this.currentDevice);
                     _loc2_ = true;
                  }
                  break;
               case "IE UIAccept":
                  if(this.popup_mc.btnList.length > 0)
                  {
                     if(this.popup_mc.input_mc.visible)
                     {
                        this.popup_mc.input_mc.acceptSave();
                     }
                     ExternalInterface.call("ButtonPressed",!!this.isOkCancel?3:1,this.currentDevice);
                     _loc2_ = true;
                  }
                  break;
               case "IE UIBack":
               case "IE UICancel":
                  if(this.popup_mc.btnList.length > 0 && this.allowCancel)
                  {
                     ExternalInterface.call("ButtonPressed",!!this.isOkCancel?4:2,this.currentDevice);
                     _loc2_ = true;
                  }
                  break;
               case "IE UIPaste":
                  if(this.popup_mc.input_mc.visible)
                  {
                     _loc2_ = true;
                  }
                  break;
               case "IE UICopy":
                  if(this.popup_mc.input_mc.visible)
                  {
                     _loc2_ = true;
                  }
            }
         }
         return _loc2_;
      }
      
      public function onEventDown(param1:Number) : Boolean
      {
         var _loc2_:Boolean = false;
         switch(this.events[param1])
         {
            case "IE UIPaste":
               if(this.popup_mc.input_mc.visible)
               {
                  ExternalInterface.call("pastePressed");
                  _loc2_ = true;
               }
               break;
            case "IE UICopy":
               if(this.popup_mc.input_mc.visible)
               {
                  ExternalInterface.call("copyPressed");
                  _loc2_ = true;
               }
               break;
            default:
               this.downInput = this.events[param1];
               _loc2_ = true;
         }
         return _loc2_;
      }
      
      public function onClose() : *
      {
         ExternalInterface.call("S7_UI_msgBox_Hide");
      }

      public function setWaiting(param1:Boolean) : *
      {
      }
      
      public function setInputDevice(param1:Number) : *
      {
         this.currentDevice = param1;
      }
      
      public function onEventInit() : *
      {
         this.popup_mc.init();
         this.popup_mc.closeButton_mc.init(this.onClose);
         ExternalInterface.call("setPosition","center","screen","center");
      }
      
      public function setAnchor(param1:Number, param2:* = true, param3:String = "msgBox") : *
      {
         this.isShared = true;
         ExternalInterface.call("registerAnchorId",param3 + param1);
         ExternalInterface.call("setAnchor","center","splitscreen","center");
      }
      
      public function hideWin() : void
      {
         this.popup_mc.visible = false;
      }
      
      public function showWin() : void
      {
         this.popup_mc.visible = true;
      }
      
      public function getHeight() : Number
      {
         return this.popup_mc.height;
      }
      
      public function getWidth() : Number
      {
         return this.popup_mc.width;
      }
      
      public function setX(param1:Number) : void
      {
         this.popup_mc.x = param1;
      }
      
      public function setY(param1:Number) : void
      {
         this.popup_mc.y = param1;
      }
      
      public function setPos(param1:Number, param2:Number) : void
      {
         this.popup_mc.x = param1;
         this.popup_mc.y = param2;
      }
      
      public function getX() : Number
      {
         return this.popup_mc.x;
      }
      
      public function getY() : Number
      {
         return this.popup_mc.y;
      }
      
      public function showPopup(param1:String, param2:String) : *
      {
         this.popup_mc.showPopUp(param1,param2);
      }
      
      public function setText(param1:String) : *
      {
         this.popup_mc.setText(param1);
      }
      
	  public function setTitleText(param1:String) : *
      {
         this.popup_mc.title_txt.htmlText = param1;
      }	  
	  
      public function showMsgbox() : *
      {
         this.popup_mc.showMsgbox();
      }
      
      public function setTooltip(param1:Number, param2:String) : *
      {
         if(param1 == 0)
         {
            this.popup_mc.input_mc.paste_mc.tooltip = param2;
         }
         else
         {
            this.popup_mc.input_mc.copy_mc.tooltip = param2;
         }
      }
      
      public function addButton(movieClipID:Number, labelStr:String, sndOnOver:String, sndOnUp:String) : *
      {
         this.popup_mc.addButton(movieClipID,labelStr,sndOnOver,sndOnUp);
         if(movieClipID > 2)
         {
            this.isOkCancel = true;
         }
         else
         {
            this.isOkCancel = false;
         }
         if(movieClipID == 4 || movieClipID == 2)
         {
            this.allowCancel = true;
         }
      }
      
      public function addBlueButton(movieClipID:Number, labelStr:String) : *
      {
         this.popup_mc.addBlueButton(movieClipID,labelStr);
         if(movieClipID > 2)
         {
            this.isOkCancel = true;
         }
         else
         {
            this.isOkCancel = false;
         }
         if(movieClipID == 4 || movieClipID == 2)
         {
            this.allowCancel = true;
         }
      }
      
      public function addNoButton(movieClipID:Number) : *
      {
         this.popup_mc.addNoButton(movieClipID);
         this.isOkCancel = true;
      }
      
      public function addYesButton(movieClipID:Number) : *
      {
         this.popup_mc.addYesButton(movieClipID);
         this.isOkCancel = true;
      }
      
      public function removeButtons() : *
      {
         this.popup_mc.removeButtons();
         this.allowCancel = false;
      }
      
      public function setCopyBtnVisible(visibleBool:Boolean) : *
      {
         this.popup_mc.input_mc.copy_mc.visible = visibleBool;
      }
      
      public function setPasteBtnVisible(visibleBool:Boolean) : *
      {
         this.popup_mc.input_mc.paste_mc.visible = visibleBool;
         // if(this.popup_mc.input_mc.paste_mc.visible)
         // {
         //    this.popup_mc.input_mc.copy_mc.x = 494;
         // }
         // else
         // {
         //    this.popup_mc.input_mc.copy_mc.x = 526;
         // }
      }
      
      public function fadeIn() : *
      {
         this.CloseTimeline = new larTween(this.popup_mc,"alpha",Quartic.easeIn,this.popup_mc.alpha,1,0.8);
      }
      
      public function fadeOut() : *
      {
         this.CloseTimeline = new larTween(this.popup_mc.black_mc,"alpha",Quartic.easeIn,this.popup_mc.alpha,0,0.8);
      }
      
      public function setInputEnabled(visibleBool:Boolean, minChar:Number = 0, maxChar:Number = 46) : *
      {
         this.popup_mc.setInputEnabled(visibleBool,minChar,maxChar);
      }
      
      public function setPopupType(popupTypeNo:Number) : *
      {
         this.popup_mc.setPopupType(popupTypeNo);
      }
      
      public function focusInputEnabled() : *
      {
         stage.focus = this.popup_mc.input_mc.input_txt;
         this.popup_mc.input_mc.input_txt.setSelection(0,this.popup_mc.input_mc.input_txt.text.length);
         if (this.popup_mc.input_mc.input_txt == "Enter your text...") {
            this.popup_mc.input_mc.input_txt = ""
         }
      }
      
      public function setInputText(inputStr:String) : *
      {
         this.popup_mc.input_mc.input_txt.text = inputStr;
         this.popup_mc.input_mc.input_txt.setSelection(0,this.popup_mc.input_mc.input_txt.text.length);
         if (this.popup_mc.input_mc.input_txt == "") {
            this.popup_mc.input_mc.input_txt = "Enter your text..."
         }
      }
      
      public function getInputText() : *
      {
         ExternalInterface.call("inputText",this.popup_mc.input_mc.input_txt.text);
         S7_InputText = this.popup_mc.input_mc.input_txt.text;
      }
      
      public function clearBtnHints() : *
      {
      }
      
      public function addBtnHint() : *
      {
      }
      
      public function switchInputMode(mode:Number): * {
         this.popup_mc.input_mc.gotoAndStop(mode);
      }

      public function switchTextMode(mode:Number): * {
         this.popup_mc.text_mc.gotoAndStop(mode);
      }

      function frame1() : *
      {
         this.events = new Array("IE UIAccept","IE UIBack","IE UICancel","IE UIUp","IE UIDown","IE UIPaste","IE UICopy");
         this.layout = "fitVertical";
         this.alignment = "center";
         this.isOkCancel = true;
         this.isShared = false;
         this.hasTooltip = false;
         this.allowCancel = false;
         this.downInput = "";
         this.currentDevice = -1;
      }
   }
}
