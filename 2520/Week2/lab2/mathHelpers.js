const squareRoot = (value) => {
    return Math.sqrt(value);
}

const square = (value) => {
    return value * value;
}

export const distance = (x1, y1, x2, y2) => {
    return squareRoot(square(x2 - x1) + square(y2 - y1));
}
