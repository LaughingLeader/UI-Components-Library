package uiCraft_fla
{
   import LS_Classes.textHelpers;
   import flash.display.MovieClip;
   import flash.external.ExternalInterface;
   import flash.text.TextField;
   
   public dynamic class MainTimeline extends MovieClip
   {
       
      
      public var craftPanel_mc:MovieClip;
      
      public var events:Array;
      
      public var keepCustomInScreen:Boolean;
      
      public var uiLeft:uint;
      
      public var uiRight:uint;
      
      public var uiTop:uint;
      
      public var uiMinHeight:uint;
      
      public var uiMinWidth:uint;
      
      public var charIconW:Number;
      
      public var charIconH:Number;
      
      public var layout:String;
      
      public var ingredientCellSize:Number;
      
      public const recipeIngredientCellSize:Number = 50;
      
      public var invCellSize:Number;
      
      public var invCellSpacing:Number;
      
      public var invBgDiscrap:Number;
      
      public const invCellBgSizeDiff:Number = 0;
      
      public var invRows:Number;
      
      public var invCols:Number;
      
      public var invRuneRows:Number;
      
      public var invRuneCols:Number;
      
      public var allowSound:Boolean;
      
      public var itemsUpdateList:Array;
      
      public var runeslotUpdateList:Array;
      
      public const IconWidth:uint = 80;
      
      public const IconHeight:uint = 100;
      
      public var recipeIconSize:Number;
      
      public var recipeIconSpacing:Number;
      
      public var makeSound:Boolean;
      
      public var hasTooltip:Boolean;
      
      public var disableActions:Boolean;
      
      public var curTooltip:Number;
      
      public var isDragging:Boolean;
      
      public var draggingIngredient:Boolean;
      
      public const runesPanelID:Number = 2;
      
      public const experimentPanelID:Number = 1;
      
      public const recipePanelID:Number = 0;
      
      public const sysPanelX:int = 0;
      
      public const sysPanelY:int = 22;
      
      public const sysPanelW:int = 680;
      
      public const sysPanelH:int = 1012;
      
      public var runeTitleStr:Object;
      
      public var runeSlotBtnInsertStr:Object;
      
      public var runeSlotBtnExtractStr:Object;
      
      public var text_array:Array;
      
      public var recipe_array:Array;
      
      public var recipeCount_array:Array;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onEventResize() : *
      {
         ExternalInterface.call("setPosition","topright","splitscreen","topright");
      }
      
      public function onEventDown(param1:Number) : *
      {
         var _loc3_:String = null;
         var _loc2_:Boolean = false;
         if(stage.focus == null)
         {
            _loc3_ = this.events[param1];
            switch(this.events[param1])
            {
               case "IE UIAccept":
                  _loc2_ = true;
                  break;
               case "IE UICancel":
                  _loc2_ = true;
                  break;
               case "IE ToggleInGameMenu":
                  _loc2_ = true;
            }
         }
         else
         {
            switch(this.events[param1])
            {
               case "IE ToggleInGameMenu":
                  _loc2_ = true;
            }
         }
         return _loc2_;
      }
      
      public function onEventUp(param1:Number) : *
      {
         var _loc2_:Boolean = false;
         if(stage.focus == null)
         {
            switch(this.events[param1])
            {
               case "IE UIShowTooltip":
                  this.craftPanel_mc.toggleTooltip();
                  _loc2_ = true;
                  break;
               case "IE UICancel":
                  _loc2_ = this.craftPanel_mc.cursorCancel();
                  break;
               case "IE UIAccept":
                  this.craftPanel_mc.cursorAccept();
                  _loc2_ = true;
                  break;
               case "IE ToggleInGameMenu":
                  this.craftPanel_mc.closeUI();
                  _loc2_ = true;
                  return _loc2_;
               case "IE ContextMenu":
                  this.craftPanel_mc.showContextMenu();
                  _loc2_ = true;
                  return _loc2_;
            }
         }
         else
         {
            switch(this.events[param1])
            {
               case "IE ToggleInGameMenu":
                  stage.focus = null;
                  _loc2_ = true;
            }
         }
         return _loc2_;
      }
      
      public function setPlayer(param1:Number, param2:Boolean) : *
      {
         this.craftPanel_mc.avatarFrame_mc.visible = param2;
      }
      
      public function clearStation() : *
      {
         this.craftPanel_mc.experimentPanel_mc.station_mc.visible = false;
         this.craftPanel_mc.recipesPanel_mc.station_mc.visible = false;
         this.craftPanel_mc.experimentPanel_mc.station_mc.setStationText("");
         this.craftPanel_mc.recipesPanel_mc.station_mc.setStationText("");
      }
      
      public function setStation(param1:String, param2:Boolean) : *
      {
         this.craftPanel_mc.experimentPanel_mc.station_mc.visible = Boolean(param1 != "");
         this.craftPanel_mc.recipesPanel_mc.station_mc.visible = Boolean(param1 != "");
         this.craftPanel_mc.experimentPanel_mc.station_mc.setStationText(param1);
         this.craftPanel_mc.recipesPanel_mc.station_mc.setStationText(param1);
         this.craftPanel_mc.experimentPanel_mc.station_mc.setStationAvailable(param2);
         this.craftPanel_mc.recipesPanel_mc.station_mc.setStationAvailable(param2);
      }
      
      public function onEventInit() : *
      {
         ExternalInterface.call("registerAnchorId","uiCraft");
         this.craftPanel_mc.onEventInit();
         ExternalInterface.call("setPosition","topright","splitscreen","topright");
      }
      
      public function startCraft() : *
      {
         this.craftPanel_mc.experimentPanel_mc.startCraft();
      }
      
      public function updateRuneSlots() : *
      {
         this.craftPanel_mc.runesPanel_mc.updateRuneSlots();
      }
      
      public function setCraftResultHandle(param1:Number, param2:int = -1) : *
      {
         this.craftPanel_mc.runesPanel_mc.setCraftResultHandle(param1,param2);
      }
      
      public function setCraftInventoryPanelVisible(param1:Boolean, param2:Boolean) : *
      {
         if(param1)
         {
            this.craftPanel_mc.runesPanel_mc.inventory_mc.showPanel();
            this.craftPanel_mc.runesPanel_mc.inventory_mc.selectRuneTargetMode = !param2;
         }
         else
         {
            this.craftPanel_mc.runesPanel_mc.inventory_mc.hidePanel();
         }
      }
      
      public function setNoRuneWeaponsError(param1:String, param2:Boolean = false) : *
      {
         this.craftPanel_mc.runesPanel_mc.setNoRuneWeaponsError(param1,param2);
      }
      
      public function setText(param1:Number, param2:String) : *
      {
         if(this.text_array[param1] == null)
         {
            return;
         }
         if(param1 == 27)
         {
            this.text_array[param1].setText(param2);
         }
         else if(this.text_array[param1] == this.craftPanel_mc.title_txt)
         {
            this.text_array[param1].htmlText = param2.toUpperCase();
         }
         else if(param1 < this.text_array.length)
         {
            if(this.text_array[param1] is TextField)
            {
               if(this.craftPanel_mc.charName_txt == this.text_array[param1] || this.craftPanel_mc.runesPanel_mc.title_txt == this.text_array[param1])
               {
                  this.text_array[param1].htmlText = param2.toUpperCase();
               }
               else
               {
                  this.text_array[param1].htmlText = param2;
               }
            }
            else if(this.text_array[param1] is MovieClip)
            {
               this.text_array[param1].setText(param2.toUpperCase());
            }
            else if(this.text_array[param1] is Object)
            {
               this.text_array[param1].str = param2.toUpperCase();
               this.craftPanel_mc.runesPanel_mc.resetTexts();
            }
         }
         if(param1 == 10 || param1 == 11 || param1 == 12 || param1 == 13)
         {
            textHelpers.smallCaps(this.text_array[param1],9,true);
         }
         if(param1 == 11)
         {
            this.setText(13,param2);
         }
         else if(param1 == 9)
         {
            this.setText(14,param2);
         }
      }
      
      public function setMaxIngredients(param1:Number) : *
      {
         this.craftPanel_mc.experimentPanel_mc.ingredients_mc.setMax(param1);
      }
      
      public function setMaxRecipeIngredients(param1:Number) : *
      {
         this.craftPanel_mc.recipesPanel_mc.ingredients_mc.setMax(param1);
      }
      
      public function setClosePopupButton(param1:String) : *
      {
         this.craftPanel_mc.experimentPanel_mc.setClosePopupButton(param1);
      }
      
      public function setIngredient(param1:Number, param2:Number, param3:String, param4:Number, param5:Boolean, param6:Boolean) : *
      {
         this.craftPanel_mc.setIngredient(param1,param2,param3,param4,!param5,param6);
      }
      
      public function setRecipeMaxCraftAmount(param1:Number) : *
      {
         this.craftPanel_mc.recipesPanel_mc.setMaxCraftAmount(param1);
      }
      
      public function setRecipeResult(param1:String) : *
      {
         this.craftPanel_mc.recipesPanel_mc.setResult(param1);
      }
      
      public function setContainerMode(param1:Boolean) : *
      {
         this.craftPanel_mc.experimentPanel_mc.setContainerMode(param1);
      }
      
      public function showBreadcrumb(param1:Number, param2:Boolean) : *
      {
         this.craftPanel_mc.tabBar_mc.showBreadcrumb(param1,param2);
      }
      
      public function showCraftPanel(param1:Number) : *
      {
         this.craftPanel_mc.setActivePanel(param1);
      }
      
      public function updateItems() : *
      {
         this.craftPanel_mc.updateItems();
         if(!this.isDragging)
         {
            this.draggingIngredient = false;
         }
      }
      
      public function setInventorySlotSelection(param1:Number) : *
      {
         this.craftPanel_mc.experimentPanel_mc.selectSlot(param1,true);
      }
      
      public function clearSlots() : *
      {
         this.craftPanel_mc.experimentPanel_mc.clearSlots();
      }
      
      public function setResult(param1:String, param2:Boolean) : *
      {
         this.craftPanel_mc.experimentPanel_mc.resultName = param1;
         this.craftPanel_mc.experimentPanel_mc.hasResult = param2;
         this.craftPanel_mc.experimentPanel_mc.resultSpacing_mc.itemHandle = -1;
         this.craftPanel_mc.experimentPanel_mc.result_mc.noResult_txt.visible = !param2;
      }
      
      public function setResultHandle(param1:Number) : *
      {
         this.craftPanel_mc.experimentPanel_mc.setResultHandle(param1);
      }
      
      public function startCraftRecipe() : *
      {
         this.craftPanel_mc.recipesPanel_mc.startCraft();
      }
      
      public function updateProgress(param1:Number) : *
      {
         if(this.craftPanel_mc.currentPanel == this.experimentPanelID)
         {
            this.craftPanel_mc.experimentPanel_mc.updateProgress(param1);
         }
         else
         {
            this.craftPanel_mc.recipesPanel_mc.updateProgress(param1);
         }
      }
      
      public function showResult() : *
      {
         if(this.craftPanel_mc.currentPanel == this.experimentPanelID)
         {
            this.craftPanel_mc.experimentPanel_mc.showResult();
         }
         else
         {
            this.craftPanel_mc.recipesPanel_mc.showResult();
         }
      }
      
      public function cancelCraft() : *
      {
         if(this.craftPanel_mc.currentPanel == this.experimentPanelID)
         {
            this.craftPanel_mc.experimentPanel_mc.resetAnim();
         }
         else
         {
            this.craftPanel_mc.recipesPanel_mc.resetAnim();
         }
      }
      
      public function updateArraySystem() : *
      {
         var _loc1_:uint = 0;
         _loc1_ = 0;
         while(_loc1_ < this.recipe_array.length)
         {
            this.addRecipe(this.recipe_array[_loc1_],this.recipe_array[_loc1_ + 1],this.recipe_array[_loc1_ + 2],this.recipe_array[_loc1_ + 3],this.recipe_array[_loc1_ + 4],this.recipe_array[_loc1_ + 5]);
            _loc1_ = _loc1_ + 6;
         }
         if(this.recipe_array.length > 0)
         {
            this.craftPanel_mc.recipesPanel_mc.removeOldRecipes();
         }
         _loc1_ = 0;
         while(_loc1_ < this.recipeCount_array.length)
         {
            this.setRecipeAmount(this.recipeCount_array[_loc1_],this.recipeCount_array[_loc1_ + 1],this.recipeCount_array[_loc1_ + 2]);
            _loc1_ = _loc1_ + 3;
         }
         this.recipeCount_array = new Array();
         this.recipe_array = new Array();
      }
      
      public function addRecipe(param1:Number, param2:Number, param3:String, param4:String, param5:String, param6:Boolean = true) : *
      {
         this.craftPanel_mc.recipesPanel_mc.addRecipe(param1,param2,param3,param4,param5,param6);
      }
      
      public function setRecipeAmount(param1:Number, param2:Number, param3:String) : *
      {
         this.craftPanel_mc.recipesPanel_mc.setRecipeAmount(param1,param2,param3);
      }
      
      public function removeRecipes() : *
      {
         this.craftPanel_mc.recipesPanel_mc.removeRecipes();
      }
      
      public function addRecipeGroup(param1:Number, param2:String) : *
      {
         this.craftPanel_mc.recipesPanel_mc.addRecipeGroup(param1,param2);
      }
      
      public function addTab(param1:Number, param2:String) : *
      {
         this.craftPanel_mc.addTab(param1,param2);
      }
      
      public function setTabEnabled(param1:Number, param2:Boolean) : *
      {
         this.craftPanel_mc.tabBar_mc.setTabEnabled(param1,param2);
      }
      
      public function addFilterTab(param1:Number, param2:Number, param3:String) : *
      {
         this.craftPanel_mc.experimentPanel_mc.addFilterTab(param1,param2,param3);
      }
      
      public function selectFilterTab(param1:Number) : *
      {
         this.craftPanel_mc.experimentPanel_mc.selectFilterTab(param1);
      }
      
      function frame1() : *
      {
         this.events = new Array("IE UICancel","IE UIAccept","IE ToggleInGameMenu","IE ContextMenu");
         this.keepCustomInScreen = true;
         this.uiLeft = 0;
         this.uiRight = 680;
         this.uiTop = 20;
         this.uiMinHeight = 190;
         this.uiMinWidth = 150;
         this.charIconW = 80;
         this.charIconH = 100;
         this.layout = "fixed";
         this.ingredientCellSize = 50;
         this.invCellSize = 50;
         this.invCellSpacing = 8;
         this.invBgDiscrap = -4;
         this.invRows = 8;
         this.invCols = 11;
         this.invRuneRows = 6;
         this.invRuneCols = 9;
         this.allowSound = false;
         this.itemsUpdateList = new Array();
         this.runeslotUpdateList = new Array();
         this.recipeIconSize = 55;
         this.recipeIconSpacing = 9;
         this.makeSound = true;
         this.hasTooltip = false;
         this.disableActions = false;
         this.curTooltip = -1;
         this.isDragging = false;
         this.draggingIngredient = false;
         this.runeTitleStr = new Object();
         this.runeTitleStr.str = "";
         this.runeSlotBtnInsertStr = new Object();
         this.runeSlotBtnInsertStr.str = "";
         this.runeSlotBtnExtractStr = new Object();
         this.runeSlotBtnExtractStr.str = "";
         this.text_array = new Array(null,null,null,null,null,null,null,null,null,this.craftPanel_mc.experimentPanel_mc.button_mc,this.craftPanel_mc.experimentPanel_mc.currentStep_txt,this.craftPanel_mc.experimentPanel_mc.result_txt,this.craftPanel_mc.experimentPanel_mc.result_mc.noResult_txt,this.craftPanel_mc.recipesPanel_mc.result_txt,this.craftPanel_mc.recipesPanel_mc.button_mc,null,null,this.craftPanel_mc.title_txt,this.craftPanel_mc.charName_txt,this.craftPanel_mc.runesPanel_mc.inventory_mc.title_txt,this.craftPanel_mc.runesPanel_mc.inventory_mc.select_mc,this.craftPanel_mc.runesPanel_mc.title_txt,this.craftPanel_mc.runesPanel_mc.name_txt,this.craftPanel_mc.runesPanel_mc.accept_mc,this.runeTitleStr,this.runeSlotBtnInsertStr,this.runeSlotBtnExtractStr,this.craftPanel_mc.recipesPanel_mc.view_mc);
         this.recipe_array = new Array();
         this.recipeCount_array = new Array();
      }
   }
}
