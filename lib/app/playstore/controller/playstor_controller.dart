import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playstore_clone/app/playstore/model/playstore_model.dart';

class PlaystoreController extends GetxController {
  @override
  void onInit() {
    // loadPage();
    super.onInit();
  }

  @override
  void dispose() {
    commentTextController.dispose();
    super.dispose();
  }

  RxBool isLoading = false.obs;
  RxBool isInstalling = false.obs;
  Random random = Random();

  final PlaystoreData playstoreData = PlaystoreData(
    title: 'Spotify: Music and Podcasts',
    company: 'Spotify AB',
    description: 'Listen to songs, play podcasts, create playlists and discover music you\'ll love',
    icon: 'https://play-lh.googleusercontent.com/cShys-AmJ93dB0SV8kE6Fl5eSaf4-qMMZdwEDKI5VEmKAXfzOqbiaeAsqqrEBCTdIEs',
    rating: '3.6',
    reviewsTotal: '27M',
    appSize: '33 MB',
    ratedFor: '12',
    downloadsTotal: '1B',
    tags: ['#1 top grossing in music and audio'],
    images: [
      'https://play-lh.googleusercontent.com/8N4n2vHY4MALUUKNXLmhkmjepz0w02Z74KcTlYHrLUgHN1tPTf6UExjl2ClPAkWsnfQ=w2560-h1440-rw',
      'https://play-lh.googleusercontent.com/rrfUq1mVsewJgWMQEB6lF6nFS_VUNBRhPjskFTawg1McNmavDuYWHBsEwOTmcVDGeA=w2560-h1440-rw',
      'https://play-lh.googleusercontent.com/628JpUeTdADMAyn8AfBH_KcfwHw90ZvtsBFHrzVkKPou9xtO8yW2tlniRG008dAvMkkn=w2560-h1440-rw',
      'https://play-lh.googleusercontent.com/Nss7uARra44M9rGNGkdiA6g0sAiobARq5idLxZKuNP5jIYy3dCYWumKsdzdW_ePMKsg=w2560-h1440-rw',
      'https://play-lh.googleusercontent.com/U7Smb8Jsm6CPRhjzmX1MLSHhIor6E3u_hsnpfb9YjDOgXOnu_GiF5v71KAbgCpwIClg=w2560-h1440-rw',
      'https://play-lh.googleusercontent.com/F7NplN8rqxyOFX0htX1-B6tOOyNbBgplvnG3ZfvR93NrHNZn3nktv7sG65RTwKyIIUg=w2560-h1440-rw',
      'https://play-lh.googleusercontent.com/T64BE_32Ohf6_DdRres0HMq1sCvcR8jYWQFeZ_ajwVPTz6T8xJZwtdjh3D-gdf-Prg=w2560-h1440-rw',
      'https://play-lh.googleusercontent.com/OYNLDCz8RKAIhG6JPkZpcNzXyQq0eZfL-FKBk_97ag7NfE5SANWVnTvI8-6GLYzaVw=w2560-h1440-rw'
          'https://play-lh.googleusercontent.com/B98CRgQtwH6V_-1nnTKkePezsBaFOd2YmLdcCTv8ghUUCRL9elWM-LCN2yvSUy-sV4sZ=w2560-h1440-rw',
      'https://play-lh.googleusercontent.com/E3a4Eue2ErM2Nwa7zmm80YZuzPnryykp0Uoo9cf_EUEHyi9SFhtsDtYYpQOa6E8ZXg=w2560-h1440-rw',
      'https://play-lh.googleusercontent.com/6tsD05gyAdNR1mIqWi-se6FtHrJlU4kyGi2S6qi9GMgwub5fKMVrDFOcCBkNZOnEedo=w2560-h1440-rw',
      'https://play-lh.googleusercontent.com/6ulJb3eODlG5jYX3_Ef3JU9z_lltMSxTc1CByh9PfCpk7S5E50Edex0tmLPDHVQeGg=w2560-h1440-rw',
      'https://play-lh.googleusercontent.com/hK7RMBvtSVwsEFyJz8eCJtC4jjyVwE1JcFLUnttm-70W17JoRZYJ_3l5OT6DTqxIWgE=w2560-h1440-rw',
      'https://play-lh.googleusercontent.com/-yqbBUVzNUuP90pa_zxnILIFeL7QvYD0Tzv5AKUbEU0LD2qD5DtlQ_Jj1zmdAMGtzvNJ=w2560-h1440-rw',
      'https://play-lh.googleusercontent.com/ddowvrUzDS1zJy11-bW8i6vdqYyk0yYVPDtn-5hurcU5aV8eEQJljfR7VIl9UCGse2oZ=w2560-h1440-rw',
      'https://play-lh.googleusercontent.com/Ix894gkXp3TBdbk9R6D0Ts3Lx-u80WakmdfTMDhMFW1RIBql4T_ZYxnzhajzJyLsGw=w2560-h1440-rw',
      'https://play-lh.googleusercontent.com/9o7VJTueasF-YD49-QUA-idK5XZJMmxEu7LHoTR3kA9nvFjUChpL7RRCnzXXUrcK6l4=w2560-h1440-rw'
          'https://play-lh.googleusercontent.com/WOTbNVDZdZjCvjtPLs_Cu1sgSvepdTLi6f6h1z8yTSkcm2RoE9-0YB6LZarmlWhOjxI=w2560-h1440-rw',
    ],
    reviews: [],
  );

  TextEditingController commentTextController = TextEditingController();
  RxInt rating = 0.obs;

  // Future<void> loadPage() async {
  //   isLoading.value = true;
  //   await Future.delayed(Duration(seconds: random.nextInt(5) + 5), () => isLoading.value = false);
  // }

  Future<void> installApp() async {
    isInstalling.value = true;

    Future.delayed(Duration(seconds: random.nextInt(15) + 10), () => isInstalling.value = false);
  }

  Future<void> cancelInstallApp() async {
    isInstalling.value = false;
  }
}
