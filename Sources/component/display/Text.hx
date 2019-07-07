package component.display;

import ecx.AutoComp;

class Text<Font, Color> extends AutoComp<TextData<Font, Color>> {}

class TextData<Font, Color> {
	public var color:Color;
	public var size:Int;
	public var value:String;
	public var font:Font;

    public function new() {}

	public function init(text:String, color:Color, font:Font, size:Int):Void {
		this.value = text;
		this.size = size;
		this.font = font;
		this.color = color;
	}
}