package component.input.mouse;

import engine.Mouse.MouseButton;

class MousePressed extends KeyBase<MouseButton> {
    public function new(input:Array<MouseButton>) {
		super(input);
    }
}