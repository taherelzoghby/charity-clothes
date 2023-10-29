import 'package:donation/core/services/service_locator.dart';
import 'package:donation/core/widgets/custom_button.dart';
import 'package:donation/core/widgets/loading_widget.dart';
import 'package:donation/features/add_info_page/data/repo/add_info_repo_implementation.dart';
import 'package:donation/features/add_info_page/presentation/view_model/add_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapBody extends StatelessWidget {
  const GoogleMapBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.find<AddInfoController>();
    return Stack(
      children: [
        ///google map
        GetBuilder<AddInfoController>(
          init:AddInfoController(
            addInfoRepo: getIt.get<AddInfoRepoImplementation>(),
          ),
          builder: (cont) => ClipRRect(
            borderRadius: BorderRadius.circular(15.sp),
            child: GoogleMap(
              markers: cont.markers,
              trafficEnabled: true,
              myLocationEnabled: true,
              mapType: MapType.hybrid,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  cont.currentPosition?.latitude ?? 31.226758,
                  cont.currentPosition?.longitude ?? 29.934653,
                ),
                zoom: 16,
              ),
              onMapCreated: (GoogleMapController controller) =>
                  cont.onMapCreated(controller),
            ),
          ),
        ),

        ///loading
        Obx(
          () => controller.isLoading.value
              ? const LoadingWidget()
              : const Center(),
        ),

        ///my current location
        Positioned(
          bottom: size.height * .12.h,
          right: size.width * .05.w,
          child: CustomButtonCircle(
            onTap: () => controller.getCurrentLocation(context),
            widget: const Icon(Icons.location_on),
          ),
        ),
      ],
    );
  }
}
