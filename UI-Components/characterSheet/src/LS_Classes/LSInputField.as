package LS_Classes
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   
   public class LSInputField extends MovieClip
   {
       
      
      public var plus_mc:LSButton;
      
      public var minus_mc:LSButton;
      
      public var value_txt:TextField;
      
      private var m_disabled:Boolean = false;
      
      public var selectionHL_mc:MovieClip;
      
      public var m_stepSize:Number = 1;
      
      public var m_disabledAlpha:Number = 0.4;
      
      public var m_callbackAllowed:Boolean = true;
      
      private var m_value:int = 0;
      
      private var m_max:int = 100;
      
      private var m_min:int = 0;
      
      private var m_onValueChanged:Function = null;
      
      public function LSInputField()
      {
         super();
         if(this.minus_mc)
         {
            this.minus_mc.init(this.minusPressed);
         }
         if(this.plus_mc)
         {
            this.plus_mc.init(this.plusPressed);
         }
         if(this.value_txt)
         {
            this.value_txt.text = "" + this.m_value;
            this.value_txt.selectable = true;
            this.value_txt.restrict = "0-9";
            this.value_txt.maxChars = 8;
            this.value_txt.htmlText = "" + this.value;
            this.value_txt.addEventListener(FocusEvent.FOCUS_OUT,this.onFocusLosed);
         }
         if(this.selectionHL_mc)
         {
            this.selectionHL_mc.visible = false;
         }
         this.checkDisabledButtons();
      }
      
      private function removeChildrenOf(param1:MovieClip) : void
      {
         var _loc2_:int = 0;
         if(param1.numChildren != 0)
         {
            _loc2_ = param1.numChildren;
            while(_loc2_ > 0)
            {
               _loc2_--;
               param1.removeChildAt(_loc2_);
            }
         }
      }
      
      public function setOnValueChangedCallback(param1:Function) : *
      {
         this.m_onValueChanged = param1;
      }
      
      public function set canManuallyChangeValue(param1:Boolean) : *
      {
         this.value_txt.type = !!param1?TextFieldType.INPUT:TextFieldType.DYNAMIC;
         if(param1)
         {
            this.value_txt.addEventListener(Event.CHANGE,this.onTextChanged);
            this.value_txt.addEventListener(FocusEvent.FOCUS_IN,this.onSelect);
         }
         else
         {
            this.value_txt.removeEventListener(Event.CHANGE,this.onTextChanged);
            this.value_txt.removeEventListener(FocusEvent.FOCUS_IN,this.onSelect);
         }
      }
      
      public function get value() : Number
      {
         return this.m_value;
      }
      
      public function set value(param1:Number) : *
      {
         if(this.m_value != param1)
         {
            if(this.m_max > 0 && param1 > this.m_max)
            {
               param1 = this.m_max;
            }
            else if(param1 < this.m_min)
            {
               param1 = this.m_min;
            }
            this.m_value = param1;
            if(this.value_txt)
            {
               this.value_txt.text = "" + param1;
            }
            if(this.m_callbackAllowed)
            {
               dispatchEvent(new Event(Event.CHANGE));
               if(this.m_onValueChanged != null)
               {
                  this.m_onValueChanged(this.value);
               }
            }
            this.checkDisabledButtons();
         }
      }
      
      public function setValueWithoutCallback(param1:Number) : *
      {
         this.m_callbackAllowed = false;
         this.value = param1;
         this.m_callbackAllowed = true;
      }
      
      public function set minimum(param1:Number) : *
      {
         this.m_min = param1;
         this.checkDisabledButtons();
      }
      
      public function get minimum() : Number
      {
         return this.m_min;
      }
      
      public function set maximum(param1:Number) : *
      {
         this.m_max = param1;
         this.checkDisabledButtons();
      }
      
      public function get maximum() : Number
      {
         return this.m_max;
      }
      
      public function set stepSize(param1:Number) : *
      {
         this.m_stepSize = param1;
         this.checkDisabledButtons();
      }
      
      public function get stepSize() : Number
      {
         return this.m_stepSize;
      }
      
      public function get maxChars() : Number
      {
         if(this.value_txt)
         {
            return this.value_txt.maxChars;
         }
         return 0;
      }
      
      public function set maxChars(param1:Number) : *
      {
         if(this.value_txt)
         {
            this.value_txt.maxChars = param1;
         }
      }
      
      public function set disabled(param1:Boolean) : void
      {
         this.m_disabled = param1;
         this.canManuallyChangeValue = !param1;
         if(this.value_txt)
         {
            this.value_txt.alpha = !!this.m_disabled?Number(this.m_disabledAlpha):Number(1);
         }
         this.checkDisabledButtons();
      }
      
      public function get disabled() : Boolean
      {
         return this.m_disabled;
      }
      
      private function checkDisabledButtons() : *
      {
         if(this.minus_mc)
         {
            this.minus_mc.setEnabled(this.m_value - this.m_stepSize >= this.m_min && !this.m_disabled);
         }
         if(this.plus_mc)
         {
            this.plus_mc.setEnabled((this.m_value + this.m_stepSize <= this.m_max || this.m_max < 0) && !this.m_disabled);
         }
      }
      
      private function minusPressed() : *
      {
         this.value = this.value - this.m_stepSize;
      }
      
      private function plusPressed() : *
      {
         this.value = this.value + this.m_stepSize;
      }
      
      private function onFocusLosed(param1:FocusEvent) : *
      {
         this.value = int(this.value_txt.text);
         if(this.selectionHL_mc && this.selectionHL_mc.visible)
         {
            this.selectionHL_mc.visible = false;
         }
      }
      
      private function onTextChanged(param1:Event) : *
      {
         var _loc2_:int = int(this.value_txt.text);
         if(this.m_max > 0 && _loc2_ > this.m_max)
         {
            _loc2_ = this.m_max;
            this.value_txt.htmlText = String(this.m_max);
         }
         else if(_loc2_ < this.m_min)
         {
            _loc2_ = this.m_min;
            this.value_txt.htmlText = String(this.m_min);
         }
         this.m_value = _loc2_;
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function onSelect(param1:FocusEvent) : *
      {
         if(this.selectionHL_mc && !this.m_disabled)
         {
            this.selectionHL_mc.visible = true;
         }
      }
      
      private function btnUp(param1:Event) : *
      {
         if(!this.m_disabled)
         {
            param1.currentTarget.gotoAndStop(1);
         }
      }
   }
}
