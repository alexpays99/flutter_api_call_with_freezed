import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_/bloc/user_list_bloc.dart';
import 'package:flutter_application_/models/TotalAmount.dart';
import 'package:flutter_application_/models/user/user.dart';
import 'package:flutter_application_/provider/UserProvider.dart';
import 'package:flutter_application_/screens/UserInfoScreen.dart';
import 'package:flutter_application_/services/ApiService.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter'),
        initialRoute: '/auth',
        routes: {
          '/user_info': (context) => const UserInfoScreen(),
        },
      ),
    );

    // return MultiProvider(
    //   providers: [
    //     BlocProvider(create: (context) => UserListBloc()),
    //     ChangeNotifierProvider(create: (context) => UserProvider()),
    //   ],
    //   child: MaterialApp(
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //     ),
    //     home: const MyHomePage(title: 'Flutter'),
    //     routes: {
    //       '/user_info': (context) => const UserInfoScreen(),
    //     },
    //   ),
    // );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TotalAmount totalAmountModel = TotalAmount(total: 0);
  TotalAmount? newTotalValue;
  final Dio dio = Dio();
  List<User> _users = [];

  final apiService = ApiService();

  Future<void> fetchUsers() async {
    final response = await dio.get(
      'https://jsonplaceholder.typicode.com/users',
    );

    print(response.data);
    final List list = response.data;

    setState(() {
      _users = list.map((e) {
        return User.fromJson(e);
      }).toList();
    });
  }

  Future<void> getUsers() async {
    await apiService.fetchUsers().then((value) {
      final res = value.map((e) => User.fromJson(e)).toList();
      _users.addAll(res);
    });

    setState(() {
      _users;
      print("LIST NEW ${_users.isEmpty ? [] : _users}");
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      newTotalValue = totalAmountModel.copyWith(total: _counter);
    });
  }

  showInitialText() {
    const Text('Initial text');
  }

  showCircuarProgress() {
    const CircularProgressIndicator();
  }

  loadDataFromList(UserProvider userProvider) {
    ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _users.length,
        itemBuilder: (context, int index) {
          final user = _users[index];

          return InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 54, 209, 244),
                        Color.fromARGB(255, 101, 255, 127)
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0.5, 0.9],
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      "${user.username}",
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      "${user.email}",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              onTap: () {
                userProvider.setUser(_users[index]);
                Navigator.of(context)
                    .pushNamed('/user_info', arguments: _users[index]);
              });
        });
  }

  void userAction() {
    print('USER');
  }

  @override
  void initState() {
    // fetchUsers();
    getUsers();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${newTotalValue?.total ?? 0}',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Serialized: ${newTotalValue?.toJson() ?? {}}',
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Deserialized: ${newTotalValue?.toJson() ?? {}}',
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _users.length,
                  itemBuilder: (context, int index) {
                    final user = _users[index];

                    return InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 54, 209, 244),
                                  Color.fromARGB(255, 101, 255, 127)
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                stops: [0.5, 0.9],
                              ),
                            ),
                            child: ListTile(
                              title: Text(
                                "${user.username}",
                                textAlign: TextAlign.center,
                              ),
                              subtitle: Text(
                                "${user.email}",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          userProvider.setUser(_users[index]);
                          Navigator.of(context).pushNamed('/user_info',
                              arguments: _users[index]);
                        });
                  },
                ),
                // child: BlocBuilder<UserListBloc, UserListState>(
                //   builder: (context, state) {
                //     return state.when(
                //         initial: showInitialText(),
                //         loading: showCircuarProgress(),
                //         loaded: loadDataFromList(userProvider));
                //     // return ListView.builder(
                //     //   physics: const AlwaysScrollableScrollPhysics(),
                //     //   scrollDirection: Axis.vertical,
                //     //   shrinkWrap: true,
                //     //   itemCount: _users.length,
                //     //   itemBuilder: (context, int index) {
                //     //     final user = _users[index];

                //     //     return InkWell(
                //     //         child: Padding(
                //     //           padding: const EdgeInsets.all(8.0),
                //     //           child: Container(
                //     //             decoration: BoxDecoration(
                //     //               borderRadius: BorderRadius.circular(10),
                //     //               gradient: const LinearGradient(
                //     //                 colors: [
                //     //                   Color.fromARGB(255, 54, 209, 244),
                //     //                   Color.fromARGB(255, 101, 255, 127)
                //     //                 ],
                //     //                 begin: Alignment.centerLeft,
                //     //                 end: Alignment.centerRight,
                //     //                 stops: [0.5, 0.9],
                //     //               ),
                //     //             ),
                //     //             child: ListTile(
                //     //               title: Text(
                //     //                 "${user.username}",
                //     //                 textAlign: TextAlign.center,
                //     //               ),
                //     //               subtitle: Text(
                //     //                 "${user.email}",
                //     //                 textAlign: TextAlign.center,
                //     //               ),
                //     //             ),
                //     //           ),
                //     //         ),
                //     //         onTap: () {
                //     //           userProvider.setUser(_users[index]);
                //     //           Navigator.of(context).pushNamed('/user_info',
                //     //               arguments: _users[index]);
                //     //         });
                //     //   },
                //     // );
                //   },
                // ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
