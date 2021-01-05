package containerInventory_fla
{
   import LS_Classes.larTween;
   import fl.motion.easing.Quartic;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.external.ExternalInterface;
   import flash.utils.Timer;
   
   public dynamic class MainTimeline extends MovieClip
   {
       
      
      public var buttonHint_mc:buttonHintBar;
      
      public var inv_mc:MovieClip;
      
      public var tooltipHolder_mc:MovieClip;
      
      public var events:Array;
      
      public var layout:String;
      
      public var alignment:String;
      
      public var itemsUpdateList:Array;
      
      public var isDragging:Boolean;
      
      public var inMultiSelect:Boolean;
      
      public var curTooltip:int;
      
      public var hasTooltip:Boolean;
      
      public var controllerMode:Boolean;
      
      public var uiName:String;
      
      public var playerInventory:Boolean;
      
      public var tooltipTween:larTween;
      
      public const frameW:Number = 1160;
      
      public var tooltip_array:Array;
      
      public var tooltipHandle:Number;
      
      public var TTimer:Timer;
      
      public const tooltipTweenTime:Number = 0.3;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function setUIName(param1:String) : *
      {
         this.uiName = param1;
      }
      
      public function updateItems() : *
      {
         this.inv_mc.updateItems();
      }
      
      public function clearSlots() : *
      {
         this.inv_mc.clearSlots();
      }
      
      public function setButtonTooltip(param1:uint, param2:String) : *
      {
         switch(param1)
         {
            case 0:
               this.inv_mc.close_mc.tooltip = param2;
               break;
            case 1:
               this.inv_mc.takeAll_mc.tooltip = param2;
               break;
            default:
               ExternalInterface.call("UIAssert","ButtonID invalid in \'setButtonTooltip\'");
         }
      }
      
      public function setButtonEnabled(param1:uint, param2:Boolean) : *
      {
         switch(param1)
         {
            case 0:
               this.inv_mc.close_mc.disabled_mc.visible = !param2;
               break;
            case 1:
               this.inv_mc.takeAll_mc.disabled_mc.visible = !param2;
               break;
            default:
               ExternalInterface.call("UIAssert","ButtonID invalid in \'setButtonTooltip\'");
         }
      }
      
      public function onEventInit() : *
      {
         this.tooltip_array = new Array();
         this.tooltipHandle = 0;
         this.init();
         this.inv_mc.init();
         this.inv_mc.updateRows();
         this.buttonHint_mc.centerButtons = true;
         this.tooltipHolder_mc.tooltip_mc.scaleH = false;
      }
      
      public function onEventDown(param1:Number) : *
      {
         var _loc2_:Boolean = false;
         var _loc3_:String = this.events[param1];
         switch(this.events[param1])
         {
            case "IE UIAccept":
               if(this.inMultiSelect)
               {
                  this.inv_mc.setPaintMode(true);
               }
               _loc2_ = true;
               break;
            case "IE UITakeAll":
               _loc2_ = true;
               break;
            case "IE UIUp":
               if(this.controllerMode)
               {
                  this.inv_mc.cellUp();
                  _loc2_ = true;
               }
               break;
            case "IE UIDown":
               if(this.controllerMode)
               {
                  this.inv_mc.cellBottom();
                  _loc2_ = true;
               }
               break;
            case "IE UILeft":
               if(this.controllerMode)
               {
                  this.inv_mc.cellLeft();
                  _loc2_ = true;
               }
               break;
            case "IE UIRight":
               if(this.controllerMode)
               {
                  this.inv_mc.cellRight();
                  _loc2_ = true;
               }
               break;
            case "IE ControllerContextMenu":
               _loc2_ = true;
               break;
            case "IE UITooltipUp":
               this.tooltipHolder_mc.tooltip_mc.scrollUp();
               _loc2_ = true;
               break;
            case "IE UITooltipDown":
               this.tooltipHolder_mc.tooltip_mc.scrollDown();
               _loc2_ = true;
            case "IE ContextMenu":
               _loc2_ = this.inv_mc.onContextMenuInputDown();
         }
         return _loc2_;
      }
      
      public function onEventUp(param1:Number) : *
      {
         var _loc2_:Boolean = false;
         switch(this.events[param1])
         {
            case "IE UITakeAll":
               if(this.controllerMode || !this.inv_mc.takeAll_mc.disabled_mc.visible)
               {
                  this.setMultiselection(false);
                  this.inv_mc.multiSelect_mc.gotoAndStop(33);
                  ExternalInterface.call("takeAll");
               }
               _loc2_ = true;
               break;
            case "IE UICancel":
               if(this.inMultiSelect)
               {
                  this.toggleMultiselection();
               }
               else
               {
                  this.inv_mc.closeUI();
               }
               _loc2_ = true;
               break;
            case "IE UIToggleMultiselection":
               if(!this.inv_mc.pickpocketFrame_mc.visible)
               {
                  this.toggleMultiselection();
               }
               _loc2_ = true;
               break;
            case "IE UIUp":
               _loc2_ = true;
               break;
            case "IE UIDown":
               _loc2_ = true;
               break;
            case "IE UILeft":
               _loc2_ = true;
               break;
            case "IE UIRight":
               _loc2_ = true;
               break;
            case "IE UIAccept":
               if(this.inMultiSelect)
               {
                  this.inv_mc.setPaintMode(false);
               }
               else
               {
                  this.inv_mc.cellAccept();
               }
               _loc2_ = true;
               break;
            case "IE ControllerContextMenu":
               this.inv_mc.cellShowActionMenu();
               _loc2_ = true;
               break;
            case "IE UITooltipUp":
               this.tooltipHolder_mc.tooltip_mc.stopScrolling();
               _loc2_ = true;
               break;
            case "IE UITooltipDown":
               this.tooltipHolder_mc.tooltip_mc.stopScrolling();
               _loc2_ = true;
               break;
            case "IE ContextMenu":
               _loc2_ = this.inv_mc.onContextMenuInputUp();
         }
         return _loc2_;
      }
      
      public function setMultiselection(param1:Boolean) : *
      {
         this.inMultiSelect = param1;
         this.inv_mc.setMultiSelection(this.inMultiSelect);
      }
      
      public function toggleMultiselection() : *
      {
         this.setMultiselection(!this.inMultiSelect);
      }
      
      public function clearMultiselection() : *
      {
         this.inv_mc.clearMultiselection();
      }
      
      public function init() : *
      {
         if(this.controllerMode)
         {
            this.tooltipHolder_mc.visible = true;
            this.buttonHint_mc.visible = true;
            this.inv_mc.close_mc.visible = false;
            this.inv_mc.takeAll_mc.visible = false;
         }
         else
         {
            this.buttonHint_mc.visible = false;
            this.inv_mc.close_mc.visible = true;
            this.inv_mc.takeAll_mc.visible = true;
            this.tooltipHolder_mc.visible = false;
         }
         this.inv_mc._sb = null;
      }
      
      public function setTooltipGroupLabel(param1:Number, param2:String) : *
      {
         this.tooltipHolder_mc.tooltip_mc.setGroupLabel(param1,param2);
      }
      
      public function updateTooltip() : *
      {
         if(this.controllerMode)
         {
            this.tooltipHolder_mc.tooltip_mc.setupTooltip(this.tooltip_array);
            this.showTooltip();
         }
         this.tooltip_array = new Array();
      }
      
      public function clearTooltip() : *
      {
         this.hideTooltip();
      }
      
      public function ShowCellTooltip(param1:Number) : *
      {
         if(param1 != 0)
         {
            this.tooltipHandle = param1;
            this.TTimer.start();
         }
      }
      
      public function SendTooltipRequest(param1:Event) : *
      {
         ExternalInterface.call("itemOver",this.tooltipHandle);
         this.TTimer.reset();
         this.TTimer.stop();
      }
      
      public function setContainerType(param1:Number, param2:String = "") : *
      {
         this.inv_mc.setBgTexture(param2);
         this.inv_mc.setContainerType(param1);
         this.tooltipHolder_mc.tooltip_mc.clear();
         this.tooltipHolder_mc.alpha = 0;
         this.INTSendSize();
      }
      
      public function setAnchor(param1:Number, param2:* = true) : *
      {
         if(this.controllerMode)
         {
            ExternalInterface.call("registeranchorId",this.uiName + param1);
            ExternalInterface.call("setAnchor","center","splitscreen","center");
            if(param2)
            {
               this.tooltipHolder_mc.x = 134;
               this.inv_mc.x = 328;
            }
            else
            {
               this.tooltipHolder_mc.x = 551;
               this.inv_mc.x = 32;
            }
         }
         else
         {
            this.inv_mc.x = 328;
         }
      }
      
      public function INTSendSize() : *
      {
      }
      
      public function setButtonsOnContainer(param1:Boolean) : *
      {
         this.buttonHint_mc.x = Math.round(this.frameW * 0.5);
      }
      
      public function setControllerMode(param1:Boolean) : *
      {
         if(param1 != this.controllerMode)
         {
            this.controllerMode = param1;
            if(this.controllerMode)
            {
               this.buttonHint_mc.visible = true;
               this.inv_mc.close_mc.visible = false;
               this.inv_mc.takeAll_mc.visible = false;
               this.inv_mc.currentHLSlot = 0;
               this.tooltipHolder_mc.visible = true;
            }
            else
            {
               this.buttonHint_mc.visible = false;
               this.inv_mc.close_mc.visible = true;
               this.inv_mc.takeAll_mc.visible = true;
               this.tooltipHolder_mc.visible = false;
               this.INTSendSize();
            }
         }
      }
      
      public function addBtnHint(param1:Number, param2:String, param3:Number) : *
      {
         this.buttonHint_mc.addBtnHint(param1,param2,param3);
      }
      
      public function clearBtnHints() : *
      {
         this.buttonHint_mc.clearBtnHints();
      }
      
      public function setItemUID(param1:String) : *
      {
         ExternalInterface.call("registerAnchorId",this.uiName + param1);
      }
      
      public function onEventTerminate() : *
      {
         this.inv_mc.closeUI();
      }
      
      public function startsWith(param1:String, param2:String) : Boolean
      {
         param1 = param1.toLowerCase();
         param2 = param2.toLowerCase();
         return param2 == param1.substr(0,param2.length);
      }
      
      public function setTakeAllBtnVisible(param1:Boolean) : *
      {
         this.inv_mc.takeAll_mc.visible = param1;
         this.setMultiselection(false);
      }
      
      public function setWeightValueVisible(param1:Boolean) : *
      {
         this.inv_mc.weightValue_mc.visible = param1;
         this.inv_mc.takeAll_mc.visible = !param1;
         this.inv_mc.valueBar_mc.visible = false;
         this.inv_mc.weightBar_mc.visible = false;
         this.inv_mc.pickpocketFrame_mc.visible = false;
      }
      
      public function setWeightValueBarsVisible(param1:Boolean) : *
      {
         this.inv_mc.valueBar_mc.visible = param1;
         this.inv_mc.weightBar_mc.visible = param1;
         this.inv_mc.weightValue_mc.visible = false;
         this.inv_mc.takeAll_mc.visible = !param1;
         this.inv_mc.pickpocketFrame_mc.visible = param1;
         this.inv_mc.barsBg_mc.visible = param1;
      }
      
      public function setWeightValueBars(param1:Number, param2:Number, param3:String, param4:String, param5:uint = 7870100, param6:uint = 7870100) : *
      {
         this.inv_mc.pickpocketFrame_mc.weightBox_mc.tooltip = param3;
         this.inv_mc.pickpocketFrame_mc.valueBox_mc.tooltip = param4;
         this.inv_mc.valueBar_mc.scaleX = Math.min(1,param2);
         this.inv_mc.weightBar_mc.scaleX = Math.min(1,param1);
         this.inv_mc.valueBar_mc.setBarColour(param6);
         this.inv_mc.weightBar_mc.setBarColour(param5);
      }
      
      public function setWeightValueText(param1:String, param2:String, param3:String, param4:String) : *
      {
         this.inv_mc.weightValue_mc.goldText_mc.text_txt.htmlText = param2;
         this.inv_mc.weightValue_mc.weightText_mc.text_txt.htmlText = param1;
         this.inv_mc.weightValue_mc.goldText_mc.tooltip = param4;
         this.inv_mc.weightValue_mc.weightText_mc.tooltip = param3;
      }
      
      public function selectSlot(param1:Number) : *
      {
         this.inv_mc.selectSlot(param1);
      }
      
      public function hideTooltip() : *
      {
         if(this.tooltipHolder_mc.tweening)
         {
            this.tooltipTween.stop();
         }
         this.tooltipHolder_mc.tweening = true;
         this.tooltipTween = new larTween(this.tooltipHolder_mc,"alpha",Quartic.easeOut,NaN,0,this.tooltipTweenTime,this.tooltipTweenDone,null,0.01);
      }
      
      public function showTooltip() : *
      {
         if(this.tooltipHolder_mc.tweening)
         {
            this.tooltipTween.stop();
         }
         this.tooltipHolder_mc.tweening = true;
         this.tooltipTween = new larTween(this.tooltipHolder_mc,"alpha",Quartic.easeOut,NaN,1,this.tooltipTweenTime,this.tooltipTweenDone,null,0.01);
      }
      
      public function tooltipTweenDone() : *
      {
         this.tooltipHolder_mc.tweening = false;
      }
      
      public function setPlayerInventory(param1:Boolean) : *
      {
         this.playerInventory = param1;
         if(!this.controllerMode)
         {
            this.inv_mc.takeAll_mc.visible = !param1;
         }
      }
      
      function frame1() : *
      {
         this.events = new Array("IE UIUp","IE UIDown","IE UILeft","IE UIRight","IE UITakeAll","IE UICancel","IE UIAccept","IE ControllerContextMenu","IE UITooltipUp","IE UITooltipDown","IE ContextMenu","IE UIToggleMultiselection");
         this.layout = "fixed";
         this.alignment = "none";
         this.itemsUpdateList = new Array();
         this.isDragging = false;
         this.inMultiSelect = false;
         this.curTooltip = -1;
         this.hasTooltip = false;
         this.controllerMode = false;
         this.uiName = "container";
         this.playerInventory = false;
         this.TTimer = new Timer(10,1);
         this.TTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.SendTooltipRequest);
         this.TTimer.stop();
      }
   }
}
