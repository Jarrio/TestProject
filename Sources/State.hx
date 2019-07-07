package;

class State {
	public var grid:Int;
	public var score:Int;
	public var started:Bool;
	public var highest_tile:Int;
	public var tile_width:Int;

    public function new(grid:Int = 4) {
        this.grid = grid;
		this.tile_width = 50;
    }
}