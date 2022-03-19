use http_types::headers::HeaderValue;
use tide::security::{CorsMiddleware, Origin};
use tide::prelude::*;
use tide::Request;
use tide::Response;
use tide::Body;
mod generator;

#[derive(Debug, Serialize)]
struct JsonResponse {
	word: String
}

fn tls( )

async fn server() -> tide::Result<()> {
	let mut app = tide::new();
	let cors = CorsMiddleware::new()
    				.allow_methods("GET, POST, OPTIONS".parse::<HeaderValue>().unwrap())
    				.allow_origin(Origin::from("*"))
    				.allow_credentials(false);
	app.with(cors);
    app.at("/word").post(get_word);
    app.listen("127.0.0.1:9090").await?;
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
