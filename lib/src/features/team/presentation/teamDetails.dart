import 'package:error/constans.dart';
import 'package:flutter/material.dart';

class TeamDetails extends StatelessWidget {
  const TeamDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    child: CircleAvatar(
                      radius: 40.0,
                      backgroundColor: Colors.amber,
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Joy Shil',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Flutter Developer ',
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 130,
                      padding: EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Role',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.grey,
                                    ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Developer',
                                style: Theme.of(context).textTheme.bodyMedium,
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Team',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.grey,
                                    ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Product',
                                style: Theme.of(context).textTheme.bodyMedium,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextButton(
                        onPressed: () {
                          print('im pressed');
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: Text(
                            'Edit Profile',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 244, 243, 243),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Address',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.grey,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              'Kazipara, barasat',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'City',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.grey,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              'Barasat',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Dist',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.grey,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              'North 24 parganas',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Pin',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.grey,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              '700156',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
