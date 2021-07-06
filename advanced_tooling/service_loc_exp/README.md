# Service Loc Exp

According to the Flutter State benchmarks here:

[Flutter State Managers](https://github.com/jonataslaw/flutter_state_managers)

Factory DI is better for a state management combination with builders, observables or full reactive streaming then widget DI solutions. Since, those solutions allow me to get rid of using Stateful widgets; I only need a light DI solution using a singleton container factory instance DI set-up. But, I still need to roll my own light(GetIt or Getx, etc.) solution as I need logging to ensure proper tracking of dependency injection.
