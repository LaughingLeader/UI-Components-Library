package LS_Classes
{
   import flash.geom.Rectangle;
   import flash.text.Font;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   
   public class textHelpers
   {
       
      
      public function textHelpers()
      {
         super();
      }
      
      public static function smallCaps(param1:TextField, param2:Number = 7, param3:Boolean = false) : void
      {
         var _loc9_:Array = null;
         var _loc10_:Number = NaN;
         var _loc11_:String = null;
         var _loc12_:String = null;
         var _loc13_:String = null;
         var _loc14_:String = null;
         var _loc4_:* = "";
         var _loc5_:TextFormat = param1.getTextFormat();
         var _loc6_:Number = Number(_loc5_.size);
         var _loc7_:Number = _loc6_ - param2;
         var _loc8_:String = param1.text;
         if(param3)
         {
            _loc9_ = _loc8_.split(" ");
            _loc10_ = 0;
            while(_loc10_ < _loc9_.length)
            {
               _loc11_ = _loc9_[_loc10_].charAt(0).toUpperCase();
               _loc12_ = _loc9_[_loc10_].slice(1).toUpperCase();
               _loc4_ = _loc4_ + (_loc11_ + "<font size=\'" + _loc7_ + "\'>" + _loc12_ + "</font>");
               _loc4_ = _loc4_ + " ";
               _loc10_++;
            }
         }
         else
         {
            _loc13_ = _loc8_.charAt(0).toUpperCase();
            _loc14_ = _loc8_.slice(1).toUpperCase();
            _loc4_ = _loc4_ + (_loc13_ + "<font size=\'" + _loc7_ + "\'>" + _loc14_ + "</font>");
         }
         param1.htmlText = _loc4_;
      }
      
      public static function setFormattedText(param1:TextField, param2:String, param3:String = "$Title_Bold", param4:String = "$Title_Italic") : void
      {
         var _loc5_:Class = getDefinitionByName(param3) as Class;
         var _loc6_:Class = getDefinitionByName(param4) as Class;
         var _loc7_:Font = new _loc5_();
         var _loc8_:Font = new _loc6_();
         var _loc9_:TextFormat = param1.getTextFormat();
         _loc9_.font = _loc8_.fontName;
         var _loc10_:TextFormat = param1.getTextFormat();
         _loc10_.font = _loc7_.fontName;
         param1.htmlText = param2;
         var _loc11_:Array = getTags(param2);
         var _loc12_:int = 0;
         var _loc13_:uint = 0;
         while(_loc13_ < _loc11_.length)
         {
            switch(_loc11_[_loc13_].tagStr)
            {
               case "<b>":
                  _loc12_ = findNextTag("</b>",_loc13_,_loc11_);
                  if(_loc12_ > 0 && _loc12_ < _loc11_.length)
                  {
                     param1.setTextFormat(_loc10_,_loc11_[_loc13_].charPos,_loc11_[_loc12_].charPos);
                  }
                  break;
               case "<i>":
                  _loc12_ = findNextTag("</i>",_loc13_,_loc11_);
                  if(_loc12_ > 0 && _loc12_ < _loc11_.length)
                  {
                     param1.setTextFormat(_loc9_,_loc11_[_loc13_].charPos,_loc11_[_loc12_].charPos);
                  }
            }
            _loc13_++;
         }
      }
      
      private static function findNextTag(param1:String, param2:uint, param3:Array) : int
      {
         var _loc4_:uint = param2;
         while(_loc4_ < param3.length)
         {
            if(param3[_loc4_].tagStr == param1)
            {
               return _loc4_;
            }
            _loc4_++;
         }
         return -1;
      }
      
      private static function getTags(param1:String) : Array
      {
         var _loc6_:Object = null;
         var _loc2_:Array = new Array();
         var _loc3_:int = 0;
         var _loc4_:int = param1.indexOf("<",_loc3_);
         var _loc5_:int = 0;
         while(_loc4_ != -1)
         {
            _loc3_ = _loc4_;
            _loc4_ = param1.indexOf(">",_loc3_);
            _loc6_ = new Object();
            _loc6_.tagStr = param1.substr(_loc3_,_loc4_ - _loc3_ + 1);
            _loc6_.charPos = _loc3_ - _loc5_;
            _loc2_.push(_loc6_);
            _loc5_ = _loc5_ + _loc6_.tagStr.length;
            _loc3_ = _loc4_;
            _loc4_ = param1.indexOf("<",_loc3_);
         }
         return _loc2_;
      }
      
      public static function trim(param1:String) : String
      {
         var _loc2_:Number = 0;
         while(param1.charAt(_loc2_) == " ")
         {
            _loc2_ = _loc2_ + 1;
         }
         param1 = param1.substring(_loc2_);
         var _loc3_:Number = param1.length;
         _loc3_--;
         while(param1.charAt(_loc3_) == " ")
         {
            _loc3_--;
         }
         param1 = param1.substring(0,_loc3_ + 1);
         return param1;
      }
      
      public static function getLongestWordLength(param1:TextField) : Number
      {
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:String = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Boolean = false;
         var _loc10_:Rectangle = null;
         var _loc11_:Rectangle = null;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc2_:Number = 0;
         if(param1.text.length > 0)
         {
            _loc3_ = param1.multiline;
            _loc4_ = param1.wordWrap;
            _loc5_ = param1.autoSize;
            param1.multiline = false;
            param1.autoSize = TextFieldAutoSize.LEFT;
            _loc6_ = 0;
            _loc7_ = 0;
            _loc8_ = 0;
            _loc9_ = false;
            while(_loc6_ != -1)
            {
               _loc7_ = _loc6_;
               _loc6_ = param1.text.indexOf(" ",_loc7_ + 1);
               if(_loc6_ == -1)
               {
                  _loc6_ = param1.text.length;
                  _loc9_ = true;
               }
               if(_loc6_ != -1 && _loc7_ != -1)
               {
                  _loc10_ = param1.getCharBoundaries(_loc6_ - 1);
                  if(_loc10_)
                  {
                     _loc11_ = param1.getCharBoundaries(_loc7_);
                     if(_loc11_)
                     {
                        _loc12_ = _loc10_.right;
                        _loc13_ = _loc11_.right;
                        if(_loc7_ == 0)
                        {
                           _loc13_ = _loc11_.left;
                        }
                        _loc8_ = _loc12_ - _loc13_;
                        if(_loc8_ > _loc2_)
                        {
                           _loc2_ = _loc8_;
                        }
                     }
                  }
               }
               if(_loc9_)
               {
                  _loc6_ = -1;
               }
            }
            if(_loc2_ == 0)
            {
               _loc2_ = param1.textWidth;
            }
            param1.multiline = _loc3_;
            param1.wordWrap = _loc4_;
            param1.autoSize = _loc5_;
         }
         return Math.ceil(_loc2_);
      }
      
      public static function firstLetterUpperCase(param1:String) : String
      {
         var _loc4_:* = null;
         var _loc2_:Array = param1.split(" ");
         var _loc3_:Array = [];
         for(_loc4_ in _loc2_)
         {
            _loc3_.push(_loc2_[_loc4_].charAt(0).toUpperCase() + _loc2_[_loc4_].slice(1));
         }
         return _loc3_.join(" ");
      }
   }
}
