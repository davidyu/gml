protocol Matrix {
    var count: Int { get }
    var m : [Float] { get set }
    subscript( row: Int, col: Int ) -> Float { get set }
}

// generic matrix, very unsafe
struct Mat<R:Nat, C:Nat>: Matrix {
    private var rows: Int
    private var cols: Int
    let count: Int
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
        self.count = r * c
        self.m = m
    }
}

// specialized matrices know their size by construction,
// so we don't need it in the initializer
protocol SpecializedMatrix {
    var count: Int { get }
    init( m: [Float] )
    subscript( i: Int ) -> Float { get set }
    subscript( row: Int, col: Int ) -> Float { get set }
}

struct Mat3: Matrix, SpecializedMatrix {
    let rows = 3
    let cols = 3
    let count = 9
    var m = [Float]( count: 9, repeatedValue: 0.0 )
    subscript( row: Int, col: Int ) -> Float {
        get {
            return m[ cols * row + col ]
        }

        set( newValue ) {
            m[ cols * row + col ] = newValue
        }
    }
    subscript( i: Int ) -> Float {
        get {
            return m[ i ]
        }

        set( newValue ) {
            m[ i ] = newValue
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

struct Mat4: Matrix, SpecializedMatrix {
    let rows = 4
    let cols = 4
    let count = 16
    var m = [Float]( count: 16, repeatedValue: 0.0 )
    subscript( row: Int, col: Int ) -> Float {
        get {
            return m[ cols * row + col ]
        }

        set( newValue ) {
            m[ cols * row + col ] = newValue
        }
    }
    subscript( i: Int ) -> Float {
        get {
            return m[ i ]
        }

        set( newValue ) {
            m[ i ] = newValue
        }
    }
    init( m:[Float] ) {
        self.m = m
    }
    var r00: Float {
        get        { return self[0,0] }
        set( r00 ) { self[0,0] = r00  }
    }
    var r01: Float {
        get        { return self[0,1] }
        set( r01 ) { self[0,1] = r01  }
    }
    var r02: Float {
        get        { return self[0,2] }
        set( r02 ) { self[0,2] = r01  }
    }
    var tx: Float {
        get       { return self[0,3] }
        set( tx ) { self[0,3] = tx   }
    }
    var r10: Float {
        get        { return self[1,0] }
        set( r10 ) { self[1,0] = r10  }
    }
    var r11: Float {
        get        { return self[1,1] }
        set( r11 ) { self[1,1] = r11  }
    }
    var r12: Float {
        get        { return self[1,2] }
        set( r12 ) { self[1,2] = r12  }
    }
    var ty: Float {
        get       { return self[1,3] }
        set( ty ) { self[1,3] = ty   }
    }
    var r20: Float {
        get        { return self[2,0] }
        set( r20 ) { self[2,0] = r20  }
    }
    var r21: Float {
        get        { return self[2,1] }
        set( r21 ) { self[2,1] = r21  }
    }
    var r22: Float {
        get        { return self[2,2] }
        set( r22 ) { self[2,2] = r22  }
    }
    var tz: Float {
        get       { return self[2,3] }
        set( tz ) { self[2,3] = tz   }
    }
    var m30: Float {
        get        { return self[3,0] }
        set( m30 ) { self[3,0] = m30  }
    }
    var m31: Float {
        get        { return self[7]  }
        set( m31 ) { self[3,1] = m31 }
    }
    var m32: Float {
        get        { return self[7]  }
        set( m32 ) { self[3,2] = m32 }
    }
    var tw: Float {
        get       { return self[3,3] }
        set( tw ) { self[3,3] = tw   }
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

// specialized matrix operations
func +<T: SpecializedMatrix>( left: T, right: T ) -> T {
    var m = [Float]( count: left.count, repeatedValue: 0.0 )
    for n in 0...left.count - 1 {
        m[n] = left[n] + right[n]
    }
    return T( m: m )
}

func -<T: SpecializedMatrix>( left: T, right: T ) -> T {
    var m = [Float]( count: left.count, repeatedValue: 0.0 )
    for n in 0...left.count - 1 {
        m[n] = left[n] - right[n]
    }
    return T( m: m )
}
