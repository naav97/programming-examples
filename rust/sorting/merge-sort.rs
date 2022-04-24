fn merge(lArr: &Vec<i32>, rArr: &Vec<i32>) -> Vec<i32> {
    let mut l = 0;
    let mut r = 0;
    let mut tempArr: Vec<i32> = Vec::new();

    while l < lArr.len() && r < rArr.len() {
        if lArr[l] <= rArr[r] {
            tempArr.push(lArr[l]);
            l = l + 1;
        }
        else {
            tempArr.push(rArr[r]);
            r = r + 1;
        }
    }

    while l < lArr.len() {
        tempArr.push(lArr[l]);
        l = l + 1;
    }

    while r < rArr.len() {
        tempArr.push(rArr[r]);
        r = r + 1;
    }

    return tempArr;
}

fn sort(arr: &Vec<i32>) -> Vec<i32> {
    if arr.len() < 2 {
        return arr.to_vec();
    }
    else {
        let mitad = arr.len() / 2;
        let left = sort(&arr[0..mitad].to_vec());
        let right = sort(&arr[mitad..].to_vec());
        let re = merge(&left, &right);
        return re;
    }
}

fn main() {
    let a = vec![43,76,22,543,6,2,33,3,7,4,5,8,9,0,54,66,23,77,78,34,87,23,42,224,76576,45,777,64];
    println!("{:?}", a);
    let asort = sort(&a);
    println!("{:?}", asort);
}
