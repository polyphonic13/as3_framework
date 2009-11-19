//
//  Command
//	
//  Created by polyphonic13 on 2009-11-03.
//  Copyright (c) 2009 factor13. All rights reserved.
//
//	@implements com.factor13.framework.commands.ICommand
//
//	abstract class to be extend by each concrete command
//	class. 
//	utilizes overridable execute method.
//
//	usage: 
/*
	public class TestCommandOne extends Command
	{
		public override function execute(evt:Event):void 
		{
			var loadEvent:LoadEvent = LoadEvent(event); 

			trace("\tloadEvent.message = " + loadEvent.message
				+ "\n\tloadEvent.idx = " + loadEvent.idx
				+ "\n\tloadEvent.value = " + loadEvent.value);
		}
	}
*/
package com.factor13.framework.commands
{
	import flash.events.Event; 

	public class Command implements ICommand
	{
		/**
		 * @param evt:Event - to respond / execute
		 * according to
		 */
		public function execute(evt:Event):void 
		{
			//trace("Command/execute, evt.type = " + evt.type);
		}
	}
}