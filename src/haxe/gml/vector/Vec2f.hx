package gml.vector;

import gml.vector.Vec;
import gml.Nat;

@:forward
abstract Vec2f( Vecf<Two> ) from Vecf<Two> to Vecf<Two> {
    public function new( x, y ) { this = new Vecf<Two>( [x, y] ); }

    public var x(get, set): Float;
    public var y(get, set): Float;
    public var r(get, set): Float;
    public var g(get, set): Float;

    @:arrayAccess
    public inline function get( i: Int ): Float {
        return this.get( i );
    }

    @:arrayAccess
    public inline function set( i: Int, v: Float ): Float {
        return this.set( i, v );
    }

    public function get_x() {
        return this[0];
    }

    public function get_r() {
        return this[0];
    }

    public function get_y() {
        return this[1];
    }

    public function get_g() {
        return this[1];
    }

    public function set_x( x: Float ) {
        return this[0] = x;
    }

    public function set_r( r: Float ) {
        return this[0] = r;
    }

    public function set_y( y: Float ) {
        return this[1] = y;
    }

    public function set_g( g: Float ) {
        return this[1] = g;
    }
}
