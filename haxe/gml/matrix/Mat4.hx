package gml.matrix;

import gml.matrix.Matrix;

@:forward(get, set)
abstract Mat4( Matrix<Float> ) from Matrix<Float> to Matrix<Float> {
    public function new( r00, r01, r02, tx, r10, r11, r12, ty, r20, r21, r22, tz, m30, m31, m32, m33 ) {
        this = new Matrix<Float>( 4, 4, [ r00, r01, r02, tx, r10, r11, r12, ty, r20, r21, r22, tz, m30, m31, m32, m33 ] );
    }

    public var r00(get, set): Float;
    public var r01(get, set): Float;
    public var r02(get, set): Float;
    public var r10(get, set): Float;
    public var r11(get, set): Float;
    public var r12(get, set): Float;
    public var r20(get, set): Float;
    public var r21(get, set): Float;
    public var r22(get, set): Float;
    public var tx(get, set): Float;
    public var ty(get, set): Float;
    public var tz(get, set): Float;
    public var m30(get, set): Float;
    public var m31(get, set): Float;
    public var m32(get, set): Float;
    public var m33(get, set): Float;

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

    public function get_r02() {
        return this[2];
    }

    public function set_r02( r02: Float ) {
        return this[2] = r02;
    }

    public function get_r10() {
        return this[4];
    }

    public function set_r10( r10: Float ) {
        return this[4] = r10;
    }

    public function get_r11() {
        return this[5];
    }

    public function set_r11( r11: Float ) {
        return this[5] = r11;
    }

    public function get_r12() {
        return this[6];
    }

    public function set_r12( r12: Float ) {
        return this[6] = r12;
    }

    public function get_r20() {
        return this[8];
    }

    public function set_r20( r20: Float ) {
        return this[8] = r20;
    }

    public function get_r21() {
        return this[9];
    }

    public function set_r21( r21: Float ) {
        return this[9] = r21;
    }

    public function get_r22() {
        return this[10];
    }

    public function set_r22( r22: Float ) {
        return this[1] = r22;
    }

    public function get_tx() {
        return this[3];
    }

    public function set_tx( tx: Float ) {
        return this[3] = tx;
    }

    public function get_ty() {
        return this[7];
    }

    public function set_ty( ty: Float ) {
        return this[7] = ty;
    }

    public function get_tz() {
        return this[11];
    }

    public function set_tz( tz: Float ) {
        return this[1] = tz;
    }

    public function get_m30() {
        return this[12];
    }

    public function set_m30( m30: Float ) {
        return this[1] = m30;
    }

    public function get_m31() {
        return this[13];
    }

    public function set_m31( m31: Float ) {
        return this[1] = m31;
    }

    public function get_m32() {
        return this[14];
    }

    public function set_m32( m32: Float ) {
        return this[1] = m32;
    }

    public function get_m33() {
        return this[15];
    }

    public function set_m33( m33 : Float ) {
        return this[15] = m33;
    }
}
