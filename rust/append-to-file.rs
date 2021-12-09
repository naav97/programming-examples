use std::fs::OpenOptions;
use std::io::Write;
use std::fs;

fn main() {
    let mut file = OpenOptions::new().append(true).create(true).open("file.txt").unwrap();
    write!(file, "Hi!\n");

    let mut data = String::new();
    data = fs::read_to_string("file.txt").unwrap();
    print!("{}", data);
}
