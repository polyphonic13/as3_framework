//
//  IEventCenter
//
//  Created by polyphonic13 on 2009-11-03.
//  Copyright (c) 2009 factor13. All rights reserved.
//
package com.factor13.framework.events
{
	public interface IEventCenter 
	{
		function addAListener(evt:String, listener:Function):void; 
		function removeAListener(evt:String, listener:Function):void; 
		function broadcast(evt:String):void;
	}
}