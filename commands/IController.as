//
//  IController
//
//  Created by polyphonic13 on 2009-11-03.
//  Copyright (c) 2009 factor13. All rights reserved.
//
package com.factor13.framework.commands
{
	public interface IController
	{
		function addCommand(str:String, cmd:ICommand):void;
		//function removeCommand(cmd:ICommand):void;
	}
}