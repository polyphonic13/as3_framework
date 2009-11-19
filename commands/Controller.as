//
//  Controller
//	
//  Created by polyphonic13 on 2009-11-03.
//  Copyright (c) 2009 factor13. All rights reserved.
//
//	@extends EventDispatcher
//	@implements com.factor13.framework.commands.IController
//
//  simple base class to be extended in each mvc project. 
//	used in conjunction framework's EventCenter class. 
//	1. creates instance of framework.data.CommandBucket to store 
//	each ICommand class added to controller via addCommand method
//	2. adds listeners to EventCenter for each ICommand added.
//	3. responds to EventCenter dispatched events by calling 
// 	related ICommand's execute method, after retrieving from
//  CommandBucket.
// 
//	usage: 
/*
		public class TestController extends Controller
		{
			public function TestController(evtCtr:EventCenter)
			{
				super(evtCtr); 
				_init(); 
			}
	
			private function _init():void 
			{
				addCommand(EventList.TEST_EVENT_ONE, new TestCommandOne()); 
				addCommand(EventList.TEST_EVENT_TWO, new TestCommandTwo()); 
		
				addCommand(EventList.BUILD_VIEWS, new BuildViews()); 
				addCommand(EventList.VIEW_CREATED, new ViewCreated()); 
				addCommand(EventList.POSITION_VIEWS, new PositionViews()); 
		
				addCommand(EventList.TEST_VIEW_ONE_CLICK, new TestViewOneClick());
				addCommand(EventList.TEST_VIEW_TWO_CLICK, new TestViewTwoClick());
			}
		}
*/
// 
package com.factor13.framework.commands
{
	import flash.events.EventDispatcher; 
	import flash.events.Event; 
	
	import com.factor13.framework.commands.ICommand;
	import com.factor13.framework.data.CommandBucket;
	import com.factor13.framework.events.EventCenter; 
	
	public class Controller extends EventDispatcher implements IController
	{
		private var _evtCtr:EventCenter;
		private var _bucket:CommandBucket; 
		
		/**
		 * @param evtCtr:EventCenter - assigned to private 
		 * _evtCtr member
		 * instantiates _bucket as new CommandBucket
		 */
		public function Controller(evtCtr:EventCenter)
		{
			//trace("Controller/constructor"); 
			_evtCtr = evtCtr;
			_bucket = new CommandBucket(); 
		}

		/**
		 * @param str:String - command name
		 * @param cmd:ICommand - ICommand instance
		 * passes to addCommand method of _bucket
		 * adds event listener to _evtCtr for str event type
		 */
		public function addCommand(str:String, cmd:ICommand):void
		{
			//trace("Controller/addCommand, str = " + str + ", cmd = " + cmd); 
			_bucket.addCommand(str, cmd); 
			_evtCtr.addEventListener(str, _handleEvent);
		}

		/**
		 * calls _bucket's removeAllCommands method.
		 * sets _bucket to null.
		 */
		public function cleanUp():void 
		{
			_bucket.removeAllCommands(); 
			_bucket = null;
		}
		
		/**
		 * @param evt:Event - event listened to
		 * calls _executeCommand passign event
		 */
		private function _handleEvent(evt:Event):void
		{
			_executeCommand(evt); 
		}
		
		/**
		 * @param evt:Event - event responding to
		 * checks _bucket hasCommand method, passing String
		 * value of evt.type
		 * if true, calls command's execute method, passing 
		 * event, via _getCommand local utility method
		 */
		private function _executeCommand(evt:Event):void
		{
			//trace("Controller/_executeCommand, evt.type = " + evt.type);
			
			if(typeof(evt.type) != 'undefined') 
			{
				var str:String = String(evt.type);
				//trace("\t_bucket.hasCommand("+str+") = " + _bucket.hasCommand(str)); 
				if(_bucket.hasCommand(str))
				{
					_getCommand(str).execute(evt); 
				}
				else
				{
					trace("ERROR: Controller/_executeCommand: !_bucket.hasCommand("+str+")");
				}
			}
			else
			{
				trace("ERROR: Controller/_executeCommand: evt.type == undefined"); 
			}
		}
		
		/**
		 * @param str:String - String value of command's related 
		 * evt.type
		 * @return ICommand - returned from _bucket's getCommand
		 * method (passed str)
		 */
		private function _getCommand(str:String):ICommand
		{
			return _bucket.getCommand(str); 
		}	
	}
}