//
//  IView
//
//  Created by polyphonic13 on 2009-11-05.
//  Copyright (c) 2009 factor13. All rights reserved.
//
package com.factor13.framework.view
{
	import flash.display.Sprite; 
	import flash.geom.Point; 
	
	public interface IView 
	{
		function get view():Sprite;
		function show():void;
		function hide():void;
		function move(x:Number, y:Number):void;
		function get position():Point;
		function setSize(w:Number, h:Number):void;
		function get size():Point;
//		function get viewName():void;
	}
}