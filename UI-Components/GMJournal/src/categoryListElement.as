package
{
   import LS_Classes.listDisplay;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   
   public dynamic class categoryListElement extends MovieClip
   {
       
      
      public var addChapterButton_mc:addChapterButton;
      
      public var category_mc:MovieClip;
      
      public var chaptersHolder_mc:MovieClip;
      
      public var editableElement_mc:MovieClip;
      
      public var _id:Number;
      
      public var _chapters:listDisplay;
      
      public var heightOverride:Number;
      
      public var _editable:Boolean;
      
      public const captionBottomMargin:Number = 3;
      
      public var onDestroy:Function;
      
      public function categoryListElement()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function Init(param1:Number, param2:String) : *
      {
         this._id = param1;
         this.addChapterButton_mc.initialize((root as MovieClip).strings.addChapter,this.onAddChapter);
         this.addChapterButton_mc.heightOverride = 27;
         this.category_mc.Init();
         this.category_mc.addEventListener("HeightChanged",this.onHeightChanged);
         this.editableElement_mc.Init(this.category_mc,param2,523,27);
         this.editableElement_mc.onRemove = this.onRemove;
         this.editableElement_mc.addEventListener("HeightChanged",this.onHeightChanged);
         this.editableElement_mc.id = this._id;
         this._chapters = new listDisplay();
         this.chaptersHolder_mc.addChild(this._chapters);
         this.category_mc.attachList(this._chapters);
         this._chapters.elementSpacing = 3;
         this._chapters.addElement(this.addChapterButton_mc,false);
         this._chapters.canPositionInvisibleElements = false;
         this._chapters.positionElements();
         this.updateHeight();
      }
      
      public function setEditable(param1:Boolean) : *
      {
         var _loc3_:* = undefined;
         this._editable = param1;
         this.editableElement_mc.setEditable(param1);
         this.addChapterButton_mc.visible = param1;
         var _loc2_:int = 0;
         while(_loc2_ < this._chapters.length)
         {
            _loc3_ = this._chapters.getAt(_loc2_);
            if(_loc3_ != null && _loc3_.setEditable != undefined)
            {
               _loc3_.setEditable(param1);
            }
            _loc2_++;
         }
         this._chapters.positionElements();
         this.onHeightChanged(null);
      }
      
      public function onRemove(param1:MovieClip) : *
      {
         (root as MovieClip).content_mc.categories.removeElement(this.list_pos);
         ExternalInterface.call("removeNode",this._id);
         if(this.onDestroy != null)
         {
            this.onDestroy(this);
         }
      }
      
      public function onHeightChanged(param1:Event) : *
      {
         this.chaptersHolder_mc.y = this.editableElement_mc.heightOverride + this.captionBottomMargin;
         this.updateHeight();
         dispatchEvent(new Event("HeightChanged"));
      }
      
      public function updateHeight() : *
      {
         var _loc1_:* = !!this._chapters.visible?this._chapters.visibleHeight:0;
         if(_loc1_ > 0)
         {
            _loc1_ = _loc1_ + this.captionBottomMargin;
         }
         this.heightOverride = this.editableElement_mc.heightOverride + _loc1_;
      }
      
      public function onAddChapter() : *
      {
         ExternalInterface.call("addChapter",this._id);
      }
      
      public function createChapter(param1:Number, param2:int, param3:String, param4:Boolean) : MovieClip
      {
         var _loc5_:* = new chapterListElement();
         this._chapters.addElementOnPosition(_loc5_,param2,false);
         _loc5_.onRemove = this.onChapterRemove;
         _loc5_.Init(param3,param1);
         _loc5_.setEditable(this._editable);
         _loc5_.addEventListener("HeightChanged",this.onChapterHeightChanged);
         _loc5_.editableElement_mc.setShared(param4);
         _loc5_.parentId = this._id;
         var _loc6_:DisplayObjectContainer = this.addChapterButton_mc.parent;
         _loc6_.setChildIndex(this.addChapterButton_mc,_loc6_.numChildren - 1);
         this._chapters.positionElements();
         this.onHeightChanged(null);
         return _loc5_;
      }
      
      public function onChapterRemove(param1:int) : *
      {
         this._chapters.removeElement(param1);
         this.onHeightChanged(null);
      }
      
      public function onChapterHeightChanged(param1:Event) : *
      {
         this._chapters.positionElements();
         this.onHeightChanged(param1);
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      function frame1() : *
      {
      }
   }
}
