//
//  Model
//
//  Created by polyphonic13 on 2009-11-03.
//  Copyright (c) 2009 factor13. All rights reserved.
//
// @implements com.factor13.framework.model.IModel
//
// usage:
/*
	public class TestModel extends Model
	{

		private static var _instance:TestModel; 
	
		private var _obj:Object; 
		private var _message:String = ""; 
		private var _idx:int = 0; 
		private var _value:Number = 0; 
		private var _viewsCreated:int = 0;
		private var _totalViews:int = 2; 
	
		public function TestModel(modelName:String = "TestModel")
		{
			super(modelName); 
			_instance = this;
		}
	
		public static function getInstance():TestModel
		{
			if(_instance == null)
			{
				_instance = new TestModel();
			}
			return _instance; 
		}
	
		public static function killInstance():void 
		{
			_instance = null; 
		}
	
		public function init(obj:Object):void
		{
			_obj = obj;
		}
	
		public function get obj():Object { return _obj; }
	
		public function get message():String { return _message; } 
		public function set message(str:String):void { _message = str; }
	
		public function get idx():int { return _idx; } 
		public function set idx(num:int):void { _idx = num; } 
	
		public function get value():Number { return _value; } 
		public function set value(num:Number):void { _value = num; }
	
		public function get viewsCreated():int { return _viewsCreated; } 
		public function set viewsCreated(num:int):void { _viewsCreated = num; } 
	
		public function get totalViews():int { return _totalViews; }
	
	}
*/
package com.factor13.framework.model
{
	import flash.display.Sprite;
	import flash.events.Event; 
	
	import com.factor13.framework.events.EventCenter; 
	
	public class Model implements IModel
	{
		private var _displayParent:Sprite;
		private var _evtCenter:EventCenter; 
		private var _modelName:String; 
		private var _evtCenterSet:Boolean; 
		
		public function Model(modelName:String):void 
		{
			_modelName = modelName;
			_evtCenterSet = false;
		}
		
		public function set eventCenter(evtCenter:EventCenter):void 
		{
			_evtCenter = evtCenter; 
			_evtCenterSet = true;
		}
			
		public function get name():String { return _modelName; } 
		public function get displayParent():Sprite { return _displayParent; } 
		public function set displayParent(spr:Sprite):void { _displayParent = spr; }
		
		public function notifyOfEvent(evt:Event):void
		{
			if(_evtCenterSet)
			{
				_evtCenter.dispatchEvent(evt); 
			}
			else
			{
				trace("ERROR: _evtCenter not set"); 
			}
		}
		
		public function addEventListener(evt:String, listener:Function):void 
		{
			if(_evtCenterSet) 
			{
				_evtCenter.addEventListener(evt, listener); 
			}
			else
			{
				trace("ERROR: _evtCenter not set");
			}
		}
		
		public function removeEventListener(evt:String, listener:Function):void 
		{
			if(_evtCenterSet)
			{
				_evtCenter.removeEventListener(evt, listener);
			}
			else
			{
				trace("ERROR: _evtCenter not set"); 
			}
		}
	}
}