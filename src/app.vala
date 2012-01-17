namespace Vsgi {
	public interface IApp : Object {
		void hello () {
		}
	}

	public class App : Object, IApp {
		string hell;
		public App () {
			hell = "hello";
		}
		void hello () {
		}
	}
}
