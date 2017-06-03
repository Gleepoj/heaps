package h3d.impl;

import h3d.impl.Driver;
import dx.Driver;

class DirectXDriver extends h3d.impl.Driver {

	var driver : DriverInstance;

	public function new() {
		driver = Driver.create(@:privateAccess dx.Window.windows[0]);
		if( driver == null ) throw "Failed to initialize DirectX driver";
	}

	override function isDisposed() {
		return false;
	}

	override function init( onCreate : Bool -> Void, forceSoftware = false ) {
		haxe.Timer.delay(onCreate.bind(false), 1);
	}

	override function clear(?color:h3d.Vector, ?depth:Float, ?stencil:Int) {
		if( color != null )
			Driver.clearColor(color.r, color.g, color.b, color.a);
	}

	override function getDriverName(details:Bool) {
		var desc = "DirectX" + Driver.getSupportedVersion();
		if( details ) desc += " " + Driver.getDeviceName();
		return desc;
	}

	override public function present() {
		Driver.present();
	}

}