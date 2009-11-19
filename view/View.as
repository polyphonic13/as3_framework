//
//  View
//
//  Created by polyphonic13 on 2009-11-05.
//  Copyright (c) 2009 factor13. All rights reserved.
//
//	@extends Sprite
//	@implements com.factor13.framework.view.IView
// usage:
/*
	public class TestViewOne extends View
	{
		public function TestViewOne(name:String, tgt:Sprite)
		{
			super(name, tgt); 
			hide(); 
			_init(); 
			TestModel.getInstance().addEventListener(EventList.VIEWS_POSITIONED, _viewsPositioned); 
		}
	
		private function _init():void 
		{
			with(this.graphics)
			{
				beginFill(0x000000); 
				lineTo(50, 0); 
				lineTo(50, 50); 
				lineTo(0, 50); 
				lineTo(0, 0);
				endFill(); 
			}
			_initUI();
		}

		private function _viewsPositioned(evt:Event):void 
		{
			show(); 
			TestModel.getInstance().removeEventListener(EventList.VIEWS_POSITIONED, _viewsPositioned);
		}
	
		private function _initUI():void 
		{
			this.buttonMode = true;
			this.addEventListener(MouseEvent.CLICK, _onClick); 
		}
	
		private function _onClick(evt:MouseEvent):void 
		{
			_fireEvent(new Event(EventList.TEST_VIEW_ONE_CLICK)); 
		}

		private function _fireEvent(evt:Event):void
		{
			TestEventCenter.getInstance().dispatchEvent(event); 
		}
	}
*/
package com.factor13.framework.view
{
	import flash.display.Sprite; 
	import flash.geom.Point; 
	
	public class View extends Sprite implements IView
	{
		private var _name:String; 
		private var _tgt:Sprite
		private var _hidden:Boolean; 
		
		public function View(name:String, tgt:Sprite)
		{
			_name = name; 
			_tgt = tgt;
			_tgt.addChild(this); 

			_hidden = false; 
		}
		
		public function get view():Sprite { return this; } 

		public function show():void
		{
			if (_hidden) 
			{
				this.visible = true;
				_hidden = false
			}
		}

		public function hide():void
		{
			if (!_hidden) 
			{
				this.visible = false;
				_hidden = true;
			}
		}

		public function move(x:Number, y:Number):void
		{
			this.x = x;
			this.y = y;
		}

		public function get position():Point
		{
			return new Point(this.x, this.y);
		}

		public function setSize(w:Number, h:Number):void
		{
			this.width = w;
			this.height = h;
		}

		public function get size():Point
		{
			return new Point(this.width, this.height);
		}
	}
}