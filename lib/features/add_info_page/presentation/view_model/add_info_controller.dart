import 'package:donation/core/consts/route.dart';
import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/core/helper/location_permission.dart';
import 'package:donation/core/helper/overlay_helper.dart';
import 'package:donation/core/models/address.dart';
import 'package:donation/core/models/item_model.dart';
import 'package:donation/features/add_info_page/data/repo/add_info_repo.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/helper/convertLatLangToAddress.dart';

class AddInfoController extends GetxController {
  List<ItemModel> data = [];
  AddInfoRepo addInfoRepo;

  ///
  AddInfoController({required this.addInfoRepo});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ///
  ImagePicker picker = ImagePicker();
  final image = ''.obs;
  String? nOfPieces;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  Position? currentPosition;
  GoogleMapController? googleMapController;
  final isLoading = false.obs;
  String totalAddress = '';
  String apartmentNumber = '';
  String specialMarque = '';
  String addressDetails = '';
  Set<Marker> markers = {};
  String? currentPos = 'Egypt';
  final isLoadingSubmitted = false.obs;

  ///picked photo from Gallery
  pickedPhotoFromGallery() async {
    try {
      XFile? picked = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 25,
      );
      if (picked != null) {
        image.value = picked.path;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  ///picked photo from camera
  pickedPhotoFromCamera() async {
    try {
      XFile? picked = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 25,
      );
      if (picked != null) {
        image.value = picked.path;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  ///select date
  selectDateFunc(context) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
      builder: (context, widget) => Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light().copyWith(
              primary: AppConsts.mainColor,
            ),
          ),
          child: widget!),
    ).then(
      (value) {
        if (value == null) {
          return;
        } else {
          selectedDate = value;
        }
      },
    );
    update();
  }

  ///select time
  selectTimeFunc(context) async {
    await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, widget) => Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light().copyWith(
              primary: AppConsts.mainColor,
            ),
          ),
          child: widget!),
    ).then(
      (value) {
        if (value == null) {
          return;
        } else {
          selectedTime = value;
        }
      },
    );
    update();
  }

  ///change number of pieces
  changeNofPieces(String value) => nOfPieces = value;

  ///change Apartment Number
  changeApartmentNumber(String value) => apartmentNumber = value;

  ///change Special Marque
  changeSpecialMarque(String value) => specialMarque = value;

  ///change Address Details
  changeAddressDetails(String value) => addressDetails = value;

  /// confirm address
  confirmAddress() async {
    if (apartmentNumber.isEmpty ||
        specialMarque.isEmpty ||
        addressDetails.isEmpty) {
      OverlayHelper.showWarningToast(
        Get.overlayContext!,
        StringsEn.enterTheCorrectInfo.tr,
      );
    } else {
      try {
        await totalAddressDetails();
        OverlayHelper.showSuccessToast(
          Get.overlayContext!,
          StringsEn.confirmAddress.tr,
        );
        Get.back();
      } catch (e) {
        OverlayHelper.showWarningToast(
          Get.overlayContext!,
          StringsEn.enterYourPosition.tr,
        );
      }
    }
  }

  ///total address details
  totalAddressDetails() async {
    totalAddress = await getAddressFromLatLng(
      latitude: currentPosition!.latitude,
      longitude: currentPosition!.longitude,
    );
    currentPos = totalAddress;

    update();
  }

  ///has permission?
  Future<bool> permissionMethod(BuildContext context) async {
    final bool hasPermission = await handleLocationPermission(context);
    return hasPermission;
  }

  ///created map
  onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
    update();
  }

  ///get current location
  getCurrentLocation(BuildContext context) async {
    markers.clear();
    try {
      final bool hasPermission = await permissionMethod(context);
      if (!hasPermission) return;
      isLoading.value = true;
      await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      ).then(
        (Position value) {
          currentPosition = value;
          totalAddressDetails();
        },
      );
      isLoading.value = false;
      // ignore: use_build_context_synchronously
      goToCurrentLocation(context);
    } catch (e) {
      OverlayHelper.showWarningToast(
        Get.overlayContext!,
        StringsEn.someThingOccur.tr,
      );
    }
    update();
  }

  ///go to cuurent position
  goToCurrentLocation(BuildContext context) async {
    if (currentPosition != null) {
      await googleMapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              currentPosition!.latitude,
              currentPosition!.longitude,
            ),
            zoom: 15,
          ),
        ),
      );
      addMarker(
        LatLng(
          currentPosition!.latitude,
          currentPosition!.longitude,
        ),
        'Home',
      );
    } else {
      print("current position is null!");
    }
    update();
  }

  ///add marker
  addMarker(LatLng latlng, String info) {
    markers.add(
      Marker(
        markerId: const MarkerId('My position'),
        position: LatLng(
          latlng.latitude,
          latlng.longitude,
        ),
        infoWindow: InfoWindow(title: info),
      ),
    );
    //getPolyPoints();
    update();
  }

  /// add data to firebase
  addToFirebase() async {
    if (formKey.currentState!.validate()) {
      if (selectedDate == null ||
          image.value.isEmpty ||
          nOfPieces == null ||
          selectedTime == null ||
          addressDetails.isEmpty) {
        OverlayHelper.showWarningToast(
          Get.overlayContext!,
          StringsEn.enterTheCorrectInfo.tr,
        );
      } else {
        isLoadingSubmitted.value = true;
        try {
          addInfoRepo.addToFirebase(
            itemModel: ItemModel(
              date: '$selectedDate',
              imageUrl: await addImageToFireStorage(
                imageName: image.value,
                imagePath: image.value,
              ),
              status: 'accept',
              address: Address(
                address: addressDetails,
                areaNumber: specialMarque,
                lng: '${currentPosition!.longitude}',
                lat: '${currentPosition!.latitude}',
                apartmentNumber: apartmentNumber,
              ),
              pieces: '$nOfPieces',
              time: selectedTime!.format(Get.context!),
            ),
          );

          ///thank you for donate
          OverlayHelper.showSuccessToast(
            Get.overlayContext!,
            StringsEn.thankYouForDonation.tr,
          );
          Get.offAllNamed(bottomNavPath);
        } catch (e) {
          OverlayHelper.showWarningToast(
            Get.overlayContext!,
            StringsEn.someThingOccur.tr,
          );
        }
        isLoadingSubmitted.value = false;
      }
    }
  }

  ///add image to firestorage
  Future<String> addImageToFireStorage({
    required String imagePath,
    required String imageName,
  }) async {
    return await addInfoRepo.addImageToStorage(
      imagePath: imagePath,
      imageName: imageName,
    );
  }
}

///gs://amit-fbdee.appspot.com/products_images/data/user/0/com.example.firebase_amit/cache
