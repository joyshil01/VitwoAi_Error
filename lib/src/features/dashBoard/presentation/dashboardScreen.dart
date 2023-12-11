import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../constans.dart';
import '../../../routing/app_router.dart';
import '../../../utils/media-query.dart';
import '../../../widget/barGraph.dart';
import '../../../widget/indicator.dart';
import '../../../widget/pieChart.dart';
import '../../Assigned/presentation/logoutController.dart';

class DashBoardScreen extends ConsumerStatefulWidget {
  const DashBoardScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashBoardScreenState();
}

class _DashBoardScreenState extends ConsumerState<DashBoardScreen> {
  String? userName;
  String? userType;
  String? userImage;

  void callSharedPrefs() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      userName = sharedPreferences.getString('userName')!;
      userType = sharedPreferences.getString('userType')!;
      userImage = sharedPreferences.getString('userImage')!;
    });
  }

  bool role = false;

  void userRole() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    setState(() {
      role = localStorage.getString('userType') == 'Approver'
          ? true
          : localStorage.getString('userType') == 'Viewer'
              ? true
              : false;
    });
  }

  @override
  void initState() {
    callSharedPrefs();
    userRole();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        automaticallyImplyLeading: false,
        title: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                content: ListTile(
                  leading: const Icon(Icons.logout_outlined),
                  title: Text('Log_out'.toUpperCase()),
                  onTap: () async {
                    final success = await ref
                        .read(logoutVendorControllerProvider.notifier)
                        .logoutVendor();
                    if (success) {
                      print('sucess---------------');
                      SharedPreferences sharedPrefs =
                          await SharedPreferences.getInstance();
                      sharedPrefs.clear();
                      context.goNamed(AppRoute.login.name);
                    }
                  },
                ),
              ),
            );
          },
          child: Row(
            children: [
              CircleAvatar(
                radius: SizeVariables.getHeight(context) * 0.02,
                backgroundImage: NetworkImage(
                  userImage ?? '',
                ),
              ),
              const SizedBox(width: 4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(userName ?? 'Your name'),
                ],
              ),
              const SizedBox(width: 5),
            ],
          ),
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(
        //       Icons.share,
        //     ),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Status Summary',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 200,
              child: PieChartSample2(),
            ),
          ),
          role == true
              ? Row(
                  //////////////////////// Approver ////////////////////////////////////
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Indicator(
                      color: Colors.redAccent.shade100,
                      text: 'Issue Log',
                      isSquare: true,
                    ),
                    Indicator(
                      color: mainColor,
                      text: 'Assigned',
                      isSquare: true,
                    ),
                    Indicator(
                      color: Colors.amber,
                      text: 'Todo',
                      isSquare: true,
                    ),
                    Indicator(
                      color: Colors.green,
                      text: 'Done',
                      isSquare: true,
                    ),
                  ],
                )
              : Row(
                  //////////////////////// Viewer ////////////////////////////////////
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Indicator(
                      color: mainColor,
                      text: 'Assigned',
                      isSquare: true,
                    ),
                    Indicator(
                      color: Colors.amber,
                      text: 'Todo',
                      isSquare: true,
                    ),
                    Indicator(
                      color: Colors.green,
                      text: 'Done',
                      isSquare: true,
                    ),
                  ],
                ),
          Expanded(
            child: BarGraph(),
          ),
        ],
      ),
    );
  }
}
