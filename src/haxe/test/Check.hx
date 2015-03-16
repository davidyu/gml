package test;

import gml.Nat;
import gml.vector.Vec;
import gml.vector.Vec2f;
import gml.vector.Vec3f;
import gml.vector.Vec4f;

using gml.vector.Vec2f;

// floating point utils
class FPU {
    public static function roughly( a: Float, b: Float, e: Float = 0.00000001 ) {
        if ( a == b ) return true;
        else return Math.abs( a - b ) < e;
    }
}

class Check {
    static function main() {
        var r = new haxe.unit.TestRunner();
        r.add( new TestInstantiation() );
        r.add( new TestComponentOps() );
        r.add( new TestLengthNormalize() );
        r.add( new TestDot() );
        r.run();
    }
}

class TestInstantiation extends haxe.unit.TestCase {
    public function testVector2() {
        var v = new Vec2f( 0, 0 );
        assertTrue( v != null );
        assertEquals( v.x, 0 );
        assertEquals( v.y, 0 );
        assertEquals( v.x, v[0] );
        assertEquals( v.y, v[1] );
    }

    public function testVector3() {
        var v3 = new Vec3f( 0, 0, 0 );
        assertTrue( v3 != null );
        assertEquals( v3.x, 0 );
        assertEquals( v3.y, 0 );
        assertEquals( v3.z, 0 );
        var v2 = v3.xy;
        assertEquals( v2.x, 0 );
        assertEquals( v2.y, 0 );
    }

    public function testVector4() {
        var v4 = new Vec4f( 0, 0, 0, 0 );
        assertTrue( v4 != null );
        assertEquals( v4.x, 0 );
        assertEquals( v4.y, 0 );
        assertEquals( v4.z, 0 );
        assertEquals( v4.w, 0 );
        var v3 = v4.xyz;
        assertEquals( v3.x, 0 );
        assertEquals( v3.y, 0 );
        assertEquals( v3.z, 0 );
        var v2 = v4.xy;
        assertEquals( v2.x, 0 );
        assertEquals( v2.y, 0 );
    }

    public function testUnsafeInstantiation() {
        var v = new Vecf<Two>( [ 0, 0 ] );
        assertTrue( v != null );
        assertEquals( v[0], 0 );
        assertEquals( v[1], 0 );

        var v2 = new Vecf<Three>( [ 0, 0, 0 ] );
        assertTrue( v != null );
        assertEquals( v2[0], 0 );
        assertEquals( v2[1], 0 );
        assertEquals( v2[2], 0 );

        var v3 = new Vecf<Four>( [ 0, 0, 0, 0 ] );
        assertTrue( v != null );
        assertEquals( v3[0], 0 );
        assertEquals( v3[1], 0 );
        assertEquals( v3[2], 0 );
        assertEquals( v3[3], 0 );

        var v4 = new Vecf<Five>( [ 0, 0, 0, 0, 0 ] );
        assertTrue( v != null );
        assertEquals( v4[0], 0 );
        assertEquals( v4[1], 0 );
        assertEquals( v4[2], 0 );
        assertEquals( v4[3], 0 );
        assertEquals( v4[4], 0 );
    }
}

typedef Hundred = S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<S<Zero>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
class TestComponentOps extends haxe.unit.TestCase {
    public function testVector2() {
        var a = new Vec2f( Math.random(), Math.random() );
        var b = new Vec2f( Math.random(), Math.random() );
        var c = a + b;
        assertEquals( c.x, a.x + b.x );
        assertEquals( c.y, a.y + b.y );
        var d = a - b;
        assertEquals( d.x, a.x - b.x );
        assertEquals( d.y, a.y - b.y );
        var e = a * b;
        assertEquals( e.x, a.x * b.x );
        assertEquals( e.y, a.y * b.y );
        var f = Math.random();
        var g = a * f;
        var h = f * a;
        assertTrue( g == h );
        assertEquals( g.x, f * a.x );
        assertEquals( g.y, f * a.y );
        var i = -a;
        assertEquals( i.x, -a.x );
        assertEquals( i.y, -a.y );
        var j = a / f;
        assertTrue( FPU.roughly( j.x, a.x / f ) );
        assertTrue( FPU.roughly( j.y, a.y / f ) );
        var k = f / a;
        assertTrue( FPU.roughly( k.x, f / a.x ) );
        assertTrue( FPU.roughly( k.y, f / a.y ) );
        var l = a / b;
        assertTrue( FPU.roughly( l.x, a.x / b.x ) );
        assertTrue( FPU.roughly( l.y, a.y / b.y ) );
    }

