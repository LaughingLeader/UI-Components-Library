package uiCraft_fla
{
   import LS_Classes.horizontalList;
   import LS_Classes.larTween;
   import LS_Classes.scrollListGrouped;
   import LS_Classes.tooltipHelper;
   import fl.motion.easing.Linear;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   
   public dynamic class recipesPanel_4 extends MovieClip
   {
       
      
      public var amount_txt:TextField;
      
      public var bg_mc:MovieClip;
      
      public var button_mc:smallRedBtn;
      
      public var cancelBtn_mc:cancelSearchBtn;
      
      public var container_mc:MovieClip;
      
      public var craftResultBG_mc:MovieClip;
      
      public var decoration_mc:MovieClip;
      
      public var filterAmHl_mc:MovieClip;
      
      public var filterHl_mc:MovieClip;
      
      public var filterName_txt:TextField;
      
      public var ingredients_mc:MovieClip;
      
      public var min_mc:minusBtn;
      
      public var name_txt:TextField;
      
      public var plus_mc:plusBtn;
      
      public var progressBar_mc:MovieClip;
      
      public var resultIconHolder_mc:MovieClip;
      
      public var searchBtn_mc:searchBtn;
      
      public var station_mc:MovieClip;
      
      public var view_mc:MovieClip;
      
      public const elemSpacing:Number = 31;
      
      public var recipeList:scrollListGrouped;
      
      public var decoList:horizontalList;
      
      public var craftAmount:Number;
      
      public var craftMaxAmount:Number;
      
      public const defaultCellAmountColour:uint = 16777215;
      
      public const depletedCellAmountColour:uint = 10354688;
      
      public var decoAm:Number;
      
      public var base:MovieClip;
      
      public var resultTooltipVisible:Boolean;
      
      public const resetUITime:Number = 0.05;
      
      public const fadeBarTime:Number = 0.05;
      
      public var progressBarLength:Number;
      
      public var tweenProgressVar:larTween;
      
      public var overButton:Boolean;
      
      public var animationBusy:Boolean;
      
      public var recipes_mc:MovieClip;
      
      public function recipesPanel_4()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function showResultTooltip() : *
      {
         this.base.curTooltip = -3;
         tooltipHelper.ShowTooltipForMC(this.resultIconHolder_mc,root,"right");
      }
      
      public function hideResultTooltip() : *
      {
         ExternalInterface.call("hideTooltip");
      }
      
      public function onEventInit() : *
      {
         this.cancelBtn_mc.init(this.cancelPressed);
         this.searchBtn_mc.init(this.searchPressed);
         this.cancelBtn_mc.visible = false;
         this.filterAmHl_mc.visible = false;
         this.filterHl_mc.visible = false;
         this.amount_txt.restrict = "0-9";
         this.filterName_txt.text = "";
         this.filterName_txt.addEventListener(FocusEvent.FOCUS_OUT,this.inputFocusLostCallback);
         this.filterName_txt.addEventListener(FocusEvent.FOCUS_IN,this.inputFocusCallback);
         this.filterName_txt.addEventListener(Event.CHANGE,this.onTextChange);
         this.amount_txt.addEventListener(FocusEvent.FOCUS_OUT,this.inputAmFocusLostCallback);
         this.amount_txt.addEventListener(FocusEvent.FOCUS_IN,this.inputAmFocusCallback);
         this.button_mc.init(this.buttonPressed);
         this.craftMaxAmount = 0;
         this.plus_mc.init(this.onPlusClicked);
         this.min_mc.init(this.onMinClicked);
         this.progressBar_mc.alpha = 0;
         this.updateProgress(0);
         this.button_mc.gotoAndStop(1);
         this.animationBusy = false;
         this.recipes_mc = (root as MovieClip).craftPanel_mc.recipesPanel_mc.recipeList.container_mc;
         this.ingredients_mc.init(true);
         this.setCraftEnabled(false);
         this.station_mc.visible = false;
      }
      
      public function updateDecoration() : *
      {
         var _loc1_:Number = NaN;
         var _loc2_:uint = 0;
         var _loc3_:Number = NaN;
         var _loc4_:MovieClip = null;
         var _loc5_:MovieClip = null;
         if(this.decoList && this.ingredients_mc.ingrList.length != this.decoAm)
         {
            this.decoList.clearElements();
            _loc1_ = 0;
            if(this.ingredients_mc.ingrList.length > 1)
            {
               _loc3_ = 16;
               _loc1_ = this.ingredients_mc.ingrList.getAt(1).x - this.ingredients_mc.ingrList.getAt(0).x - this.ingredients_mc.ingrList.getAt(0).width * 0.5 + _loc3_;
            }
            _loc2_ = 0;
            while(_loc2_ < this.ingredients_mc.ingrList.length)
            {
               if(_loc2_ != 0)
               {
                  _loc5_ = new DecoLine();
                  _loc5_.width = _loc1_;
                  this.decoList.addElement(_loc5_,false);
               }
               _loc4_ = new DecoRose();
               _loc4_.widthOverride = 14;
               this.decoList.addElement(_loc4_,false);
               _loc2_++;
            }
            this.decoList.positionElements();
         }
      }
      
      public function cancelPressed() : *
      {
         this.filterName_txt.text = "";
         stage.focus = null;
         this.checkCancelBtn();
      }
      
      public function searchPressed() : *
      {
         stage.focus = this.filterName_txt;
      }
      
      public function filterOnName() : *
      {
         var _loc3_:MovieClip = null;
         var _loc1_:MovieClip = root as MovieClip;
         _loc1_.makeSound = false;
         this.recipeList.unCollapseAll();
         _loc1_.makeSound = true;
         var _loc2_:uint = 0;
         while(_loc2_ < this.recipeList.content_array.length)
         {
            _loc3_ = this.recipeList.content_array[_loc2_];
            if(_loc3_)
            {
               if(!this.filterName_txt.text || this.filterName_txt.text == "")
               {
                  _loc3_.list.filterShowAll();
                  this.filterRecipes(this.view_mc.check_mc.visible);
               }
               else
               {
                  _loc3_.list.filterShowAll();
                  _loc3_.list.filterBySubString("labelStr",this.filterName_txt.text);
               }
            }
            _loc2_++;
         }
         this.recipeList.positionElements();
      }
      
      public function inputFocusCallback(param1:FocusEvent) : *
      {
         this.filterName_txt.setSelection(0,this.filterName_txt.text.length);
         ExternalInterface.call("inputFocus");
         this.filterHl_mc.visible = true;
         stage.focus = this.filterName_txt;
      }
      
      public function checkCancelBtn() : *
      {
         this.cancelBtn_mc.visible = Boolean(this.filterName_txt.text != "");
      }
      
      public function inputFocusLostCallback(param1:FocusEvent) : *
      {
         this.cancelBtn_mc.visible = false;
         this.filterOnName();
         ExternalInterface.call("inputFocusLost");
         this.filterHl_mc.visible = false;
      }
      
      public function inputAmFocusCallback(param1:FocusEvent) : *
      {
         if(this.amount_txt.type == TextFieldType.DYNAMIC)
         {
            stage.focus = null;
         }
         else
         {
            stage.focus = this.amount_txt;
            this.amount_txt.setSelection(0,this.amount_txt.text.length);
            ExternalInterface.call("inputFocus");
            this.filterAmHl_mc.visible = true;
         }
      }
      
      public function inputAmFocusLostCallback(param1:FocusEvent) : *
      {
         this.filterAmHl_mc.visible = false;
         ExternalInterface.call("inputFocusLost");
         var _loc2_:Number = parseInt(this.amount_txt.text);
         if(isNaN(_loc2_))
         {
            _loc2_ = 0;
         }
         if(_loc2_ > this.craftMaxAmount)
         {
            _loc2_ = this.craftMaxAmount;
         }
         this.setCraftAmount(_loc2_);
      }
      
      public function onTextChange(param1:Event) : *
      {
         this.filterOnName();
         this.checkCancelBtn();
      }
      
      public function setMaxCraftAmount(param1:Number) : *
      {
         this.craftMaxAmount = param1;
         if(param1 > 0)
         {
            this.setCraftAmount(1);
            this.setCraftEnabled(true);
            this.amount_txt.textColor = this.defaultCellAmountColour;
         }
         else
         {
            this.setCraftAmount(0);
            this.setCraftEnabled(false);
            this.amount_txt.textColor = this.depletedCellAmountColour;
         }
      }
      
      public function filterRecipes(param1:Boolean) : *
      {
         var _loc3_:MovieClip = null;
         var _loc2_:uint = 0;
         while(_loc2_ < this.recipeList.content_array.length)
         {
            _loc3_ = this.recipeList.content_array[_loc2_];
            if(_loc3_)
            {
               if(param1)
               {
                  _loc3_.list.filterShowType("val",0,false);
               }
               else
               {
                  _loc3_.list.filterHideType("val",0);
               }
            }
            _loc2_++;
         }
         this.recipeList.positionElements();
      }
      
      public function setCraftEnabled(param1:Boolean) : *
      {
         var _loc2_:* = this.craftMaxAmount > 1;
         if(_loc2_)
         {
            this.amount_txt.type = TextFieldType.INPUT;
         }
         else
         {
            this.amount_txt.type = TextFieldType.DYNAMIC;
         }
         this.amount_txt.selectable = _loc2_;
         this.button_mc.setEnabled(param1);
         this.min_mc.setEnabled(_loc2_);
         this.plus_mc.setEnabled(_loc2_);
      }
      
      public function setCraftAmount(param1:Number) : *
      {
         if(param1 <= this.craftMaxAmount && param1 >= 0)
         {
            this.craftAmount = param1;
            this.amount_txt.text = this.craftAmount + "";
         }
      }
      
      public function setRecipeAmount(param1:Number, param2:Number, param3:String) : *
      {
         var _loc4_:MovieClip = this.getRecipe(param1,param2);
         if(_loc4_)
         {
            _loc4_.val = param3;
            _loc4_.updateLabel();
         }
      }
      
      public function addRecipe(param1:Number, param2:Number, param3:String, param4:String, param5:Number, param6:Boolean) : *
      {
         var _loc8_:MovieClip = null;
         var _loc7_:MovieClip = this.getRecipe(param1,param2);
         if(!_loc7_)
         {
            _loc7_ = new Recipe();
            _loc7_.elemSpacing = this.elemSpacing;
            _loc7_.recipeId = param2;
            _loc8_ = this.recipeList.addGroupElement(param1,_loc7_,false);
            _loc8_.visible = true;
            _loc8_.elemSpacing = this.elemSpacing;
            _loc7_.isRecipe = true;
            _loc7_.id = param2;
            _loc7_.group = _loc8_;
            _loc7_.label_txt.autoSize = TextFieldAutoSize.LEFT;
            _loc7_.onActivate = this.recipeActivate;
            _loc7_.init();
         }
         _loc7_.tooltipStr = param4;
         _loc7_.setName(param3);
         _loc7_.textStr = _loc7_.label_txt.text;
         _loc7_.val = param5;
         _loc7_.dirty = false;
         _loc7_.isNew = param6;
         _loc7_.updateLabel();
         if(param5 == 0 && !this.view_mc.check_mc.visible)
         {
            _loc7_.visible = false;
         }
         else
         {
            _loc7_.visible = true;
         }
      }
      
      public function recipeActivate() : *
      {
         this.button_mc.setEnabled(!this.animationBusy);
      }
      
      public function removeOldRecipes() : *
      {
         var _loc2_:MovieClip = null;
         var _loc3_:uint = 0;
         var _loc4_:MovieClip = null;
         var _loc1_:uint = 0;
         while(_loc1_ < this.recipeList.content_array.length)
         {
            _loc2_ = this.recipeList.content_array[_loc1_];
            if(_loc2_)
            {
               _loc3_ = 0;
               while(_loc3_ < _loc2_.list.size)
               {
                  _loc4_ = _loc2_.list.content_array[_loc3_];
                  if(_loc4_)
                  {
                     if(!_loc4_.dirty)
                     {
                        _loc4_.dirty = true;
                        _loc3_++;
                     }
                     else
                     {
                        _loc2_.list.removeElement(_loc3_,false);
                     }
                  }
                  else
                  {
                     _loc3_++;
                  }
               }
               if(_loc2_.list.size == 0)
               {
                  _loc2_.visible = false;
               }
            }
            _loc1_++;
         }
         this.refreshPos();
         if(this.visible)
         {
            this.selectFirst();
         }
      }
      
      public function getRecipe(param1:Number, param2:Number) : MovieClip
      {
         var _loc3_:MovieClip = this.recipeList.getElementByNumber("groupId",param1);
         if(_loc3_)
         {
            return _loc3_.list.getElementByNumber("recipeId",param2);
         }
         return null;
      }
      
      public function addRecipeGroup(param1:Number, param2:String) : *
      {
         var _loc3_:MovieClip = this.recipeList.addGroup(param1,param2.toUpperCase(),false);
         if(_loc3_)
         {
            _loc3_.elemSpacing = this.elemSpacing;
            _loc3_.init();
            _loc3_.gName = param2;
            _loc3_.list.EL_SPACING = 0;
            _loc3_.list.TOP_SPACING = 0;
            _loc3_.title_txt.autoSize = TextFieldAutoSize.LEFT;
            _loc3_.visible = false;
         }
      }
      
      public function removeRecipes() : *
      {
         this.recipeList.clearGroupElements();
      }
      
      public function selectRecipe(param1:Number) : *
      {
         var _loc2_:MovieClip = this.recipeList.getElementByNumber("id",param1);
         if(_loc2_)
         {
            this.recipeList.selectMC(_loc2_);
            this.refreshPos();
         }
      }
      
      public function clearSelection() : *
      {
         this.recipeList.clearSelection();
      }
      
      public function refreshPos() : *
      {
         this.recipeList.positionElements();
      }
      
      public function getCurrentElement() : MovieClip
      {
         return this.recipeList.getCurrentMovieClip();
      }
      
      public function onPlusClicked(param1:MouseEvent) : *
      {
         var _loc2_:Number = this.craftAmount + 1;
         if(_loc2_ > this.craftMaxAmount)
         {
            _loc2_ = 1;
         }
         this.setCraftAmount(_loc2_);
      }
      
      public function onMinClicked(param1:MouseEvent) : *
      {
         var _loc2_:Number = this.craftAmount - 1;
         if(_loc2_ < 1)
         {
            _loc2_ = this.craftMaxAmount;
         }
         this.setCraftAmount(_loc2_);
      }
      
      public function selectFirst() : *
      {
         var _loc4_:MovieClip = null;
         var _loc1_:MovieClip = null;
         var _loc2_:Boolean = false;
         var _loc3_:uint = 0;
         while(_loc3_ < this.recipeList.size && !_loc1_)
         {
            _loc1_ = this.recipeList.content_array[_loc3_];
            if(_loc1_ && (!_loc1_.visible || _loc1_.list.size == 0))
            {
               _loc1_ = null;
            }
            _loc3_++;
         }
         if(_loc1_)
         {
            if(!_loc1_._isOpen)
            {
               _loc1_.toggleOpenClose();
            }
            _loc4_ = _loc1_.list.getFirstElement(true,true);
            if(_loc4_)
            {
               this.recipeList.selectMC(this.group);
               _loc1_.deselectElement();
               _loc1_.list.selectMC(_loc4_,true);
               _loc4_.activate();
               _loc2_ = true;
            }
         }
         if(!_loc2_)
         {
            ExternalInterface.call("selectRecipe",-1);
         }
      }
      
      public function canCraft() : *
      {
         if(this.ingredients_mc.getCount() > 1)
         {
            return true;
         }
         if(this.ingredients_mc.getCount() == 1 && this.station_mc.visible)
         {
            return true;
         }
         return false;
      }
      
      public function setIngredient(param1:Number, param2:Number, param3:String, param4:Number, param5:Boolean) : *
      {
         this.ingredients_mc.setRecipeIngredient(param1,param2,param3,param4,param5);
      }
      
      public function cursorLeft() : *
      {
      }
      
      public function cursorRight() : *
      {
      }
      
      public function cursorUp() : *
      {
         this.recipeList.previous();
      }
      
      public function cursorDown() : *
      {
         this.recipeList.next();
      }
      
      public function setOverCategory(param1:Boolean) : *
      {
      }
      
      public function cursorAccept() : *
      {
         var _loc1_:MovieClip = this.getCurrentElement();
         if(_loc1_)
         {
            if(_loc1_.toggleOpenClose)
            {
               _loc1_.toggleOpenClose();
            }
            else if(!_loc1_.list && !_loc1_.isActive)
            {
               _loc1_.activate();
            }
            else if(!this.animationBusy)
            {
               if(_loc1_.val != 0)
               {
                  this.pressButton();
               }
               else
               {
                  ExternalInterface.call("PlaySound","UI_Barter_NotEnoughMoney");
               }
            }
         }
      }
      
      public function cursorShowActionMenu() : Boolean
      {
         return false;
      }
      
      public function startCraft() : *
      {
         this.startAnim();
      }
      
      public function cursorCancel() : Boolean
      {
         if(this.animationBusy)
         {
            this.cancelAnim();
            return true;
         }
         return false;
      }
      
      public function setResult(param1:String) : *
      {
         this.name_txt.htmlText = param1;
         this.name_txt.y = Math.round(795 - this.name_txt.textHeight * 0.5);
         this.resultIconHolder_mc.tooltip = param1;
      }
      
      public function collapseAll() : *
      {
         this.recipeList.collapseAll(true);
      }
      
      public function unCollapseAll() : *
      {
         this.recipeList.unCollapseAll(true);
      }
      
      public function resultOnMouseOver(param1:* = null) : *
      {
         if(!this.resultTooltipVisible)
         {
            this.resultTooltipVisible = true;
         }
      }
      
      public function resultOnMouseOut(param1:* = null) : *
      {
         if(this.resultTooltipVisible)
         {
            ExternalInterface.call("hideTooltip");
            this.resultTooltipVisible = false;
         }
      }
      
      public function startAnim() : *
      {
         this.resetAnim();
         this.animationBusy = true;
         this.overButton = false;
         this.tweenProgressVar = new larTween(this.progressBar_mc,"alpha",Linear.easeNone,this.progressBar_mc.alpha,1,0.05);
         this.button_mc.visible = false;
      }
      
      public function showResult() : *
      {
         this.stepFour();
      }
      
      public function resetAnim() : *
      {
         this.tweenProgressVar = this.stopTween(this.tweenProgressVar);
         this.updateProgress(0);
         this.progressBar_mc.alpha = 0;
         this.showButton();
         this.animationBusy = false;
      }
      
      public function cancelAnim(param1:TimerEvent = null) : *
      {
         this.tweenProgressVar = this.stopTween(this.tweenProgressVar);
         this.tweenProgressVar = new larTween(this.progressBar_mc,"alpha",Linear.easeNone,this.progressBar_mc.alpha,0,this.resetUITime,this.showButton);
         this.updateProgress(0);
         this.animationBusy = false;
         ExternalInterface.call("resetRecipesUI");
      }
      
      public function showButton() : *
      {
         this.button_mc.visible = true;
         this.button_mc.setEnabled(this.craftMaxAmount > 0);
      }
      
      public function stepFour() : *
      {
         this.tweenProgressVar = new larTween(this.progressBar_mc,"alpha",Linear.easeNone,this.progressBar_mc.alpha,0,this.fadeBarTime,this.stepFive);
      }
      
      public function stepFive() : *
      {
         this.showButton();
         this.animationBusy = false;
         ExternalInterface.call("PlaySound","UI_Handling_Crafting_Complete");
         ExternalInterface.call("craftRecipesCompleted");
      }
      
      public function stopTween(param1:larTween) : larTween
      {
         if(param1)
         {
            param1.stop();
            param1 = null;
         }
         return param1;
      }
      
      public function updateProgress(param1:Number) : *
      {
         this.progressBar_mc.progressBar_mc.updateProgress(param1);
      }
      
      public function buttonPressed() : *
      {
         if(this.animationBusy)
         {
            this.cancelAnim();
         }
         else if(this.recipes_mc.currentActive.val == 0)
         {
            ExternalInterface.call("PlaySound","UI_Barter_NotEnoughMoney");
         }
         else if(!this.canCraft())
         {
            ExternalInterface.call("PlaySound","UI_Barter_NotEnoughMoney");
            this.ingredients_mc.showAlerts();
         }
         else if(this.recipes_mc.currentActive)
         {
            this.pressButton();
         }
      }
      
      public function pressButton() : *
      {
         if(this.recipes_mc.currentActive)
         {
            stage.focus = null;
            ExternalInterface.call("craftRecipe",this.recipes_mc.currentActive.id,this.craftAmount);
            this.setCraftEnabled(false);
         }
      }
      
      function frame1() : *
      {
         this.bg_mc.mouseChildren = false;
         this.bg_mc.mouseEnabled = false;
         this.name_txt.mouseEnabled = false;
         this.recipeList = new scrollListGrouped("down_id","up_id","handle_id","scrollBg_id");
         this.recipeList.m_scrollbar_mc.ScaleBG = true;
         this.recipeList.m_scrollbar_mc.m_hideWhenDisabled = false;
         this.recipeList.mouseWheelWhenOverEnabled = true;
         this.recipeList.m_scrollbar_mc.m_SCROLLSPEED = this.elemSpacing;
         this.recipeList.SB_SPACING = 2;
         this.recipeList.EL_SPACING = 0;
         this.recipeList.TOP_SPACING = 0;
         this.recipeList.m_scrollbar_mc.m_hideWhenDisabled = true;
         this.container_mc.addChild(this.recipeList);
         this.recipeList.setFrame(634,17 * this.elemSpacing);
         this.recipeList.setGroupMC("CraftCategory");
         this.recipeList.elementsSortOn("textStr");
         this.recipeList.groupedScroll = false;
         this.recipeList.m_allowKeepIntoView = false;
         this.recipeList.m_scrollbar_mc.m_animateScrolling = true;
         this.decoList = new horizontalList();
         this.decoration_mc.addChild(this.decoList);
         this.container_mc.mouseEnabled = false;
         this.bg_mc.mouseEnabled = false;
         this.bg_mc.mouseChildren = false;
         this.name_txt.mouseEnabled = false;
         this.resultIconHolder_mc.addEventListener(MouseEvent.ROLL_OUT,this.hideResultTooltip);
         this.resultIconHolder_mc.addEventListener(MouseEvent.ROLL_OVER,this.showResultTooltip);
         this.craftAmount = 0;
         this.craftMaxAmount = 0;
         this.filterName_txt.condenseWhite = true;
         this.decoAm = 0;
         this.base = root as MovieClip;
         this.resultTooltipVisible = false;
         this.progressBarLength = 322;
         this.tweenProgressVar = null;
         this.overButton = false;
      }
   }
}
