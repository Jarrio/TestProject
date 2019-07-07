package component;

import ecx.AutoComp;

class Vector extends AutoComp<VectorData> {}

class VectorData {
    public var x:Float;
	public var y:Float;
    public var max_x:Float;
	public var max_y:Float;
	
	public function new() {}
	
	public function init(x:Float, y:Float, max_x:Float = 0, max_y:Float = 0) {
		this.x = x;
		this.y = y;
		this.max_x = max_x;
		this.max_y = max_y;
	}
	
}