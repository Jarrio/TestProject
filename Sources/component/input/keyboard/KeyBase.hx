package component.input.keyboard;

class KeyBase<KeyCode:Int> {
	public var active:Map<KeyCode, Bool>;

	public function new() {
		this.active = [];
	}
	
	public function init(keys:Array<KeyCode>):Void {		
		for (key in keys) {
			this.active.set(key, false);
		}
	}
}