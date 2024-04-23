import sys.io.Process;

using StringTools;

class Main {
	public static final modpath = "/usr/lib/xenon/modules";

	static function main() {
		final args = Sys.args();
		final options = new Map<String, Dynamic>();
		final operations = new Array<String>();
		var module = "";
		final params = new Array<String>();

		switch (args[0]) {
			case "install", "remove", "sync", "upgrade", "search", "info", "list":
				module = "xepm";
				operations.push(args[0]);
				var p = args.copy();
				p.shift();
				params.concat(p);
			case "config":
				module = "xeconf";
				operations.push(args[1]);
				var p = args.copy();
				p.shift();
				p.shift();
				params.concat(p);
		}

		switch (module) {
			case "xepm":
				var command = '$modpath/xepm ';
				for (op in operations) {
					switch (op) {
						case "install":
							command += "install " + params.join(" ");
						case "remove":
							command += "remove " + params.join(" ");
						case "sync":
							command += "sync";
						case "upgrade":
							command += "upgrade " + params.join(" ");
						case "search":
							command += "search " + params.join(" ");
						case "info":
							command += "info " + params.join(" ");
						case "list":
							command += "list";
					}
				}
				Sys.command(command);

			default:
				Sys.println("Unsupported module");
				return;
		}
	}
}
