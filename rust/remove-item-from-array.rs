fn main() {
    const cars:[&str; 3] = ["Ford", "Volvo", "BMW"];

    println!("{:?}", cars);

    let mut newArr:[&str; cars.len()-1] = ["A"; cars.len() - 1];
    let mut j = 0;
    for i in 0..cars.len() {
        if cars[i] != "Volvo" {
            newArr[j] = cars[i];
            j = j + 1;
        }
    }

    println!("{:?}", newArr);
}
