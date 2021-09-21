function derivative(f) {
    return x => {
        let h = 0.000001
        return (f(x + h) - f(x)) / h
    }
}

[1.0, 2.0, 3.0, 4.0, 5.0].map(derivative(x => x * x))

[1.0, 2.0, 3.0, 4.0, 5.0].map(x => 2 * x)