    public function testVector3() {
        var a = new Vec3f( Math.random(), Math.random(), Math.random() );
        var b = new Vec3f( Math.random(), Math.random(), Math.random() );
        var c = a + b;
        assertEquals( c.x, a.x + b.x );
        assertEquals( c.y, a.y + b.y );
        assertEquals( c.z, a.z + b.z );
        var d = a - b;
        assertEquals( d.x, a.x - b.x );
        assertEquals( d.y, a.y - b.y );
        assertEquals( d.z, a.z - b.z );
        var e = a * b;
        assertEquals( e.x, a.x * b.x );
        assertEquals( e.y, a.y * b.y );
        assertEquals( e.z, a.z * b.z );
        var f = Math.random();
        var g = a * f;
        var h = f * a;
        assertTrue( g == h );
        assertEquals( g.x, f * a.x );
        assertEquals( g.y, f * a.y );
        assertEquals( g.z, f * a.z );
        var i = -a;
        assertEquals( i.x, -a.x );
        assertEquals( i.y, -a.y );
        assertEquals( i.z, -a.z );
        var j = a / f;
        assertTrue( FPU.roughly( j.x, a.x / f ) );
        assertTrue( FPU.roughly( j.y, a.y / f ) );
        assertTrue( FPU.roughly( j.z, a.z / f ) );
        var k = f / a;
        assertTrue( FPU.roughly( k.x, f / a.x ) );
        assertTrue( FPU.roughly( k.y, f / a.y ) );
        assertTrue( FPU.roughly( k.z, f / a.z ) );
        var l = a / b;
        assertTrue( FPU.roughly( l.x, a.x / b.x ) );
        assertTrue( FPU.roughly( l.y, a.y / b.y ) );
        assertTrue( FPU.roughly( l.z, a.z / b.z ) );
    }

    public function testVector4() {
        var a = new Vec4f( Math.random(), Math.random(), Math.random(), Math.random() );
        var b = new Vec4f( Math.random(), Math.random(), Math.random(), Math.random() );
        var c = a + b;
        assertEquals( c.x, a.x + b.x );
        assertEquals( c.y, a.y + b.y );
        assertEquals( c.z, a.z + b.z );
        assertEquals( c.w, a.w + b.w );
        var d = a - b;
        assertEquals( d.x, a.x - b.x );
        assertEquals( d.y, a.y - b.y );
        assertEquals( d.z, a.z - b.z );
        assertEquals( d.w, a.w - b.w );
        var e = a * b;
        assertEquals( e.x, a.x * b.x );
        assertEquals( e.y, a.y * b.y );
        assertEquals( e.z, a.z * b.z );
        assertEquals( e.w, a.w * b.w );
        var f = Math.random();
        var g = a * f;
        var h = f * a;
        assertTrue( g == h );
        assertEquals( g.x, f * a.x );
        assertEquals( g.y, f * a.y );
        assertEquals( g.z, f * a.z );
        assertEquals( g.w, f * a.w );
        var i = -a;
        assertEquals( i.x, -a.x );
        assertEquals( i.y, -a.y );
        assertEquals( i.z, -a.z );
        assertEquals( i.w, -a.w );
        var j = a / f;
        assertTrue( FPU.roughly( j.x, a.x / f ) );
        assertTrue( FPU.roughly( j.y, a.y / f ) );
        assertTrue( FPU.roughly( j.z, a.z / f ) );
        assertTrue( FPU.roughly( j.w, a.w / f ) );
        var k = f / a;
        assertTrue( FPU.roughly( k.x, f / a.x ) );
        assertTrue( FPU.roughly( k.y, f / a.y ) );
        assertTrue( FPU.roughly( k.z, f / a.z ) );
        assertTrue( FPU.roughly( k.w, f / a.w ) );
        var l = a / b;
        assertTrue( FPU.roughly( l.x, a.x / b.x ) );
        assertTrue( FPU.roughly( l.y, a.y / b.y ) );
        assertTrue( FPU.roughly( l.z, a.z / b.z ) );
        assertTrue( FPU.roughly( l.w, a.w / b.w ) );
    }

