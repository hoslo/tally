use bridge::respond_to_dart;
use sqlx::{Pool, Sqlite, sqlite::SqlitePoolOptions};
use web_alias::*;
use with_request::handle_request;
use tokio::sync::OnceCell;

mod bridge;
mod messages;
mod web_alias;
mod with_request;

static POOL: OnceCell<Pool<Sqlite>> = OnceCell::const_new();

async fn get_global_db<'a>() -> &'a Pool<Sqlite> {
    POOL.get_or_init(|| async {
        SqlitePoolOptions::new()
.connect("sqlite:test.db?mode=rwc").await.unwrap()
    }).await
}

/// This `hub` crate is the entry point for the Rust logic.
/// Always use non-blocking async functions such as `tokio::fs::File::open`.
async fn main() {
    // This is `tokio::sync::mpsc::Reciver` that receives the requests from Dart.
    let mut request_receiver = bridge::get_request_receiver();
    // If I comment out this line, the program works
    get_global_db().await;
    while let Some(request_unique) = request_receiver.recv().await {
        crate::spawn(async {
            let response_unique = handle_request(request_unique).await;
            respond_to_dart(response_unique);
        });
    }
}
