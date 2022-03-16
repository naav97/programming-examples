fn sort(arr: &mut [i32]) {
    for i in 0..arr.len() {
        let mut j = i;
        while j > 0 && arr[j] < arr[j-1] {
            let t = arr[j-1];
            arr[j-1] = arr[j];
            arr[j] = t;
            j = j - 1;
        }
    }
}

fn main() {
    let mut a = [12,4,23,5,14,73,1,435,76,2,24,6,143,54,7,122,234,7564,1222];
    println!("{:?}", a);
    sort(&mut a);
    println!("{:?}", a);
}
