package GMJournal_fla
{
   import LS_Classes.scrollList;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.external.ExternalInterface;
   
   public dynamic class content_7 extends MovieClip
   {
       
      public var addCategoryButton_mc:addCategoryButton;
      public var categoriesListHolder_mc:MovieClip;
      public var mouseHook_mc:MovieClip;
      public var categories:scrollList;
      public var _editControlsVisible:Boolean;
      
      public function content_7()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function Init() : *
      {
         //ExternalInterface.call("S7_DebugHook", "content", "Initializing content_mc")
         var rootMC:MovieClip = root as MovieClip;

         this.categories = new scrollList();
         this.categories.setTileableBG = "leftPageBG";
         this.categories.mouseWheelWhenOverEnabled = true;

         addChild(this.categories);
         this.categories.container_mc.x = 111;
         this.categories.container_mc.y = 165;
         this.categories.setFrame(525,720);
         this.categories.m_scrollbar_mc.x = 19;
         this.categories.m_scrollbar_mc.y = 177;
         this.categories.m_scrollbar_mc.setLength(683);
         this.categories.m_scrollbar_mc.m_hideWhenDisabled = false;
         this.categories.canPositionInvisibleElements = false;
         this.categories.elementSpacing = 3;

         this.addCategoryButton_mc.initialize(rootMC.strings.addCategory, this.onAddCategory);
         this.addCategoryButton_mc.visible = this._editControlsVisible;
         this.addCategoryButton_mc.heightOverride = 27;
         this.categories.addElement(this.addCategoryButton_mc, false);   // param2 allows .setPosition(). Why is this false?
         this.categories.positionElements(); // Maybe this is why lmao.
         
         var spriteGr:Sprite = new Sprite();
         spriteGr.graphics.beginFill(16711680);
         spriteGr.graphics.drawRect(0,0,620,700);
         spriteGr.graphics.endFill();
         spriteGr.width = 620;
         spriteGr.height = 700;
         this.mouseHook_mc.addChild(spriteGr);
         this.mouseHook_mc.alpha = 0;
      }
      
      public function setEditControlsVisible(editable:Boolean) : *
      {
         //ExternalInterface.call("S7_DebugHook", "content:setEditControlsVisible()", editable)
         
         var categoryElement:MovieClip = null;  // Initialize MovieClip
         this._editControlsVisible = editable;  // Set parameters
         this.addCategoryButton_mc.visible = editable;

         var iterator:* = 0;
         while(iterator < this.categories.length - 1)
         {
            categoryElement = this.categories.getAt(iterator);
            if(categoryElement.setEditable != undefined)
            {
               categoryElement.setEditable(editable);
            }
            iterator++;
         }
         this.categories.positionElements();
      }
      
      public function onAddCategory() : *
      {
         ExternalInterface.call("addCategory");
      }

      public function createCategory(entriesMapIndex:Number, positionIndex:int, strContent:String, isShared:Boolean) : MovieClip
      {
         //ExternalInterface.call("S7_DebugHook", "content", "Creating New Category", "entriesMapIndex", entriesMapIndex, "positionIndex",positionIndex, "String Content", strContent, "isShared", isShared)
         
         var catListElement:* = new categoryListElement();  // Initialize new element

         this.categories.addElementOnPosition(catListElement, positionIndex, false);  // Creates element at position positionIndex. positionElements false?
         
         catListElement.Init(entriesMapIndex, strContent);
         catListElement.setEditable(this._editControlsVisible);
         catListElement.addEventListener("HeightChanged",this.rebuildLayout);
         catListElement.editableElement_mc.setShared(isShared);
         return catListElement;
      }
      
      public function rebuildLayout() : *
      {
         this.categories.positionElements();
      }
      
      function frame1() : *
      {
      }
   }
}
