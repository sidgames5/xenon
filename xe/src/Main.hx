import sys.io.Process;

using StringTools;

class Main {
	public static final modpath = "/usr/lib/xenon";

	static function main() {
		final args = Sys.args();
		final options = new Map<String, Dynamic>();
		final operations = new Array<String>();
		var module = "";
		final params = new Array<String>();

		var la = null;
		for (arg in args) {
			if (la != null) {
				switch (la) {
					case "root":
						options.set("root", "arg");
				}
			} else if (arg.startsWith("--")) {
				switch (arg.substr(2)) {
					case "root":
						la = "root";
					default:
						Sys.println('Unknown option: $arg');
						return;
				}
			} else if (arg.startsWith("-")) {
				var opt = arg.substr(1).split("");
				for (o in opt) {
					switch (o) {
						case "P":
							module = "xepm";
						case "C":
							module = "xepc";
						default:
							if (module == "P") {
								switch (o) {
									case "i":
										operations.push("install");
									case "r":
										operations.push("remove");
									case "s":
										operations.push("sync");
									case "u":
										operations.push("upgrade");
								}
							} else if (module == "C") {
								switch (o) {
									case "e":
										operations.push("export");
									case "l":
										operations.push("load");
								}
							}
					}
				}
			} else {
				params.push(arg);
			}
		}

		switch (module) {
			case "xepm":
				var command = '$modpath/xepm ';
				for (op in operations) {
					switch (op) {
						case "install":
							command += "install " + params.join(" ");
					}
				}
				Sys.command(command);
			default:
				Sys.println("Unsupported module");
				return;
		}
	}
}
