protocol Matrix {
    var m : [Float] { get set }
    subscript( row: Int, col: Int ) -> Float { get set }
}

// generic matrix, very unsafe
struct Mat<R:Nat, C:Nat>: Matrix {
    private var rows: Int
    private var cols: Int
    var m: [Float]
    subscript( row: Int, col: Int ) -> Float {
        get {
            return m[ cols * row + col ]
        }

        set( newValue ) {
            m[ cols * row + col ] = newValue
        }
    }
    init( r: Int, c: Int, m: [Float] ) {
        self.rows = r
        self.cols = c
        self.m = m
    }
}

struct Mat3: Matrix {
    let rows = 3
    let cols = 3
    var m = [Float]( count: 9, repeatedValue: 0.0 )
    subscript( row: Int, col: Int ) -> Float {
        get {
            return m[ cols * row + col ]
        }

        set( newValue ) {
            m[ cols * row + col ] = newValue
        }
    }
    init( m:[Float] ) {
        self.m = m
    }
    var r00: Float {
        get        { return m[0] }
        set( r00 ) { m[0] = r00   }
    }
    var r01: Float {
        get        { return m[1] }
        set( r01 ) { m[1] = r01   }
    }
    var tx: Float {
        get       { return m[2] }
        set( tx ) { m[2] = tx   }
    }
    var r10: Float {
        get        { return m[3] }
        set( r10 ) { m[3] = r10   }
    }
    var r11: Float {
        get        { return m[4] }
        set( r11 ) { m[4] = r11   }
    }
    var ty: Float {
        get       { return m[5] }
        set( ty ) { m[5] = ty   }
    }
    var m20: Float {
        get        { return m[6] }
        set( m20 ) { m[3] = m20   }
    }
    var m21: Float {
        get        { return m[7] }
        set( m21 ) { m[4] = m21   }
    }
    var tz: Float {
        get       { return m[8] }
        set( tz ) { m[8] = tz   }
    }
    var tw: Float {
        get       { return m[8] }
        set( tw ) { m[8] = tw   }
    }
}

func fromRows<R:Nat, C:Nat>( rows: [Vec<C>] ) -> Mat<R, C> {
    var m: [Float] = []

    if ( rows.count == 0 ) {
        // error!
        return Mat<R, C>( r: 0, c: 0, m: [] )
    }

    for r in rows {
        m += r.data
    }

    return Mat<R,C>( r: rows[0].count, c: rows.count, m: m )
}

func fromCols<R:Nat, C:Nat>( cols: [Vec<R>] ) -> Mat<R, C> {
    var m: [Float] = []

    if ( cols.count == 0 ) {
        // error!
        return Mat<R, C>( r: 0, c: 0, m: [] )
    }

    let rlen = cols[0].count
    for r in 0...rlen - 1 {
        for c in cols {
            m.append( c.data[r] )
        }
    }

    return Mat<R,C>( r: cols.count, c: rlen, m: m )
}

func transpose<R:Nat, C:Nat>( mat: Mat<R, C> ) -> Mat<C, R> {
    var m: [Float] = []

    for r in 0...mat.rows - 1 {
        for c in 0...mat.cols - 1 {
            m.append( mat[ c, r ] )
        }
    }

    return Mat<C,R>( r: mat.rows, c: mat.cols, m: m )
}
