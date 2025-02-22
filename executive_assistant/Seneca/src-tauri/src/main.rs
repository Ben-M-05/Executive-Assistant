// Prevents additional console window on Windows in release, DO NOT REMOVE!!



#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

fn main() {

    let mut task = task::Task::new("Test", "test", "Me", 1, false);

    println!("{}", task);

    seneca_lib::run()
}
