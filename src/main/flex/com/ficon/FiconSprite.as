package com.ficon
{
import flash.text.engine.TextLine;

import spark.core.SpriteVisualElement;

public class FiconSprite extends SpriteVisualElement
{
   public var icon : TextLine;
   public var proportionalScaling : Boolean = true;

   public function FiconSprite( icon : TextLine )
   {
      this.icon = icon;

      icon.scaleX = icon.scaleY = icon.totalHeight / icon.ascent;

      icon.x = 0;
      icon.y = icon.totalHeight;

      addChild( icon );
   }

   public override function get height() : Number
   {
      return this.scaleY * icon.totalHeight;
   }

   public override function set height( height : Number ) : void
   {
      this.scaleY = height / icon.totalHeight;

      if ( proportionalScaling )
         this.scaleX = this.scaleY;
   }

   public override function set width( width : Number ) : void
   {
      super.width = width;

      if ( proportionalScaling )
         this.scaleY = this.scaleX;
   }
}
}
