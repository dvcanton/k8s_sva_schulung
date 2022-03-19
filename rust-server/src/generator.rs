use rand::seq::SliceRandom; 
mod words;

pub fn word() -> String {
    let chosen = words::SAMPLE.choose(&mut rand::thread_rng()).copied().unwrap();
	return String::from(chosen);
}