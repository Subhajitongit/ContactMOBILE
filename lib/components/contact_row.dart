import 'package:flutter/material.dart';

class ContactRow extends StatelessWidget {
  const ContactRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const ContactTile(
                  number: "9874561257",
                  categoryName: "Name",
                );
              }),
        ),
      ),
    );
  }
}

class ContactTile extends StatelessWidget {
  const ContactTile({Key? key, this.number, this.categoryName})
      : super(key: key);

  final number;
  final categoryName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(left: 12),
        child: Stack(
          children: [
            Text(number),
            Container(
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Text(categoryName,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
