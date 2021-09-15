import 'package:flutter/material.dart';
import 'package:deneme/config/colors.dart';
import 'package:deneme/screens/check_out/add_delivery_address/add_delivery_address.dart';
import 'package:deneme/screens/check_out/delivery_details/single_delivery_item.dart';

class DeliveryDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teslimat Detayları"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      bottomNavigationBar: Container(
        // width: 160,
        height: 48,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          child: Text("Yeni Adres Ekle"),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddDeliverAddress(),
              ),
            );
          },
          color: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Teslimat Adresi"),
            leading: Image.asset(
              "assets/location2.png",
              height: 30,
            ),
          ),
          Divider(
            height: 1,
          ),
          Column(
            children: [
              SingleDeliveryItem(
                address: "Çiftlikköy Mahallesi, Yenişehir, Mersin",
                title: "Akif SAHYANOĞLU",
                number: "+90 555 555 55 55",
                addressType: "Ev",
              ),
            ],
          )
        ],
      ),
    );
  }
}
