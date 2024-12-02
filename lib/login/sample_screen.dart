// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';
// import 'package:mbtiapp/login/login_platform.dart';

// class SampleScreen extends StatefulWidget {
//   const SampleScreen({super.key});

//   @override
//   State<SampleScreen> createState() => _SampleScreenState();
// }

// class _SampleScreenState extends State<SampleScreen> {
//   LoginPlatform _loginPlatform = LoginPlatform.none;

//   void signInWithKakao() async {
//     try {
//       bool isInstalled = await isKakaoTalkInstalled();

//       OAuthToken token = isInstalled
//           ? await UserApi.instance.loginWithKakaoTalk()
//           : await UserApi.instance.loginWithKakaoAccount();
//       final url = Uri.https('kapi.kakao.com', '/v1/user/access_token_info');
//       final response = await http.get(url, headers: {
//         HttpHeaders.authorizationHeader: 'Bearer ${token.accessToken}'
//       });
//       final profileInfo = json.decode(response.body);
//       print(profileInfo.toString());

//       setState(() {
//         _loginPlatform = LoginPlatform.kakao;
//       });
//     } catch (erorr) {
//       print('카카오톡 로그인 실패 $erorr');
//     }
//   }

//   void signOut() async {
//     switch (_loginPlatform) {
//       case LoginPlatform.facebook:
//         break;
//       case LoginPlatform.apple:
//         break;
//       case LoginPlatform.google:
//         break;
//       case LoginPlatform.kakao:
//         await UserApi.instance.logout();
//         break;
//       case LoginPlatform.naver:
//         break;
//       case LoginPlatform.none:
//         break;
//     }

//     setState(() {
//       _loginPlatform = LoginPlatform.none;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//           child: _loginPlatform != LoginPlatform.none
//               ? _logoutButton()
//               : Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [_loginButton('kakao_logo', signInWithKakao)],
//                 )),
//     );
//   }

//   Widget _loginButton(String path, VoidCallback onTap) {
//     return Ink.image(
//         image: AssetImage('asset/image/$path.png'),
//         width: 200,
//         height: 60,
//         child: InkWell(
//           borderRadius: const BorderRadius.all(
//             Radius.circular(35.0),
//           ),
//           onTap: onTap,
//         ));
//   }

//   Widget _logoutButton() {
//     return SizedBox(
//       width: 200,
//       height: 40,
//       child: ElevatedButton(
//         onPressed: signOut,
//         style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all(
//             const Color(0xff0165E1),
//           ),
//         ),
//         child: const Text('로그아웃'),
//       ),
//     );
//   }
// }
