import 'dart:async';
import 'package:application/app/adresses/controlers/addresses_controller.dart';
import 'package:application/app/adresses/models/address.dart';
import 'package:application/components/custom_phone_field.dart';
import 'package:application/packages.dart';
import 'package:application/required_files.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../../components/title_page.dart';

class EditMyAddress extends StatefulWidget {
  const EditMyAddress({super.key});

  @override
  State<EditMyAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditMyAddress> {
  final double space = 32;

  final _ = Get.find<AddressesController>();

  final String title = 'Edit title';

  final _formKey = GlobalKey<FormState>();
  final Completer<GoogleMapController> _controller = Completer();
  final Location location = Location();

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _state = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _addressLine1 = TextEditingController();
  final TextEditingController _addressLine2 = TextEditingController();
  int? id;

  double? lati;
  double? long;

  Set<Marker> markers = <Marker>{};
  Marker? marker;
  final address = Get.arguments as UserAddress;

  @override
  void initState() {
    super.initState();
    setDefaultValue();
  }

  setDefaultValue() {
    id = address.id;
    _firstName.text = address.firstName ?? '';
    _lastName.text = address.lastName ?? '';
    _phoneNumber.text = address.phoneNumber ?? '';
    _country.text = address.country ?? '';
    _state.text = address.state ?? '';
    _city.text = address.city ?? '';
    _addressLine1.text = address.addressLine1 ?? '';
    _addressLine2.text = address.addressLine2 ?? '';
    if (!hasLocation(
        latitude: address.latitude, longitude: address.longitude)) {
      return;
    }
    _goToPosition(
        latLng: LatLng(
            double.parse(address.latitude!), double.parse(address.longitude!)));
  }

  bool hasLocation({required latitude, required longitude}) {
    if (latitude != '0.00000000' &&
        longitude != '0.00000000' &&
        latitude != null &&
        longitude != null) {
      return true;
    }
    return false;
  }

  Future<void> _goToPosition({required LatLng latLng}) async {
    final CameraPosition newPosition = CameraPosition(
      target: latLng,
      zoom: 18.0,
    );

    final GoogleMapController controller = await _controller.future;
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(newPosition))
        .whenComplete(() {
      _addNewMarker(latLng);
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

  void _addNewAddress() 
   {
    if (_.isLoading.value) return;

    if (_formKey.currentState!.validate()) {
      var newAddress = {
        'id': id,
        'first_name': _firstName.text,
        'last_name': _lastName.text,
        'country': _country.text,
        'state': _state.text,
        'city': _city.text,
        'address_line_1': _addressLine1.text,
        'address_line_2': _addressLine2.text,
        'phone_number': _phoneNumber.text,
        'latitude': lati,
        'longitude': long,
      };
      _.updateAddress(newAddress: newAddress);
    }
  }

  @override
  void dispose() {
    super.dispose();
    clear();
  }

  clear() {
    _firstName.clear();
    _lastName.clear();
    _country.clear();
    _state.clear();
    _city.clear();
    _addressLine1.clear();
    _addressLine2.clear();
    _phoneNumber.clear();
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
                    ),
                  ],
                ),
                SizedBox(height: space),
                Card(
                  elevation: 0,
                  margin: const EdgeInsets.all(0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Personal information'.tr),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomTextField(
                          hintText: 'First name*',
                          controller: _firstName,
                          keyboardType: TextInputType.name,
                          validator: (value) => Validator.isEmpty(value!),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomTextField(
                          hintText: 'Last name*',
                          controller: _lastName,
                          keyboardType: TextInputType.name,
                          validator: (value) => Validator.isEmpty(value!),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomTextField(
                          hintText: 'Phone Number*',
                          controller: _phoneNumber,
                          keyboardType: TextInputType.phone,
                          validator: (value) => Validator.isEmpty(value!),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: space / 2),
                Card(
                  elevation: 0,
                  margin: const EdgeInsets.all(0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('My Location'.tr),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          padding: const EdgeInsets.all(1.0),
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GoogleMap(
                              mapType: MapType.normal,
                              initialCameraPosition: const CameraPosition(
                                target: LatLng(36.5102369, 37.9401069),
                                zoom: 8.0,
                              ),
                              onMapCreated: (GoogleMapController controller) {
                                _controller.complete(controller);
                              },
                              markers: markers,
                              onTap: (LatLng latLng) => _addNewMarker(latLng),
                              //settings for scrolling
                              scrollGesturesEnabled: true,
                              zoomGesturesEnabled: true,
                              myLocationButtonEnabled: false,
                              zoomControlsEnabled: false,
                              gestureRecognizers: <Factory<
                                  OneSequenceGestureRecognizer>>{
                                Factory<OneSequenceGestureRecognizer>(
                                  () => EagerGestureRecognizer(),
                                ),
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: space / 2),
                Card(
                  elevation: 0,
                  margin: const EdgeInsets.all(0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Addresses'.tr),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: CustomPhoneField(
                            mode: Mode.contry,
                            initialvalue: _country.text,
                            initialSelected: 'Select country*',
                            contryName: _country),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: CustomTextField(
                                hintText: 'State*',
                                controller: _state,
                                keyboardType: TextInputType.text,
                                validator: (value) => Validator.isEmpty(value!),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              flex: 1,
                              child: CustomTextField(
                                hintText: 'City*',
                                controller: _city,
                                keyboardType: TextInputType.text,
                                validator: (value) => Validator.isEmpty(value!),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomTextField(
                          hintText: 'Address line 1*',
                          controller: _addressLine1,
                          keyboardType: TextInputType.streetAddress,
                          validator: (value) => Validator.isEmpty(value!),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomTextField(
                          hintText: 'Address line 2',
                          controller: _addressLine2,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: space),
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
