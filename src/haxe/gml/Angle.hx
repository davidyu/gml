package gml;

// angle constants
class AC {
    public static var PI = 3.1415926;
}

abstract Degree( Float ) from Float to Float {
    public function new( x: Float ) { this = x; }

    public function toRad(): Radian {
        return new Radian( this * AC.PI / 180 );
    }
}

abstract Radian( Float ) from Float to Float {
    public function new( x: Float ) { this = x; }

    public function toDeg(): Degree {
        return new Degree( this * 180 / AC.PI );
    }
}
