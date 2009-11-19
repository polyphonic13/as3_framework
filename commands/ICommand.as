//
//  ICommand
//
//  Created by polyphonic13 on 2009-11-03.
//  Copyright (c) 2009 factor13. All rights reserved.
//
package com.factor13.framework.commands
{
	import flash.events.Event; 
	
	public interface ICommand
	{
		function execute(evt:Event):void; 
	}
}
