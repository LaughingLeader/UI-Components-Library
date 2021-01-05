package uiCraft_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.text.TextField;
   
   public dynamic class craftPanel_1 extends MovieClip
   {
       
      
      public var avatarFrame_mc:MovieClip;
      
      public var charName_txt:TextField;
      
      public var closeButton_mc:myCloseButton;
      
      public var dragHeader_mc:MovieClip;
      
      public var experimentPanel_mc:MovieClip;
      
      public var frameHit_mc:MovieClip;
      
      public var iggy_char:MovieClip;
      
      public var nextChar_mc:charBrowseBtn;
      
      public var prevChar_mc:charBrowseBtn;
      
      public var recipesPanel_mc:MovieClip;
      
      public var runesPanel_mc:MovieClip;
      
      public var tabBar_mc:MovieClip;
      
      public var title_txt:TextField;
      
      public var base:MovieClip;
      
      public var currentPanel:Number;
      
      public var disableActions:Boolean;
      
      public var hasTooltipEnabled:Boolean;
      
      public var tooltipTweening:Boolean;
      
      public const startDragDiff:uint = 20;
      
      public var dragStartMP:Point;
      
      public var windowDragStarted:Boolean;
      
      public function craftPanel_1()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function dragInv(param1:MouseEvent) : *
      {
         stage.focus = null;
         this.windowDragStarted = false;
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.dragInvMove);
         this.dragStartMP.y = stage.mouseY;
         this.dragStartMP.x = stage.mouseX;
         stage.addEventListener(MouseEvent.MOUSE_UP,this.stopDragInv);
      }
      
      public function dragInvMove(param1:MouseEvent) : *
      {
         if(this.dragStartMP.x + this.startDragDiff > stage.mouseX || this.dragStartMP.y + this.startDragDiff > stage.mouseY || this.dragStartMP.x - this.startDragDiff < stage.mouseX || this.dragStartMP.y - this.startDragDiff < stage.mouseY)
         {
            ExternalInterface.call("hideTooltip");
            ExternalInterface.call("startMoveWindow");
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.dragInvMove);
            this.windowDragStarted = true;
         }
      }
      
      public function stopDragInv(param1:MouseEvent) : *
      {
         if(this.windowDragStarted)
         {
            ExternalInterface.call("cancelMoveWindow");
         }
         else
         {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.dragInvMove);
         }
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.stopDragInv);
         this.windowDragStarted = false;
      }
      
      public function onEventInit() : *
      {
         this.title_txt.mouseEnabled = false;
         this.tabBar_mc.init();
         this.currentPanel = this.base.experimentPanelID;
         this.experimentPanel_mc.onEventInit();
         this.recipesPanel_mc.onEventInit();
         this.experimentPanel_mc.visible = false;
         this.recipesPanel_mc.visible = false;
         this.hasTooltipEnabled = false;
         this.closeButton_mc.init(this.closePressed);
         this.runesPanel_mc.init();
         this.prevChar_mc.init(this.onPrevChar);
         this.nextChar_mc.init(this.onNextChar);
         this.frameHit_mc.addEventListener(MouseEvent.MOUSE_UP,this.loseFocusEvent);
         this.frameHit_mc.addEventListener(MouseEvent.MOUSE_DOWN,this.loseFocusEvent);
      }
      
      public function loseFocusEvent(param1:MouseEvent) : *
      {
         stage.focus = null;
      }
      
      public function updateItems() : *
      {
         switch(this.currentPanel)
         {
            case this.base.runesPanelID:
               this.runesPanel_mc.updateItems();
               break;
            case this.base.experimentPanelID:
               this.experimentPanel_mc.updateItems();
         }
      }
      
      public function onPrevChar() : *
      {
         ExternalInterface.call("prevCharacter");
      }
      
      public function onNextChar() : *
      {
         ExternalInterface.call("nextCharacter");
      }
      
      public function closePressed() : *
      {
         ExternalInterface.call("PlaySound","UI_Gen_XButton_Click");
         if(this.base.isDragging)
         {
            ExternalInterface.call("cancelDragging");
         }
         else
         {
            this.closeUI();
         }
      }
      
      public function closeUI() : *
      {
         ExternalInterface.call("hideTooltip");
         ExternalInterface.call("hideUI");
      }
      
      public function cursorRight() : *
      {
         if(this.currentPanel != -1)
         {
            switch(this.currentPanel)
            {
               case this.base.recipePanelID:
                  this.recipesPanel_mc.cursorRight();
                  break;
               case this.base.experimentPanelID:
                  this.experimentPanel_mc.cursorRight();
            }
         }
      }
      
      public function cursorLeft() : *
      {
         if(this.currentPanel != -1)
         {
            switch(this.currentPanel)
            {
               case this.base.recipePanelID:
                  this.recipesPanel_mc.cursorLeft();
                  break;
               case this.base.experimentPanelID:
                  this.experimentPanel_mc.cursorLeft();
            }
         }
      }
      
      public function cursorUp() : *
      {
         if(this.currentPanel != -1)
         {
            switch(this.currentPanel)
            {
               case this.base.recipePanelID:
                  this.recipesPanel_mc.cursorUp();
                  break;
               case this.base.experimentPanelID:
                  this.experimentPanel_mc.cursorUp();
            }
         }
      }
      
      public function cursorDown() : *
      {
         if(this.currentPanel != -1)
         {
            switch(this.currentPanel)
            {
               case this.base.recipePanelID:
                  this.recipesPanel_mc.cursorDown();
                  break;
               case this.base.experimentPanelID:
                  this.experimentPanel_mc.cursorDown();
            }
         }
      }
      
      public function cursorAccept() : *
      {
         if(this.disableActions)
         {
            return;
         }
         if(this.currentPanel != -1)
         {
            switch(this.currentPanel)
            {
               case this.base.recipePanelID:
                  this.recipesPanel_mc.cursorAccept();
                  break;
               case this.base.experimentPanelID:
                  this.experimentPanel_mc.cursorAccept();
            }
         }
      }
      
      public function cursorCancel() : Boolean
      {
         if(this.currentPanel != -1)
         {
            switch(this.currentPanel)
            {
               case this.base.recipePanelID:
                  return this.recipesPanel_mc.cursorCancel();
               case this.base.experimentPanelID:
                  return this.experimentPanel_mc.cursorCancel();
            }
         }
         return false;
      }
      
      public function setIngredient(param1:Number, param2:Number, param3:String, param4:Number, param5:Boolean, param6:Boolean) : *
      {
         if(this.currentPanel != -1)
         {
            switch(this.currentPanel)
            {
               case this.base.recipePanelID:
                  this.recipesPanel_mc.setIngredient(param1,param2,param3,param4,param5);
                  break;
               case this.base.experimentPanelID:
                  this.experimentPanel_mc.setIngredient(param1,param2,param3,param4,param5,param6);
            }
         }
      }
      
      public function addTab(param1:Number, param2:String) : *
      {
         this.tabBar_mc.addTab(param1,param2,this.showTab);
      }
      
      public function showTab(param1:MovieClip) : *
      {
         ExternalInterface.call("hideTooltip");
         if(this.currentPanel != param1.id)
         {
            ExternalInterface.call("setCurrentTab",param1.id);
         }
      }
      
      public function setActivePanel(param1:Number) : *
      {
         this.currentPanel = param1;
         if(this.currentPanel != -1)
         {
            stage.focus = null;
            this.tabBar_mc.selectTab(param1);
            switch(this.currentPanel)
            {
               case this.base.recipePanelID:
                  this.experimentPanel_mc.visible = false;
                  this.experimentPanel_mc.cancelAnim();
                  this.recipesPanel_mc.visible = true;
                  this.recipesPanel_mc.recipeList.collapseAll(true);
                  this.recipesPanel_mc.selectFirst();
                  this.runesPanel_mc.visible = false;
                  break;
               case this.base.experimentPanelID:
                  this.experimentPanel_mc.resetUI();
                  this.experimentPanel_mc.visible = true;
                  this.recipesPanel_mc.cancelAnim();
                  this.recipesPanel_mc.visible = false;
                  this.runesPanel_mc.visible = false;
                  break;
               case this.base.runesPanelID:
                  this.experimentPanel_mc.visible = false;
                  this.experimentPanel_mc.cancelAnim();
                  this.recipesPanel_mc.visible = false;
                  this.recipesPanel_mc.cancelAnim();
                  this.runesPanel_mc.visible = true;
                  this.runesPanel_mc.reset();
            }
         }
      }
      
      public function craftButton(param1:Boolean) : Boolean
      {
         if(this.disableActions)
         {
            return false;
         }
         if(this.currentPanel != -1)
         {
            switch(this.currentPanel)
            {
               case this.base.recipePanelID:
                  this.recipesPanel_mc.craftButton(param1);
                  break;
               case this.base.experimentPanelID:
                  return this.experimentPanel_mc.craftButton(param1);
            }
         }
         return false;
      }
      
      public function canShowTooltip() : Boolean
      {
         var _loc1_:* = undefined;
         if(this.currentPanel == this.base.experimentPanelID)
         {
            if(this.experimentPanel_mc.ingredients_mc.selectedId == 0)
            {
               _loc1_ = this.experimentPanel_mc.getSlot(this.experimentPanel_mc.currentHLSlot);
               if(_loc1_)
               {
                  return _loc1_.itemHandle != 0;
               }
            }
            else
            {
               if(this.experimentPanel_mc.ingredients_mc.selectedId == 1)
               {
                  return !this.experimentPanel_mc.ingredients_mc.obj1Empty;
               }
               if(this.experimentPanel_mc.ingredients_mc.selectedId == 2)
               {
                  return !this.experimentPanel_mc.ingredients_mc.obj2Empty;
               }
            }
         }
         return false;
      }
      
      public function showContextMenu() : *
      {
         if(this.currentPanel == this.base.experimentPanelID)
         {
            this.experimentPanel_mc.showContextMenu();
         }
      }
      
      function frame1() : *
      {
         this.base = root as MovieClip;
         this.title_txt.mouseEnabled = false;
         this.disableActions = this.base.disableActions;
         this.hasTooltipEnabled = false;
         this.tooltipTweening = false;
         this.dragStartMP = new Point();
         this.dragHeader_mc.addEventListener(MouseEvent.MOUSE_DOWN,this.dragInv);
         this.windowDragStarted = false;
      }
   }
}
