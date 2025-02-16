import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/utils/device_helper.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'device_state.dart';

class DeviceCubit extends Cubit<DeviceState> {
  DeviceCubit() : super(DeviceInitial());
    static DeviceCubit get(BuildContext context) => BlocProvider.of(context);
    Future<void> checkDeviceType(BuildContext context) async {
    emit(DeviceLoading()); 

    bool isTablet = await DeviceHelper.isTablet(context);
    
    if (isTablet) {
      emit(DeviceTablet());
    } else {
      emit(DeviceMobile());
    }
  }
}
