import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../shared/domain/entities/service_address/service_address.dart';
import '../../../../../shared/domain/usecases/save_service_address/save_service_address_interface.dart';
import '../../../../../shared/presenter/stores/service_address_store/service_address_store.dart';

class AlertDialogServiceAddressController extends Store<ServiceAddress> {
  final ISaveServiceAddress _saveServiceAddress;
  final ServiceAddressStore _serviceAddressStore;

  AlertDialogServiceAddressController({
    required ISaveServiceAddress saveServiceAddress,
    required ServiceAddressStore serviceAddressStore,
  })  : _serviceAddressStore = serviceAddressStore,
        _saveServiceAddress = saveServiceAddress,
        super(ServiceAddress.empty());

  Future<bool> setConfigurations() async {
    setLoading(true);
    final saveResult = await _saveServiceAddress(
      state,
    );

    return saveResult.fold(
      (_) {
        setLoading(false);
        _serviceAddressStore.setServiceAddress(state);
        return true;
      },
      (failure) {
        setError(failure);
        setLoading(false);
        return false;
      },
    );
  }

  void saveIPAddress(String? newIPAddress) {
    update(state.copyWith(ipAdress: newIPAddress?.trim()));
  }

  void savePort(String? port) {
    final newPort = int.tryParse(port ?? '0');
    update(state.copyWith(port: newPort));
  }
}
