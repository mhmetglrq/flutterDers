import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/extensions/context_extension.dart';
import 'package:flutter_application_1/config/utility/constants/mock_post_items.dart';

import '../widgets/post_card.dart';
import '../widgets/profile_circle.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: context.paddingAllDefault,
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height: context.dynamicHeight(0.05),
                child: Text(
                  "Instagram Clone",
                  style: context.textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: context.dynamicHeight(0.10),
                child: const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ProfileCircle(
                        profilePhoto:
                            "https://www.wilsoncenter.org/sites/default/files/media/images/person/james-person-1.jpg",
                      ),
                      ProfileCircle(
                          profilePhoto:
                              "https://www.georgetown.edu/wp-content/uploads/2022/02/Jkramerheadshot-scaled-e1645036825432-1050x1050-c-default.jpg"),
                      ProfileCircle(
                          profilePhoto:
                              "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg"),
                      ProfileCircle(
                          profilePhoto:
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Pierre-Person.jpg/1200px-Pierre-Person.jpg"),
                      ProfileCircle(
                          profilePhoto:
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Pierre-Person.jpg/1200px-Pierre-Person.jpg"),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: context.dynamicHeight(0.05),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    final post = posts[index];
                    return PostCard(
                      postModel: post,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Ekle",
        elevation: 5,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
