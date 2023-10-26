class Main {
    static function main() {
        final args = Sys.args();
        final options = new Array<String>();
        final operations = new Array<String>();
        var module = "";
        final params = new Array<String>();

        for (arg in args) {
            if (arg.startsWith("--")) {
                switch (arg) {
                    default:
                        Sys.println('Unknown option: $arg');
                        return;
                }
            }
            else if (arg.startsWith("-")) {
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
                            }
                    }
                }
            }
            else {}
        }
    }
}
