package component.input.mouse;

import engine.Mouse.MouseButton;

class MouseJustReleased extends KeyBase<MouseButton> {
    public function new(input:Array<MouseButton>) {
		super(input);
    }
}