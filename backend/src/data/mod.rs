pub mod categories;
pub mod character;
pub mod fitdiffer;
pub mod fits;
pub mod implants;
pub mod skillplans;
pub mod skills;
pub mod tags;
pub mod variations;
pub mod yamlhelper;

#[cfg(feature = "mysql")]
#[macro_export]
macro_rules! last_insert_id {
    ( $a:expr ) => {
        $a.last_insert_id() as i64
    };
}

#[cfg(feature = "sqlite")]
#[macro_export]
macro_rules! last_insert_id {
    ( $a:expr ) => {
        $a.last_insert_rowid() as i64
    };
}
