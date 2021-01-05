package
{
   import flash.display.MovieClip;
   
   public dynamic class Ping extends MovieClip
   {
       
      
      public var _objectId:Number;
      
      public var updated:Boolean;
      
      public function Ping()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function reset() : void
      {
         var _loc3_:MovieClip = null;
         var _loc1_:uint = this.numChildren;
         var _loc2_:uint = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = this.getChildAt(_loc2_) as MovieClip;
            if(_loc3_ != null)
            {
               _loc3_.gotoAndPlay(1);
            }
            _loc2_++;
         }
      }
      
      public function set objectId(param1:Number) : *
      {
         this._objectId = param1;
      }
      
      public function get objectId() : *
      {
         return this._objectId;
      }
      
      function frame1() : *
      {
      }
   }
}
