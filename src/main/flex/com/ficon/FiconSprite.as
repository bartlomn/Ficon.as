package com.ficon
{
import flash.text.engine.TextLine;

import org.casalib.util.ColorUtil;

import spark.core.SpriteVisualElement;

public class FiconSprite extends SpriteVisualElement
{

   /**
    *  @private
    */
   private static const OFFSET_FACTOR:Number = .115;

   /**
    *  @private
    */
   private var _size:Number;

   /**
    *  @private
    */
   private var _icon : TextLine;

   /**
    *  @inheritDoc
    */
   public override function get width() : Number
   {
      return _size;
   }
   /**
    *  @inheritDoc
    */
   override public function set width( value : Number ) : void
   {
      null;
   }


   /**
    *  @inheritDoc
    */
   public override function get height() : Number
   {
      return _size;
   }
   /**
    *  @inheritDoc
    */
   override public function set height( value : Number ) : void
   {
      _size = value;
      if( !_icon )
         return;
      _icon.scaleX = _icon.scaleY = value;
      _icon.y = value - (( OFFSET_FACTOR * 2 ) * value );
      _icon.x =  ( OFFSET_FACTOR / 2 ) * value;
      graphics.clear();
      graphics.beginFill( 0xFF0000, 0 );
      graphics.drawRect( 0, 0, value, value );

      invalidateParentSizeAndDisplayList();
   }


   /**
    *  Constructor
    */
   public function FiconSprite( icon : TextLine )
   {
      height = 1;
      _icon = icon;
      addChild( icon );
      super();
   }


   /**
    *  @private
    */
   public function set color( color:uint ):void
   {
      if( isNaN( color ) || !_icon )
         return;

      ColorUtil.tint( _icon, color, 1 );
   }

   /**
    *  @inheritDoc
    */
   override public function setLayoutBoundsSize(
         width : Number, height : Number, postLayoutTransform : Boolean = true ) : void
   {
      if( isNaN( height ) )
         return;
      this.height = height;
   }

}
}
