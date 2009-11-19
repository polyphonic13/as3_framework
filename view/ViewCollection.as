//
//  ViewCollection
//
//  Created by polyphonic13 on 2009-11-05.
//  Copyright (c) 2009 factor13. All rights reserved.
//
package com.factor13.framework.view
{
	import flash.display.Sprite; 
	
	import com.factor13.framework.view.IView; 
	
	public class ViewCollection 
	{
		private static var _instance:ViewCollection; 
		
		private var _names:Object;
		private var _views:Array;
		private var _idx:int; 
		
		public function ViewCollection() {}
		
		public function init():void 
		{
			_names = new Object(); 
			_views = new Array(); 
			_idx = 0;
		}
		
		public function addView(view:Sprite, name:String):void 
		{
			_views.push(view); 
			_names[name] = _idx; 
			_idx++;
		}
		public function removeAll():void 
		{
			for(var key:String in _names)
			{
				_names[key] = null; 
			}
			for(var i:int = 0; i < _views.length; i++)
			{
				_views[i] = null; 
			} 
		}

		public function getView(str:String):Sprite 
		{
			return _views[_names[str]];
		}
		
		public function hasView(str:String):Boolean
		{
			if(typeof(_names[str]) != 'undefined') 
			{
				return true;
			}
			else
			{
				return false; 
			}
		}
	}
}