package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   
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
      
      public function Init(strContent:String, paraID:Number) : *
      {
         ExternalInterface.call("S7_DebugHook", "Root:content_mc:categories:catListElement:chapListElement:paragraph:Init()", "Initializing paraList", strContent, paraID)
         this.editableElement_mc.Init(this.paragraph_mc, strContent, 523, 27); // editableElement_mc.Init(categoryMC:MovieClip, strContent:String, width:Number, height:Number) : *
         
         this.editableElement_mc.onRemove = this.onElementRemove;
         this.editableElement_mc.addEventListener("HeightChanged", this.onHeightChanged);
         
         this.heightOverride = this.editableElement_mc.heightOverride;
         
         this.editableElement_mc.id = paraID;
         this._id = paraID;
      }
      
      public function setEditable(editable:Boolean) : *
      {
         this.editableElement_mc.setEditable(editable);
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
