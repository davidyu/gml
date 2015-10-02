package gml.matrix;

import gml.matrix.Matrix;

@:forward(get, set)
abstract Mat2( Matrix<Float> ) from Matrix<Float> to Matrix<Float> {
    public function new( r00, r01, r10, r11 ) {
        this = new Matrix<Float>( 2, 2, [ r00, r01, r10, r11 ] );
    }

    public var r00(get, set): Float;
    public var r01(get, set): Float;
    public var r10(get, set): Float;
    public var r11(get, set): Float;

    @:arrayAccess
    public inline function get_flat( i: Int ): Float {
        return this[i];
    }

    @:arrayAccess
    public inline function set_flat( i: Int, v: Float ) {
        this[i] = v;
    }

    public function get_r00() {
        return this[0];
    }

    public function set_r00( r00: Float ) {
        return this[0] = r00;
    }

    public function get_r01() {
        return this[1];
    }

    public function set_r01( r01: Float ) {
        return this[1] = r01;
    }

    public function get_r10() {
        return this[2];
    }

    public function set_r10( r10: Float ) {
        return this[2] = r10;
    }

    public function get_r11() {
        return this[3];
    }

    public function set_r11( r11: Float ) {
        return this[3] = r11;
    }
}
