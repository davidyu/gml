module gml {
  export class Mat4 extends Matrix {

    constructor( args: Float32Array );
    constructor( args: number[] );
    constructor( r00, r01, r02, tx, r10, r11, r12, ty, r20, r21, r22, tz, m30, m31, m32, m33 );

    constructor( ...args: any[] ) {
      if ( args.length === 1 ) {
        super( 4, 4, args[0] );
      } else {
        super( 4, 4, args );
      }
    }

    public get r00(): number {
      return this.get( 0, 0 );
    }

    public get r01(): number {
      return this.get( 0, 1 );
    }

    public get r02(): number {
      return this.get( 0, 2 );
    }

    public get r10(): number {
      return this.get( 1, 0 );
    }

    public get r11(): number {
      return this.get( 1, 1 );
    }

    public get r12(): number {
      return this.get( 1, 2 );
    }

    public get r20(): number {
      return this.get( 2, 0 );
    }

    public get r21(): number {
      return this.get( 2, 1 );
    }

    public get r22(): number {
      return this.get( 2, 2 );
    }

    public get m30(): number {
      return this.get( 3, 0 );
    }

    public get m31(): number {
      return this.get( 3, 1 );
    }

    public get m32(): number {
      return this.get( 3, 2 );
    }

    public get m33(): number {
      return this.get( 3, 3 );
    }

    public set r00( v: number ) {
      this.set( 0, 0, v );
    }

    public set r01( v: number ) {
      this.set( 0, 1, v );
    }

    public set r02( v: number ) {
      this.set( 0, 2, v );
    }

    public set r10( v: number ) {
      this.set( 1, 0, v );
    }

    public set r11( v: number ) {
      this.set( 1, 1, v );
    }

    public set r12( v: number ) {
      this.set( 1, 2, v );
    }

    public set r20( v: number ) {
      this.set( 2, 0, v );
    }

    public set r21( v: number ) {
      this.set( 2, 1, v );
    }

    public set r22( v: number ) {
      this.set( 2, 2, v );
    }

    public set m30( v: number ) {
      this.set( 3, 0, v );
    }

    public set m31( v: number ) {
      this.set( 3, 1, v );
    }

    public set m32( v: number ) {
      this.set( 3, 2, v );
    }

    public set m33( v: number ) {
      this.set( 3, 3, v );
    }

    public get tx(): number {
      return this.get( 0, 3 );
    }

    public get ty(): number {
      return this.get( 1, 3 );
    }
    
    public get tz(): number {
      return this.get( 2, 3 );
    }

    public set tx( v: number ) {
      this.set( 0, 3, v );
    }

    public set ty( v: number ) {
      this.set( 1, 3, v ) ;
    }

    public set tz( v: number ) {
      this.set( 2, 3, v ) ;
    }

    public get w(): number {
      return this.get( 3, 3 );
    }

    public set w( v: number ) {
      this.set( 3, 3, v );
    }

    public row( r ): Vec4 {
      var row = [];
      for ( var i = 0; i < 4; i++ ) {
        row.push( this.get( r, i ) );
      }
      return new Vec4( row );
    }

    public column( c ): Vec4 {
      var column = [];
      for ( var i = 0; i < 4; i++ ) {
        column.push( this.get( i, c ) );
      }
      return new Vec4( column );
    }

    public setColumn( c, v: Vec4 ) {
      for ( var i = 0; i < 4; i++ ) {
        this.set( i, c, v.get( i ) );
      }
    }

    public get translation(): Vec4 {
      return this.column( 3 );
    }

    public set translation( t: Vec4 ) {
      this.setColumn( 3, t );
    }

    public get scale(): Vec3 {
      return new Vec3( this.get( 0, 0 ), this.get( 1, 1 ), this.get( 2, 2 ) );
    }

    public set scale( s: Vec3 ) {
      this.set( 0, 0, s.x );
      this.set( 1, 1, s.y );
      this.set( 2, 2, s.z );
    }

    public mul( rhs: Mat4 ): Mat4 {
      var m = super.mul( rhs );
      return new Mat4( m.Float32Array );
    }

    public scalarmul( s: number ): Mat4 {
      var m = super.scalarmul( s );
      return new Mat4( m.Float32Array );
    }

    public sub( rhs: Matrix ): Mat4 {
      var m = super.sub( rhs );
      return new Mat4( m.Float32Array );
    }

    public add( rhs: Matrix ): Mat4 {
      var m = super.add( rhs );
      return new Mat4( m.Float32Array );
    }

    public invert(): Mat4 {
      let d = this.determinant;
      let tr = this.trace;
      let m2 = this.mul( this );
      let m3 = this.mul( m2 );
      let tr2 = m2.trace;
      let tr3 = m3.trace;
      let a = ( 1 / 6 ) * ( ( tr * tr * tr ) - ( 3 * tr * tr2 ) + ( 2 * tr3 ) );
      let b = ( 1 / 2 ) * ( tr * tr - tr2 );
      let c = m2.scalarmul( tr ).sub( m3 );
      return Mat4.identity().scalarmul( a ).sub( this.scalarmul( b ) ).add( c ).scalarmul( 1 / d );
    }

    public transpose(): Mat4 {
      return new Mat4( super.transpose().Float32Array );
    }

    public get mat3(): Mat3 {
      return new Mat3( this.r00, this.r10, this.r20
                     , this.r01, this.r11, this.r21
                     , this.r02, this.r21, this.r22 );
    }

    public static identity(): Mat4 {
      return new Mat4( 1, 0, 0, 0
                     , 0, 1, 0, 0
                     , 0, 0, 1, 0
                     , 0, 0, 0, 1 );
    }
  }

  export function makeMat4FromRows( r1, r2, r3, r4 ) {
    return new Mat4( r1.x, r2.x, r3.x, r4.x
                   , r1.y, r2.y, r3.y, r4.y
                   , r1.z, r2.z, r3.z, r4.z
                   , r1.w, r2.w, r3.w, r4.w );
  }

  export function makePerspective( fov: Angle, aspectRatio: number, near: number, far: number ): Mat4 {
    let t = near * Math.tan( fov.toRadians() );
    let r = t * aspectRatio;
    let l = -r;
    let b = -t;
    let n = near;
    let f = far;

    return new Mat4( ( n * 2 ) / ( r - l ) , 0                     , ( r + l ) / ( r - l )      , 0
                   , 0                     , ( n * 2 ) / ( t - b ) , ( t + b ) / ( t - b )      , 0
                   , 0                     , 0                     , -( f + n ) / ( f - n )     , -( f * n * 2 ) / ( f - n )
                   , 0                     , 0                     , -1                         , 0 );
  }

  export function makeLookAt( pos: Vec4, aim: Vec4 /* target */, up: Vec4, right: Vec4 ): Mat4 {
    let x = right.normalized;
    let y = up.normalized;
    let z = aim.sub( pos ).normalized;

    var lookAt = makeMat4FromRows( x, y, z, new Vec4( 0, 0, 0, 1 ) );
    lookAt.tx = pos.x;
    lookAt.ty = pos.y;
    lookAt.tz = pos.z;

    return lookAt;
  }
}