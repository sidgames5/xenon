class Main {
	static function main() {
		final args = Sys.args();
		if (args.length < 2) {
			Sys.println("Usage: xepm operation packages");
			return;
		}

		final packages = args;
		packages.shift();

		switch (args[0]) {
			case "install":
			case "remove":
		}
	}

	static function download(file:String) {}

	static function unpack(file:String, dest:String) {}
}
