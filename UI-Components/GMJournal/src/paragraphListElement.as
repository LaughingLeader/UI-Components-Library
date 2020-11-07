package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public dynamic class paragraphListElement extends MovieClip
   {
       
      
      public var editableElement_mc:MovieClip;
      
      public var paragraph_mc:MovieClip;
      
      public var heightOverride:Number;
      
      public var onRemove:Function;
      
      public var _id:Number;
      
      public var parentId:Number;
      
      public var onDestroy:Function;
      
      public function paragraphListElement()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function Init(param1:String, param2:Number) : *
      {
         this.editableElement_mc.Init(this.paragraph_mc,param1,523,27);
         this.editableElement_mc.onRemove = this.onElementRemove;
         this.editableElement_mc.addEventListener("HeightChanged",this.onHeightChanged);
         this.editableElement_mc.id = param2;
         this.heightOverride = this.editableElement_mc.heightOverride;
         this._id = param2;
      }
      
      public function setEditable(param1:Boolean) : *
      {
         this.editableElement_mc.setEditable(param1);
      }
      
      public function onHeightChanged(param1:Event) : *
      {
         this.heightOverride = this.editableElement_mc.heightOverride;
         dispatchEvent(new Event("HeightChanged"));
      }
      
      public function onElementRemove() : *
      {
         if(this.onRemove != null)
         {
            this.onRemove(this.list_pos);
         }
         if(this.onDestroy != null)
         {
            this.onDestroy(this);
         }
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