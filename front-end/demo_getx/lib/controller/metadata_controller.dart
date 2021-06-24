import 'package:demo_getx/models/metadata.dart';
import 'package:demo_getx/service/metadata_service.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MetadataController extends GetxController {
  var isLoading = true.obs;
  var metadata = Metadata().obs;
  RefreshController refreshController = RefreshController();
  var currentIndexSlider = 0.obs;

  @override
  void onInit() {
    fetchFinalMetadata();
    super.onInit();
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }

  void onChangeIndexSlider(int index) {
    currentIndexSlider.value = index;
    update();
  }

  void fetchFinalMetadata() async {
    isLoading(true);
    try {
      currentIndexSlider.value = 0;
      var data = await MetadataService.getMetadata();
      if (data != null) {
        metadata.value = data;
      }
      refreshController.refreshCompleted();
    } finally {
      isLoading(false);
    }
  }
}