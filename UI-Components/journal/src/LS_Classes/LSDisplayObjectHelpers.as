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
         var _loc4_:Point = null;
         var _loc7_:DisplayObject = null;
         var _loc8_:MovieClip = null;
         var _loc9_:DisplayObject = null;
         var _loc10_:TextField = null;
         var _loc5_:int = param1.numChildren;
         var _loc6_:int = _loc5_ - 1;
         while(_loc6_ >= 0)
         {
            _loc7_ = param1.getChildAt(_loc6_);
            if(_loc7_.visible)
            {
               _loc4_ = _loc7_.globalToLocal(new Point(param2,param3));
               if(!(_loc7_.scrollRect != null && (_loc4_.x < 0 || _loc4_.y < 0 || _loc7_.scrollRect.width < _loc4_.x || _loc7_.scrollRect.height < _loc4_.y)))
               {
                  if(_loc7_ is TextField)
                  {
                     _loc10_ = _loc7_ as TextField;
                     if(_loc10_ && _loc10_.type == TextFieldType.INPUT && _loc10_.mouseEnabled && (_loc4_.x >= 0 && _loc4_.y >= 0 && _loc10_.width >= _loc4_.x && _loc10_.height >= _loc4_.y))
                     {
                        return _loc7_;
                     }
                  }
                  if(_loc7_.hitTestPoint(param2,param3,true))
                  {
                     _loc8_ = _loc7_ as MovieClip;
                     if(_loc8_ == null)
                     {
                        return _loc7_;
                     }
                     if(_loc8_.mouseEnabled)
                     {
                        _loc9_ = getDisplayObjectUnderCursor(_loc8_,param2,param3);
                        if(_loc9_ != null)
                        {
                           return _loc9_;
                        }
                     }
                  }
               }
            }
            _loc6_--;
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
