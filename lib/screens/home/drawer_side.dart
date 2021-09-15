import 'package:deneme/providers/user_provider.dart';
import 'package:deneme/screens/home/home_screen.dart';
import 'package:deneme/screens/my_profile/my_profile.dart';
import 'package:deneme/screens/review_cart/review_cart.dart';
import 'package:deneme/screens/wishList/wish_list.dart';
import 'package:flutter/material.dart';
import 'package:deneme/config/colors.dart';

class DrawerSide extends StatefulWidget {
  UserProvider? userProvider;
  DrawerSide({this.userProvider});
  @override
  _DrawerSideState createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  Widget listTile({String? title, IconData? iconData, Function()? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        iconData,
        size: 32,
      ),
      title: Text(
        title!,
        style: TextStyle(color: textColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var userData = widget.userProvider!.currentData;
    return Drawer(
      child: Container(
        color: primaryColor,
        child: ListView(
          children: [
            DrawerHeader(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white54,
                      radius: 43,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: primaryColor,
                        backgroundImage: NetworkImage(userData!.userImage ??
                            "https://pbs.twimg.com/profile_images/1421446532944048132/QhPEH7Xw_400x400.jpg"),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(userData.userName!),
                        Text(
                          userData.userEmail!,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            listTile(
              iconData: Icons.home_outlined,
              title: "Ana Sayfa",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
            ),
            listTile(
              iconData: Icons.shopping_bag_outlined,
              title: "Sepet",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReviewCart(),
                  ),
                );
              },
            ),
            listTile(
              iconData: Icons.person_outlined,
              title: "Profil",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        MyProfile(userProvider: widget.userProvider!),
                  ),
                );
              },
            ),
            listTile(
              iconData: Icons.notifications_outlined,
              title: "Bildirimler",
            ),
            listTile(
              iconData: Icons.star_outlined,
              title: "Favoriler",
            ),
            listTile(
                iconData: Icons.favorite_outlined,
                title: "İstek listesi",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WishList(),
                    ),
                  );
                }),
            listTile(
              iconData: Icons.copy_outlined,
              title: "Dilek ve Şikayet",
            ),
            listTile(
              iconData: Icons.format_quote_outlined,
              title: "FAQs",
            ),
            Container(
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("İletişim Bilgileri"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Bizi Arayın"),
                      SizedBox(
                        width: 10,
                      ),
                      Text("+90 559 891 69 98"),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text("Mail Adresimiz"),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "akfshyno@gmail.com",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
