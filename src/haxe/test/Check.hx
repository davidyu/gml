package test;

import gml.Nat;
import gml.vector.Vec;

using gml.vector.Vector2;
using gml.vector.Vector3;
using gml.vector.Vector4;

class Check {
    static function main() {
        var r = new haxe.unit.TestRunner();
        r.add( new TestInstantiation() );
        r.run();
    }
}

class TestInstantiation extends haxe.unit.TestCase {
    public function testVector2() {
        var v = Vector2.create( 0, 0 );
        assertTrue( v != null );
        assertEquals( v.x(), 0 );
        assertEquals( v.y(), 0 );
    }

    public function testVector3() {
        var v = Vector3.create( 0, 0, 0 );
        assertTrue( v != null );
        assertEquals( v.x(), 0 );
        assertEquals( v.y(), 0 );
        assertEquals( v.z(), 0 );
    }

    public function testVector4() {
        var v = Vector4.create( 0, 0, 0, 0 );
        assertTrue( v != null );
        assertEquals( v.x(), 0 );
        assertEquals( v.y(), 0 );
        assertEquals( v.z(), 0 );
        assertEquals( v.w(), 0 );
    }

    public function testUnsafeInstantiation() {
        var v = new Vec2f( [ 0, 0 ] );
        assertTrue( v != null );
        assertEquals( v.x(), 0 );
        assertEquals( v.y(), 0 );

        var v2 = new Vec3f( [ 0, 0, 0 ] );
        assertTrue( v != null );
        assertEquals( v2.x(), 0 );
        assertEquals( v2.y(), 0 );
        assertEquals( v2.z(), 0 );

        var v3 = new Vec4f( [ 0, 0, 0, 0 ] );
        assertTrue( v != null );
        assertEquals( v3.x(), 0 );
        assertEquals( v3.y(), 0 );
        assertEquals( v3.z(), 0 );
        assertEquals( v3.w(), 0 );

        var v4 = new Vecf<Five>( [ 0, 0, 0, 0, 0 ] );
        assertTrue( v != null );
        assertEquals( v4[0], 0 );
        assertEquals( v4[1], 0 );
        assertEquals( v4[2], 0 );
        assertEquals( v4[3], 0 );
        assertEquals( v4[4], 0 );
    }
}
