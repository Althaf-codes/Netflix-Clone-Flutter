import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/blocs/signIn/signin_bloc.dart';
import 'package:netflix_clone/constant/colors.dart';
import 'package:netflix_clone/constant/my_flutter_app_icons.dart';
import 'package:netflix_clone/widgets/snackbar.dart';
import 'package:netflix_clone/widgets/vertical_icon_button.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 500,
          // decoration: const BoxDecoration(
          //     image: DecorationImage(
          //         fit: BoxFit.cover,
          //         image: NetworkImage(
          //           'https://images-cdn.ubuy.co.in/63b7b107d4159432fb5ec817-avengers-infinity-war-movie-poster.jpg',
          //         ))),
          child: Image.network(
            // 'https://m.media-amazon.com/images/I/91zTlD7AY1L._AC_UF1000,1000_QL80_.jpg',
            'https://images-cdn.ubuy.co.in/63b7b107d4159432fb5ec817-avengers-infinity-war-movie-poster.jpg',
            fit: BoxFit.cover,
            height: 400,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        // Positioned(
        //   top: 100,
        //   left: 0,
        //   child: Container(
        //     height: 100,
        //     decoration: const BoxDecoration(
        //         gradient: LinearGradient(
        //             colors: [Colors.black, Colors.transparent],
        //             begin: Alignment.topLeft,
        //             end: Alignment.topRight)),
        //   ),
        // ),
        Container(
          height: 500,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
        // Container(
        //   height: 500,
        //   decoration: const BoxDecoration(
        //       gradient: LinearGradient(
        //           colors: [Colors.black, Colors.transparent],
        //           begin: Alignment.bottomLeft,
        //           end: Alignment.bottomCenter)),
        // ),
        const Positioned(
          bottom: 88,
          child: SizedBox(
            width: 250,
            child: Text(
              ' Exciting • Reality • Competition ',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        Positioned(
            right: 0,
            left: 0,
            bottom: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VerticalIconButton(
                  icon: Icons.add,
                  title: 'My List',
                  tap: () {},
                  titleColor: AppColor.white,
                ),
                const SizedBox(
                  width: 40,
                ),
                MaterialButton(
                  color: Colors.white,
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.play_arrow),
                      Text(
                        'Play',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                Builder(builder: (context) {
                  return VerticalIconButton(
                    icon: Icons.logout_outlined, // MyFlutterApp.info_outline,
                    title: 'Logout', //'Info',
                    tap: () {
                      context.read<SignInBloc>().add(SignOutRequired());
                    },
                    titleColor: AppColor.white,
                  );
                }),
              ],
            ))
      ],
    );
  }
}
