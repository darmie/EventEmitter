package;

/**
 * ...
 * @author Damilare Akinlaja
 */
class EventCallback
{
	@:isVar
	public var _args(get, set):Array <Dynamic>;
	
	@:isVar
	public var once(get, set):Bool;

	public function new():Void
	{
		
	}
	
	
	private function get_once():Bool
	{
		
		return this.once;
	}
	
	private function set_once(bool):Bool
	{
		
		this.once = bool;
		return this.once;
	}	
	
	
	private function get__args():Array<Dynamic>
	{
		if(this._args == null){
			this._args = [];
		}
		return this._args;
	}
	
	
	private function set__args(args):Array<Dynamic>
	{
		
		this._args = args;
		//trace(this._args);
		return this._args;
	}

	public dynamic function call():Void
	{
	}

}