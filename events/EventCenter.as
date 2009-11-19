//
//  EventCenter
//
//  Created by polyphonic13 on 2009-11-03.
//  Copyright (c) 2009 factor13. All rights reserved.
//
package com.factor13.framework.events
{
	import flash.events.EventDispatcher; 
	
	public class EventCenter extends EventDispatcher
	{
		private static var _instance:EventCenter; 
		
		public function EventCenter() {}
		
		public static function getInstance():EventCenter
		{
			if(_instance == null) 
			{
				_instance = new EventCenter(); 
			} 
			return _instance; 
		}
		
		public static function killInstance():void 
		{
			_instance = null;
		} 
	}
}