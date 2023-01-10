import 'dart:io';
import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:extensions/string_extensions.dart';
import 'package:filosofia/filosofia.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:network/network.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:widgets/show_snackbar.dart';
import 'package:wopta/authentication/data/repository/authentication_repository.dart';
import 'package:wopta/authentication/ui/bloc/app_bloc.dart';
import 'package:wopta/featuremanager/feature_manager.dart';
import 'package:wopta/profile/ui/screen/user_form.dart';

String imageDefaultName = "profileImage";

/// chiamato da customer_screen
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  openGallery(String uid) async {
    var image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (image == null) return;

    context.loaderOverlay.show();
    var file = File(image.path);
    var fileList = await FirebaseStorage.instance
        .ref('users/$uid/profile_image/')
        .listAll();
    if (fileList.items.isNotEmpty) {
      var fileesistente = fileList.items[0];
      fileesistente.delete();
    }

    final fileRef = await FirebaseStorage.instance
        .ref('users/$uid/profile_image/$imageDefaultName');
    await fileRef.putFile(file);

    if (!mounted) return;
    await context
        .read<AuthenticationRepository>()
        .updateUserPictureUrl(await fileRef.getDownloadURL());
    context.loaderOverlay.hide();
    return;
  }

  openCamera(String uid) async {
    if (await Permission.camera.request().isGranted) {
      var image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) {
        return;
      }

      context.loaderOverlay.show();
      var file = File(image.path);

      var fileList = await FirebaseStorage.instance
          .ref('users/$uid/profile_image/')
          .listAll();
      if (fileList.items.isNotEmpty) {
        var fileesistente = fileList.items[0];
        fileesistente.delete();
      }

      final fileRef = FirebaseStorage.instance
          .ref('users/$uid/profile_image/$imageDefaultName');

      await fileRef.putFile(file);

      if (!mounted) return;
      await context
          .read<AuthenticationRepository>()
          .updateUserPictureUrl(await fileRef.getDownloadURL());

      context.loaderOverlay.hide();
      setState(() {});
      return;
    }
    showSnackBar(
      context,
      true,
      "Permessi negati",
      actionLabel: 'Impostazioni',
      onActionPressed: () {
        openAppSettings();
      },
    );
  }

  Future<void> showChoiceDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Carica foto da:',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                SizedBox(
                  height: 50,
                  child: MaterialButton(
                    onPressed: () {
                      openGallery(
                        context.read<AuthenticationRepository>().currentUser.id,
                      );
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.image,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        const Text(
                          'Galleria',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: MaterialButton(
                    onPressed: () {
                      openCamera(
                        context.read<AuthenticationRepository>().currentUser.id,
                      );
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.photo_camera,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        const Text(
                          'Fotocamera',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final featureManager = context.read<FeatureManager>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/');
          },
        ),
        elevation: 0,
        title: Text(
          'Anagrafica',
          style: FilosofiaTheme.of(context).textTheme.appBarTitle,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          BlocBuilder<AppBloc, AppState>(
            builder: (contextBloc, state) {
              if (state.status == AppStatus.unauthenticated) {
                return const Center(
                  child: FilosofiaCircularIndicator(),
                );
              }
              final user = state.user;
              return Column(
                children: [
                  Stack(
                    children: [
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationX(math.pi),
                        child: Image.asset(
                          'assets/images/background-profile.png',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Center(
                          child: CircleAvatar(
                            radius: 52.0,
                            backgroundColor: FilosofiaTheme.of(context)
                                .theme
                                .materialTheme
                                .primaryColor,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: GestureDetector(
                                onTap: () {
                                  if (kIsWeb) {
                                    openGallery(
                                      context
                                          .read<AuthenticationRepository>()
                                          .currentUser
                                          .id,
                                    );
                                    return;
                                  }
                                  showChoiceDialog(context);
                                },
                                child: state.user.pictureUrl.isNullOrEmpty()
                                    ? Container(
                                        color: FilosofiaTheme.of(context)
                                            .theme
                                            .materialTheme
                                            .primaryColor,
                                        child: const Center(
                                          child: Icon(
                                            Icons.add_photo_alternate_outlined,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        ),
                                      )
                                    : SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: ClipOval(
                                          child: CachedNetworkImage(
                                            imageUrl: state.user.pictureUrl!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: UserForm(
                      user: user,
                    ),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.all(FilosofiaTheme.of(context).spacing.xl),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Image.asset(
                              'assets/icons/lock_128.png',
                              color: FilosofiaTheme.of(context)
                                  .theme
                                  .materialTheme
                                  .iconTheme
                                  .color,
                              height: 32,
                            ),
                            onTap: () async {
                              context.go('/customer/profile/changepassword');
                            },
                            title: const Text(
                              'Cambia password',
                            ),
                          ),
                          if (featureManager.isPrivacyOptionsEnabled())
                            ListTile(
                              leading: Image.asset(
                                'assets/icons/shield_128.png',
                                color: FilosofiaTheme.of(context)
                                    .theme
                                    .materialTheme
                                    .iconTheme
                                    .color,
                                height: 32,
                              ),
                              onTap: () async {
                                context.go('/customer/profile/privacy');
                              },
                              title: const Text(
                                'Consenso privacy',
                              ),
                            ),
                        ],
                      )),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