    public function testUnsafeVectors() {
        var a = new Vecf<Six>( [ Math.random(), Math.random(), Math.random(), Math.random(), Math.random(), Math.random() ] );
        var b = new Vecf<Six>( [ Math.random(), Math.random(), Math.random(), Math.random(), Math.random(), Math.random() ] );
        var c = a + b;
        assertEquals( c[0], a[0] + b[0] );
        assertEquals( c[1], a[1] + b[1] );
        assertEquals( c[2], a[2] + b[2] );
        assertEquals( c[3], a[3] + b[3] );
        assertEquals( c[4], a[4] + b[4] );
        assertEquals( c[5], a[5] + b[5] );
        var d = a - b;
        assertEquals( d[0], a[0] - b[0] );
        assertEquals( d[1], a[1] - b[1] );
        assertEquals( d[2], a[2] - b[2] );
        assertEquals( d[3], a[3] - b[3] );
        assertEquals( d[4], a[4] - b[4] );
        assertEquals( d[5], a[5] - b[5] );
        var e = a * b;
        assertEquals( e[0], a[0] * b[0] );
        assertEquals( e[1], a[1] * b[1] );
        assertEquals( e[2], a[2] * b[2] );
        assertEquals( e[3], a[3] * b[3] );
        assertEquals( e[4], a[4] * b[4] );
        assertEquals( e[5], a[5] * b[5] );
        var f = Math.random();
        var g = a * f;
        var h = f * a;
        assertTrue( g == h );
        assertEquals( g[0], a[0] * f );
        assertEquals( g[1], a[1] * f );
        assertEquals( g[2], a[2] * f );
        assertEquals( g[3], a[3] * f );
        assertEquals( g[4], a[4] * f );
        assertEquals( g[5], a[5] * f );
        var i = -a;
        assertEquals( i[0], -a[0] );
        assertEquals( i[1], -a[1] );
        assertEquals( i[2], -a[2] );
        assertEquals( i[3], -a[3] );
        assertEquals( i[4], -a[4] );
        assertEquals( i[5], -a[5] );
        var j = a / f;
        assertTrue( FPU.roughly( j[0], a[0] / f ) );
        assertTrue( FPU.roughly( j[1], a[1] / f ) );
        assertTrue( FPU.roughly( j[2], a[2] / f ) );
        assertTrue( FPU.roughly( j[3], a[3] / f ) );
        assertTrue( FPU.roughly( j[4], a[4] / f ) );
        assertTrue( FPU.roughly( j[5], a[5] / f ) );
        var k = f / a;
        assertTrue( FPU.roughly( k[0], f / a[0] ) );
        assertTrue( FPU.roughly( k[1], f / a[1] ) );
        assertTrue( FPU.roughly( k[2], f / a[2] ) );
        assertTrue( FPU.roughly( k[3], f / a[3] ) );
        assertTrue( FPU.roughly( k[4], f / a[4] ) );
        assertTrue( FPU.roughly( k[5], f / a[5] ) );
        var l = a / b;
        assertTrue( FPU.roughly( l[0], a[0] / b[0] ) );
        assertTrue( FPU.roughly( l[1], a[1] / b[1] ) );
        assertTrue( FPU.roughly( l[2], a[2] / b[2] ) );
        assertTrue( FPU.roughly( l[3], a[3] / b[3] ) );
        assertTrue( FPU.roughly( l[4], a[4] / b[4] ) );
        assertTrue( FPU.roughly( l[5], a[5] / b[5] ) );
    }

    public function testLargeVector() {
        function genRandomArr( sz : Int ) {
            var res = [];
            for ( i in 0...sz ) res.push( Math.random() );
            return res;
        }

        var a = new Vecf<Hundred>( genRandomArr( 100 ) );
        var b = new Vecf<Hundred>( genRandomArr( 100 ) );
        var c = a + b;

        for ( i in 0 ... 100 ) {
            assertEquals( c[i], a[i] + b[i] );
        }

        var d = a - b;
        for ( i in 0 ... 100 ) {
            assertEquals( d[i], a[i] - b[i] );
        }

        var e = a * b;
        for ( i in 0 ... 100 ) {
            assertEquals( e[i], a[i] * b[i] );
        }

        var f = Math.random();
        var g = a * f;
        var h = f * a;
        assertTrue( g == h );

        for ( i in 0 ... 100 ) {
            assertEquals( g[i], a[i] * f );
        }

        var i = -a;
        for ( j in 0 ... 100 ) {
            assertEquals( i[j], -a[j] );
        }

        var j = a / f;
        for ( i in 0 ... 100 ) {
            assertTrue( FPU.roughly( j[i], a[i] / f ) );
        }

        var k = f / a;
        for ( i in 0 ... 100 ) {
            assertTrue( FPU.roughly( k[i], f / a[i] ) );
        }

        var l = a / b;
        for ( i in 0 ... 100 ) {
            assertTrue( FPU.roughly( l[i], a[i ]/ b[i] ) );
        }
    }
}

