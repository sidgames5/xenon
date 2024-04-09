class Main {
	static function main() {
		final args = Sys.args();
		if (args.length < 1) {
			Sys.println("Usage: xepm operation packages");
			return;
		}

		final packages = args;
		if (packages.length > 0) {
			packages.shift();
		} else {
			for (p in packages) {
				packages.pop();
			}
		}

		switch (args[0]) {
			case "install":
			case "remove":
		}
	}

	static function download(file:String) {}

	static function unpack(file:String, dest:String) {}
}
