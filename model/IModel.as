//
//  IModel
//
//  Created by polyphonic13 on 2009-11-03.
//  Copyright (c) 2009 factor13. All rights reserved.
//
package com.factor13.framework.model
{
	import flash.events.Event; 
	import flash.display.Sprite; 
	
	public interface IModel 
	{
		function get name():String; 
		function get displayParent():Sprite; 
		function set displayParent(spr:Sprite):void; 
		
		function notifyOfEvent(evt:Event):void;
		function addEventListener(evt:String, listener:Function):void;
		function removeEventListener(evt:String, listener:Function):void; 
		//function addListener():void;
		
	}
}