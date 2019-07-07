package component.display;

import ecx.AutoComp;

class Display<Color> extends AutoComp<DisplayData<Color>> {}

class DisplayData<Color> {
	public var alpha:Float;
	public var color:Color;
	public var init_color:Color;

	public var width:Int;
	public var height:Int;
	
    public function new() {}

	public function init(width:Int, height:Int, color:Color):Void {
		this.color = this.init_color = color;
		this.width = width;
		this.height = height;
	}
}