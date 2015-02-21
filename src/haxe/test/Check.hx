package test;

import gml.Nat;
import gml.vector.Vec;
import gml.vector.Vec2f;
import gml.vector.Vec3f;
import gml.vector.Vec4f;

class Check {
    static function main() {
        var r = new haxe.unit.TestRunner();
        r.add( new TestInstantiation() );
        r.run();
    }
}

class TestInstantiation extends haxe.unit.TestCase {
    public function testVector2() {
        var v = new Vec2f( 0, 0 );
        assertTrue( v != null );
        assertEquals( v.x, 0 );
        assertEquals( v.y, 0 );
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
