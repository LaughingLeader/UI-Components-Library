package LS_Classes
{
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   
   public class LSDisplayObjectHelpers
   {
       
      
      public function LSDisplayObjectHelpers()
      {
         super();
      }
      
      public static function getDisplayObjectUnderCursor(param1:MovieClip, param2:Number, param3:Number) : DisplayObject
      {
         var _loc6_:Point = null;
         var _loc9_:DisplayObject = null;
         var _loc10_:MovieClip = null;
         var _loc11_:DisplayObject = null;
         var _loc12_:TextField = null;
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         if(param1.scrollRect != null)
         {
            _loc4_ = param1.scrollRect.x;
            _loc5_ = param1.scrollRect.y;
         }
         var _loc7_:int = param1.numChildren;
         var _loc8_:int = _loc7_ - 1;
         while(_loc8_ >= 0)
         {
            _loc9_ = param1.getChildAt(_loc8_);
            if(_loc9_.visible)
            {
               _loc6_ = _loc9_.globalToLocal(new Point(param2,param3));
               if(!(_loc9_.scrollRect != null && (_loc6_.x < 0 || _loc6_.y < 0 || _loc9_.scrollRect.width < _loc6_.x || _loc9_.scrollRect.height < _loc6_.y)))
               {
                  if(_loc9_ is TextField)
                  {
                     _loc12_ = _loc9_ as TextField;
                     if(_loc12_ && _loc12_.type == TextFieldType.INPUT && _loc12_.mouseEnabled && (_loc6_.x >= 0 && _loc6_.y >= 0 && _loc12_.width >= _loc6_.x && _loc12_.height >= _loc6_.y))
                     {
                        return _loc9_;
                     }
                  }
                  if(_loc9_.hitTestPoint(param2 + _loc4_,param3 + _loc5_,true))
                  {
                     _loc10_ = _loc9_ as MovieClip;
                     if(_loc10_ == null)
                     {
                        return _loc9_;
                     }
                     if(_loc10_.mouseEnabled)
                     {
                        _loc11_ = getDisplayObjectUnderCursor(_loc10_,param2 + _loc4_,param3 + _loc5_);
                        if(_loc11_ != null)
                        {
                           return _loc11_;
                        }
                     }
                  }
               }
            }
            _loc8_--;
         }
         return null;
      }
      
      public static function getRelativePosition(param1:DisplayObject, param2:DisplayObject = null) : Point
      {
         var _loc5_:Rectangle = null;
         var _loc3_:Point = new Point(param1.x,param1.y);
         var _loc4_:DisplayObject = param1.parent;
         while(_loc4_ != null && (param1.stage != null && _loc4_ != param1.stage))
         {
            if(_loc4_ == param2)
            {
               _loc4_ = null;
            }
            else
            {
               _loc3_.x = _loc3_.x + _loc4_.x;
               _loc3_.y = _loc3_.y + _loc4_.y;
               if(_loc4_.scrollRect != null)
               {
                  _loc5_ = _loc4_.scrollRect;
                  _loc3_.x = _loc3_.x - _loc5_.x;
                  _loc3_.y = _loc3_.y - _loc5_.y;
               }
               _loc4_ = _loc4_.parent;
            }
         }
         return _loc3_;
      }
      
      public static function dispatchCustomMouseEvent(param1:DisplayObject, param2:String) : Boolean
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:DisplayObject = null;
         var _loc7_:DisplayObject = null;
         var _loc8_:Number = NaN;
         var _loc9_:TextField = null;
         var _loc3_:MovieClip = param1 as MovieClip;
         if(_loc3_ != null)
         {
            _loc4_ = param1.mouseX;
            _loc5_ = param1.mouseY;
            _loc6_ = getDisplayObjectUnderCursor(_loc3_,_loc4_,_loc5_);
            _loc7_ = _loc6_;
            while(_loc7_ != null)
            {
               if(_loc7_.hasEventListener(param2))
               {
                  _loc8_ = 0;
                  _loc9_ = _loc6_ as TextField;
                  if(_loc9_ != null && _loc9_.numLines > 0)
                  {
                     _loc8_ = _loc9_.textHeight / _loc9_.numLines * Math.max(0,_loc9_.scrollV - 1);
                  }
                  _loc7_.dispatchEvent(new MouseEvent(param2,true,false,_loc6_.mouseX,_loc6_.mouseY + _loc8_,_loc6_ as InteractiveObject,false,false,false,true));
                  return true;
               }
               _loc7_ = _loc7_.parent;
            }
         }
         return false;
      }
   }
}
