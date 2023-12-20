import 'dart:async';
import 'dart:collection';

import 'package:application/app/profile/controller/addresses_controller.dart';
import 'package:application/components/custom_phone_field.dart';
import 'package:application/packages.dart';
import 'package:application/required_files.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../../components/title_page.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({super.key});

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  final double space = 32;

  final _ = Get.find<AddressesController>();

  final String title = 'Add address';

  final String subTitle = 'Fill in the fields to add a new address';

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _addressName = TextEditingController();

  final TextEditingController _country = TextEditingController();

  final TextEditingController _state = TextEditingController();

  final TextEditingController _city = TextEditingController();

  final TextEditingController _addressLine1 = TextEditingController();

  final TextEditingController _addressLine2 = TextEditingController();

  final TextEditingController _countryCode = TextEditingController();

  final TextEditingController _phoneNumber = TextEditingController();
  final Completer<GoogleMapController> _controller = Completer();

  double? lati;
  double? long;
  Set<Marker> markers = <Marker>{};
  Marker? marker;

  final CameraPosition _initialPosition = const CameraPosition(
    target: LatLng(36.5102369, 37.9401069),
    zoom: 11.0,
  );

  Future<void> _goToPosition({required LatLng latLng}) async {
    final CameraPosition newPosition = CameraPosition(
      target: latLng,
      zoom: 18.0,
    );

    final GoogleMapController controller = await _controller.future;
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(newPosition))
        .whenComplete(() {
      marker = Marker(markerId: const MarkerId('0'), position: latLng);
      setState(() {
        markers.add(marker!);
      });
    });
  }

  void _addNewMarker(LatLng latLng) {
    lati = latLng.latitude;
    long = latLng.longitude;
    markers.clear();
    marker = Marker(markerId: const MarkerId('0'), position: latLng);
    setState(() {
      markers.add(marker!);
    });
  }

  @override
  void initState() {
    super.initState();
    getMocation();
  }

  void getMocation() async {
    Location location = Location();

    bool serviceEnabled;
    bool permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await PerHandler.location();
    if (!permissionGranted) {
      return;
    }

    locationData = await location.getLocation();

    if (locationData.latitude != null && locationData.longitude != null) {
      lati = locationData.latitude ?? 0.0;
      long = locationData.longitude ?? 0.0;
      _goToPosition(latLng: LatLng(lati ?? 0.0, long ?? 0.0));
    }
  }

  void _addNewAddress() async {
    if (_.isLoading.value) return;

    if (_formKey.currentState!.validate()) {
      var newAddress = {
        'address_name': _addressName.text,
        'country': _country.text,
        'state': _state.text,
        'city': _city.text,
        'address_line_1': _addressLine1.text,
        'address_line_2': _addressLine2.text,
        'country_code': _countryCode.text,
        'phone_number': _phoneNumber.text,
        'latitude': lati,
        'longitude': long,
      };
      _.addNewAddresse(newAddress: newAddress);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    PageTitle(
                      title: title,
                      subTitle: subTitle,
                    ),
                  ],
                ),
                SizedBox(height: space),
                CustomTextField(
                  labelText: 'Address Name',
                  hintText: 'Ex. Home',
                  controller: _addressName,
                  keyboardType: TextInputType.name,
                  validator: (value) => Validator.isEmpty(value!),
                ),
                SizedBox(height: space / 2),
                Text('My Location'.tr),
                const SizedBox(height: 2),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.grayColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: _initialPosition,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      scrollGesturesEnabled: true,
                      zoomGesturesEnabled: true,
                      myLocationButtonEnabled: true,
                      zoomControlsEnabled: false,
                      gestureRecognizers: <Factory<
                          OneSequenceGestureRecognizer>>{
                        Factory<OneSequenceGestureRecognizer>(
                          () => EagerGestureRecognizer(),
                        ),
                      },
                      markers: markers,
                      onTap: (LatLng latLng) => _addNewMarker(latLng),
                    ),
                  ),
                ),
                SizedBox(height: space / 2),
                CustomTextField(
                  labelText: 'country',
                  hintText: 'Ex. Syria',
                  controller: _country,
                  keyboardType: TextInputType.name,
                  validator: (value) => Validator.isEmpty(value!),
                ),
                SizedBox(height: space / 2),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomTextField(
                        labelText: 'State',
                        hintText: 'Ex. Aleppo',
                        controller: _state,
                        keyboardType: TextInputType.name,
                        validator: (value) => Validator.isEmpty(value!),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 1,
                      child: CustomTextField(
                        labelText: 'City',
                        hintText: 'Ex. Manbij',
                        controller: _city,
                        keyboardType: TextInputType.name,
                        validator: (value) => Validator.isEmpty(value!),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: space / 2),
                CustomTextField(
                  labelText: 'Address line 1',
                  controller: _addressLine1,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: space / 2),
                CustomTextField(
                  labelText: 'Address line 2',
                  controller: _addressLine2,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: space),
                CustomPhoneField(
                    labelText: 'Phone Number',
                    hintText: 'The phone number for this address',
                    initialSelected: '+963',
                    phoneNumber: _phoneNumber,
                    contryCode: _countryCode),
                SizedBox(height: space * 2),
                Center(
                  child: Obx(
                    () => CustomElevatedButton(
                      onPressed: _addNewAddress,
                      child: _.isLoading.value
                          ? const CustomProgress(color: Colors.white)
                          : const Text(
                              'Save',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: space)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
