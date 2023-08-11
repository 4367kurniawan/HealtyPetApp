// import 'package:feather_icons/feather_icons.dart';

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtypetapp/models/doctor_model.dart';
import 'package:healtypetapp/models/services_model.dart';

var selectedService = 0;
var selectedBottomMenu = 0;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      bottomNavigationBar: Container(
        height: 76,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.13),
              blurRadius: 30,
              offset: const Offset(
                0,
                -10,
              ),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                FeatherIcons.home,
                color: selectedBottomMenu == 0
                    ? const Color(0xFF818AF9)
                    : const Color(0xFFBFBFBF),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                FeatherIcons.heart,
                color: selectedBottomMenu == 1
                    ? const Color(0xFF818AF9)
                    : const Color(0xFFBFBFBF),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                FeatherIcons.messageCircle,
                color: selectedBottomMenu == 2
                    ? const Color(0xFF818AF9)
                    : const Color(0xFFBFBFBF),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                FeatherIcons.user,
                color: selectedBottomMenu == 3
                    ? const Color(0xFF818AF9)
                    : const Color(0xFFBFBFBF),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 23),
              _greetings(),
              const SizedBox(
                height: 17,
              ),
              _card(),
              const SizedBox(
                height: 20,
              ),
              _search(),
              const SizedBox(
                height: 20,
              ),
              _services(),
              const SizedBox(
                height: 28,
              ),
              _doctors()
            ],
          ),
        ),
      ),
    );
  }

  ListView _doctors() {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => _doctor(doctors[index]),
        separatorBuilder: (context, index) => const SizedBox(
              height: 11,
            ),
        itemCount: doctors.length);
  }

  Container _doctor(DoctorModel doctorModel) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF35385A).withOpacity(.12),
            blurRadius: 30,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Image.asset(
              'assets/images/${doctorModel.images}',
              height: 103,
              width: 88,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorModel.name,
                  style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF3F3E3F)),
                ),
                const SizedBox(
                  height: 7,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Services: ${doctorModel.services.join(', ')}',
                    style: GoogleFonts.manrope(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    const Icon(
                      FeatherIcons.mapPin,
                      size: 14,
                      color: Color(0xFFACA3A3),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      '${doctorModel.distance}km',
                      style: GoogleFonts.manrope(
                          fontSize: 12, color: const Color(0xFFACA3A3)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Available for',
                        style: GoogleFonts.manrope(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF50CC98),
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/cat.svg',
                            height: 10,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset(
                            'assets/svgs/cat.svg',
                            height: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _services() {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: selectedService == index
                      ? const Color(0xFF818AF9)
                      : const Color(0xFFF6F6F6),
                  border: selectedService == index
                      ? Border.all(
                          color: const Color(0xFFF1E5E5).withOpacity(.22),
                          width: 2)
                      : null),
              child: Center(
                child: Text(
                  Services.all()[index],
                  style: GoogleFonts.manrope(
                      color: selectedService == index
                          ? Colors.white
                          : const Color(0xFF3F3E3F).withOpacity(.4),
                      fontWeight: FontWeight.w800),
                ),
              ),
            )),
        separatorBuilder: ((context, index) => const SizedBox(
              width: 10,
            )),
        itemCount: Services.all().length,
      ),
    );
  }

  Container _search() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(14)),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: const Icon(
            FeatherIcons.search,
            color: Color(0xFFADACAD),
          ),
          hintText: 'Find best vaccinate, treatment...',
          hintStyle: GoogleFonts.manrope(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            height: 150 / 100,
            color: const Color(0XFFCACACA),
          ),
        ),
      ),
    );
  }

  AspectRatio _card() {
    return AspectRatio(
      aspectRatio: 336 / 184,
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 184,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color(0XFF818AF9),
        ),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/background_cat.png',
              height: double.maxFinite,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Your ',
                      style: GoogleFonts.manrope(
                        fontSize: 14,
                        height: 150 / 100,
                      ),
                      children: [
                        TextSpan(
                          text: 'Catrine ',
                          style: GoogleFonts.manrope(
                              fontSize: 14, fontWeight: FontWeight.w800),
                        ),
                        const TextSpan(text: 'will get\n'),
                        const TextSpan(text: 'vaccination '),
                        TextSpan(
                          text: 'tommorow\nat 07.00 am!',
                          style: GoogleFonts.manrope(
                              fontSize: 14, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.4),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.white.withOpacity(.12), width: 2),
                    ),
                    child: const Text(
                      'See details',
                      style: TextStyle(color: Colors.white),
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

  Padding _greetings() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Hello, Human!',
            style: GoogleFonts.manrope(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              height: 150 / 100,
              color: const Color(0XFF3F3E3F),
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(
                FeatherIcons.shoppingBag,
                size: 24,
                color: Color(0XFF818AF9),
              ),
              Positioned(
                right: -3,
                top: -4,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15 / 2),
                    color: const Color(0XFFEF6497),
                  ),
                  child: Center(
                      child: Text(
                    '2',
                    style: GoogleFonts.mPlus1p(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
