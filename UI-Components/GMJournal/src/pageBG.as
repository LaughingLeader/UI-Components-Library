package
{
   import LS_Classes.listDisplay;
   import flash.display.MovieClip;
   import flash.utils.getDefinitionByName;
   
   public dynamic class pageBG extends MovieClip
   {
       
      
      public function pageBG()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function init(param1:int, param2:String) : *
      {
         var _loc6_:* = undefined;
         var _loc3_:* = new listDisplay();
         _loc3_.EL_SPACING = 0;
         addChild(_loc3_);
         _loc3_.x = 44;
         var _loc4_:Class = getDefinitionByName(param2) as Class;
         var _loc5_:int = 0;
         while(_loc5_ < param1)
         {
            _loc6_ = new _loc4_() as MovieClip;
            _loc6_.heightOverride = 30;
            _loc3_.addElement(_loc6_,false);
            _loc5_++;
         }
         _loc3_.positionElements();
      }
      
      function frame1() : *
      {
      }
   }
}
