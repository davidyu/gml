package gml.matrix;

import gml.matrix.Matrix;

@:forward(get, set)
abstract Mat3( Matrix<Float> ) from Matrix<Float> to Matrix<Float> {
    public function new( r00, r01, tx, r10, r11, ty, m20, m21, tz ) {
        this = new Matrix<Float>( 3, 3, [ r00, r01, tx, r10, r11, ty, m20, m21, tz ] );
    }

    public var r00(get, set): Float;
    public var r01(get, set): Float;
    public var r10(get, set): Float;
    public var r11(get, set): Float;
    public var m20(get, set): Float;
    public var m21(get, set): Float;
    public var tx(get, set): Float;
    public var ty(get, set): Float;
    public var tz(get, set): Float;

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
        return this[3];
    }

    public function set_r10( r10: Float ) {
        return this[3] = r10;
    }

    public function get_r11() {
        return this[4];
    }

    public function set_r11( r11: Float ) {
        return this[4] = r11;
    }

    public function get_m20() {
        return this[6];
    }

    public function set_m20( m20: Float ) {
        return this[6] = m20;
    }

    public function get_m21() {
        return this[7];
    }

    public function set_m21( m21: Float ) {
        return this[7] = m21;
    }

    public function get_tx() {
        return this[2];
    }

    public function set_tx( tx: Float ) {
        return this[2] = tx;
    }

    public function get_ty() {
        return this[5];
    }

    public function set_ty( ty: Float ) {
        return this[5] = ty;
    }

    public function get_tz() {
        return this[8];
    }

    public function set_tz( tz: Float ) {
        return this[8] = tz;
    }
}
