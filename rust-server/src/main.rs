use std::env;
use http_types::headers::HeaderValue;
use tide::security::{CorsMiddleware, Origin};
use tide::prelude::*;
use tide_rustls::TlsListener;
use tide::Request;
use tide::Response;
use tide::Body;
mod generator;

#[derive(Debug, Serialize)]
struct JsonResponse {
	word: String
}


#[async_std::main]
async fn main() -> tide::Result<()> {
    let mut app = tide::new();
	let cors = CorsMiddleware::new()
    				.allow_methods("GET, POST, OPTIONS".parse::<HeaderValue>().unwrap())
    				.allow_origin(Origin::from("*"))
    				.allow_credentials(false);
	app.with(cors);

	let ssl;
	match env::var("ENABLE_SERVER_SSL") {
    	Ok(s) => match s.as_str() {
			"true" => ssl = true,
			_ => ssl = false
		},
    	_ => ssl = false
	}

	if ssl {
		if let (Ok(cert), Ok(key)) = (env::var("CERT_PATH"), env::var("KEY_PATH")) {
			app.at("/word").post(get_word);
			app.listen(
				TlsListener::build()
					.addrs("127.0.0.1:4433")
					.cert(cert)
					.key(key),
				)
			.await?;
			eprintln!("Listening on port 4433..");
		}  else {
		eprintln!("Please provide CERT_PATH and KEY_PATH as environment variables");
		}
	} else {
		app.at("/word").post(get_word);
		app.listen("127.0.0.1:9090").await?;
		eprintln!("Listening on port 9090..");
	}
    Ok(())
}



async fn get_word(_req: Request<()>) -> tide::Result {
	let generated_word = generator::word();
	let json_response = JsonResponse { word: String::from(generated_word) };
    let body = Body::from_json(&json_response)?;
    let mut res = Response::new(201);
	res.set_body(body);
	Ok(res)
}
