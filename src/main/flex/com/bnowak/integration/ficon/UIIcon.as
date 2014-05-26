/**
 * User: Bart
 * Date: 02/11/2013
 * Time: 18:59
 * Description:
 */

package com.bnowak.integration.ficon
{
import com.ficon.FiconSprite;

import spark.components.Group;

public class UIIcon extends Group
{

   /**
    *  @private
    */
   private var _iconMethod:Function;

   /**
    *  @private
    */
   private var _iconMethodDirty:Boolean;

   /**
    *  Reference to the static method of the given icon library
    */
   public function get iconMethod():Function
   {
      return _iconMethod;
   }

   /**
    *  @private
    */
   public function set iconMethod( value:Function ):void
   {
      if( _iconMethod != value )
      {
         _iconMethod = value;
         _iconMethodDirty = true;
         invalidateProperties();
      }
   }

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
   override protected function commitProperties():void
   {
      super.commitProperties();
      if( _iconMethodDirty )
      {
         if( _ficon && containsElement( _ficon ))
            removeElement( _ficon );
         if ( iconMethod != null )
         {
            _ficon = iconMethod.call( null, iconProperties );
            addElement( _ficon );
         }
         invalidateDisplayList();
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
         _ficon.setLayoutBoundsSize( unscaledHeight, unscaledHeight );
         if( !isNaN( iconColor ));
            _ficon.color = iconColor;
      }

   }
}
}
