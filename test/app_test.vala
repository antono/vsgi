Vsgi.App app;

void setup () {
	app = new Vsgi.App ();
}

void teardown () {
}

void test_app_variables () {
	setup ();
	var str = "hello";
	assert (str == "hello");
	teardown ();
}

int main (string[] args) {
	Test.init (ref args);
	Test.add_func("/vsgi/app/variables", test_app_variables);
	Test.run ();
	return 0;
}
