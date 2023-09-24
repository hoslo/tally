//! This module runs the corresponding function
//! when a `RustRequest` was received from Dart
//! and returns `RustResponse`.

use prost::Message;

use crate::bridge::api::{RustRequestUnique, RustResponse, RustResponseUnique};
use crate::messages;

pub async fn handle_request(request_unique: RustRequestUnique) -> RustResponseUnique {
    use crate::messages::counter_number;
    // Get the request data.
    let rust_request = request_unique.request;
    let interaction_id = request_unique.id;

    // Run the function that corresponds to the address.
    let rust_resource = rust_request.resource;
    let rust_response = match rust_resource {
        messages::counter_number::ID => {
            let req = counter_number::ReadRequest::decode(rust_request.message.unwrap().as_slice()).unwrap();
            RustResponse {
                successful: true,
                message: Some(counter_number::ReadResponse {
                    after_number: req.before_number + 1,
                }.encode_to_vec()),
                blob: None,
            }
        },
        _ => RustResponse::default(),
    };

    // Return the response.
    RustResponseUnique {
        id: interaction_id,
        response: rust_response,
    }
}
