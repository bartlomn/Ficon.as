/**
 * Fortrus Mobius v2.0
 * User: Bart
 * Date: 02/11/2013
 * Time: 18:59
 * Description:
 */

package com.bnowak.integration.ficon
{
import com.ficon.FiconSprite;
import com.greensock.TweenMax;

import spark.components.Group;
import spark.layouts.HorizontalLayout;

public class UIIcon extends Group
{

   /**
    *  Reference to the static method of the given icon library
    */
   public var iconMethod : Function;
   /**
    *  icon properties object
    */
   public var iconProperties : Object;
   /**
    *  @private
    *  internal ficon sprite reference
    */
   private var _ficon : FiconSprite;

   /**
    *  Constructor
    */
   public function UIIcon()
   {
      super();
   }

   /**
    *  @private
    */
   private var _iconColor:uint;

   /**
    *  @private
    */
   private var _iconColorDirty:Boolean;

   /**
    *  icon color
    */
   public function get iconColor():uint
   {
      return _iconColor;
   }

   /**
    *  icon color
    */
   public function set iconColor(value:uint):void
   {
      if( value != _iconColor )
      {
         _iconColor = value;
         _iconColorDirty = true;
         invalidateDisplayList();
      }
   }


   /**
    *  @private
    */
   override public function get measuredWidth() : Number
   {
      return measuredHeight;
   }

   /**
    *  @private
    */
   override public function get measuredHeight() : Number
   {
      return _ficon ?
                  _ficon.height :
                  0;
   }

   /**
    *  @private
    */
   override protected function createChildren() : void
   {
      super.createChildren();
      if ( !_ficon && iconMethod )
      {
         _ficon = iconMethod.call( null, iconProperties );
         addElement( _ficon );
      }
   }

   /**
    *  @private
    */
   override protected function updateDisplayList( unscaledWidth : Number, unscaledHeight : Number ) : void
   {
      super.updateDisplayList( unscaledWidth, unscaledHeight );
      if ( _ficon )
      {
         _ficon.height = unscaledHeight;
         _ficon.y = unscaledHeight / - 5;
         if( _iconColorDirty )
         {
            TweenMax.to( this, .1, {tint: iconColor});
         }
      }

   }
}
}
