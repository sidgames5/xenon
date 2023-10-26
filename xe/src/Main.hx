class Main {
    static function main() {
        final args = Sys.args();
        final options = new Array<String>();
        var operation = "";
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
            else if (arg.startsWith("-")) {}
            else {}
        }
    }
}
