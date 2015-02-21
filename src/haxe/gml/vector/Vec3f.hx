package gml.vector;

import gml.Nat;
import gml.vector.Vec;
import gml.vector.Vec2f;

@:forward
abstract Vec3f( Vecf<Three> ) from Vecf<Three> to Vecf<Three> {
    public function new( x, y, z ) { this = new Vecf<Three>( [x, y, z] ); }

    public var x(get, set): Float;
    public var y(get, set): Float;
    public var z(get, set): Float;
    public var r(get, set): Float;
    public var g(get, set): Float;
    public var b(get, set): Float;

    public var xy(get, never): Vec2f;

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

    public function get_z() {
        return this[2];
    }

    public function get_b() {
        return this[2];
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

    public function set_z( z: Float ) {
        return this[2] = z;
    }

    public function set_b( b: Float ) {
        return this[2] = b;
    }

    public function get_xy() {
        return new Vec2f( this[0], this[1] );
    }
}
