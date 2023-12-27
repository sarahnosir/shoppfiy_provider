import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                    radius: 60,
                    child: CircleAvatar(
                      radius: 38,
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sarah Nosir",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 81, 92, 111),
                      ),
                    ),
                    Text("Sarah@gmail.com",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 81, 92, 111),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "EDIT PROFILE",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(172, 81, 92, 111),
                          ),
                        ),
                        style: TextButton.styleFrom(
                          side: BorderSide(width: 1.0),
                        ))
                  ],
                ),
                SizedBox(
                  width: 120,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(children: [
                ListTile(
                    onTap: () {},
                    leading: Icon(Icons.list),
                    title: Text("All My Orders"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    )),
                ListTile(
                    onTap: () {},
                    leading: Icon(Icons.airport_shuttle),
                    title: Text("Pendding Shipments"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    )),
                ListTile(
                    onTap: () {},
                    leading: Icon(Icons.add_card),
                    title: Text("Pendding Payments"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    )),
                ListTile(
                    onTap: () {},
                    leading: Icon(Icons.shopping_bag),
                    title: Text("Finshed Orders"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ))
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(children: [
                ListTile(
                    onTap: () {},
                    leading: Icon(Icons.outgoing_mail),
                    title: Text("Invite Frindes"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    )),
                ListTile(
                    onTap: () {},
                    leading: Icon(Icons.headset_mic_outlined),
                    title: Text("Customer Support"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    )),
                ListTile(
                    onTap: () {},
                    leading: Icon(Icons.stars_rounded),
                    title: Text("Rate Out app"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    )),
                ListTile(
                    onTap: () {},
                    leading: Icon(Icons.sticky_note_2),
                    title: Text("Make a Suggestion"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ))
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