class TestLengthNormalize extends haxe.unit.TestCase {
    public function testVector2() {
        var a = new Vec2f( Math.random(), Math.random() );
        var n = a.normalize();
        assertTrue( FPU.roughly( n.len(), 1.0 ) );
        assertTrue( FPU.roughly( n.lensq(), 1.0 ) );
    }

    public function testVector3() {
        var a = new Vec3f( Math.random(), Math.random(), Math.random() );
        var n = a.normalize();
        assertTrue( FPU.roughly( n.len(), 1.0 ) );
        assertTrue( FPU.roughly( n.lensq(), 1.0 ) );
    }

    public function testVector4() {
        var a = new Vec4f( Math.random(), Math.random(), Math.random(), Math.random() );
        var n = a.normalize();
        assertTrue( FPU.roughly( n.len(), 1.0 ) );
        assertTrue( FPU.roughly( n.lensq(), 1.0 ) );
    }

    public function testLargeVector() {
        function genRandomArr( sz : Int ) {
            var res = [];
            for ( i in 0...sz ) res.push( Math.random() );
            return res;
        }

        var a = new Vecf<Hundred>( genRandomArr( 100 ) );
        var n = a.normalize();
        assertTrue( FPU.roughly( n.len(), 1.0 ) );
        assertTrue( FPU.roughly( n.lensq(), 1.0 ) );
    }
}

class TestDot extends haxe.unit.TestCase {
    public function testVector2() {
        var a = new Vec2f( Math.random(), Math.random() );
        var b = new Vec2f( Math.random(), Math.random() );
        var c = a.dot( b );
        assertTrue( FPU.roughly( c, a.x * b.x + a.y * b.y ) );
        var d = new Vec2f( 0, 1 );
        var e = new Vec2f( 1, 0 );
        assertTrue( FPU.roughly( 0, d.dot( e ) ) );
    }

    public function testVector3() {
        var a = new Vec3f( Math.random(), Math.random(), Math.random() );
        var b = new Vec3f( Math.random(), Math.random(), Math.random() );
        var c = a.dot( b );
        assertTrue( FPU.roughly( c, a.x * b.x + a.y * b.y + a.z * b.z ) );
        var d = new Vec3f( 0, 1, 0 );
        var e = new Vec3f( 1, 0, 0 );
        assertTrue( FPU.roughly( 0, d.dot( e ) ) );
    }

    public function testVector4() {
        var a = new Vec4f( Math.random(), Math.random(), Math.random(), Math.random() );
        var b = new Vec4f( Math.random(), Math.random(), Math.random(), Math.random() );
        var c = a.dot( b );
        assertTrue( FPU.roughly( c, a.x * b.x + a.y * b.y + a.z * b.z + a.w * b.w ) );
        var d = new Vec4f( 0, 1, 0, 0 );
        var e = new Vec4f( 1, 0, 1, 0 );
        assertTrue( FPU.roughly( 0, d.dot( e ) ) );
    }

    public function testLargeVector() {
        function genRandomArr( sz : Int ) {
            var res = [];
            for ( i in 0...sz ) res.push( Math.random() );
            return res;
        }

        var a = new Vecf<Hundred>( genRandomArr( 100 ) );
        var b = new Vecf<Hundred>( genRandomArr( 100 ) );
        var c = a.dot( b );

        function innerprod<N>( a: Vecf<N>, b: Vecf<N> ) {
            var res = 0.0;
            for ( i in 0...a.length ) res += a[i] * b[i];
            return res;
        }

        assertTrue( FPU.roughly( c, innerprod( a, b ) ) );
    }
}
