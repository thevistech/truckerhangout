class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();
  //1
  sliderModel.setDesc(
      "Best job opportunities! Matching the requirements between employees and employers in just a few minutes!");
  sliderModel.setTitle("Job Board");
  sliderModel.setImageAssetPath("assets/job_board.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc(
      "Buy, sell, or lease a truck or other equipment fast. Post your product and initiate the process effortlessly.");
  sliderModel.setTitle("Buy Sell & Lease");
  sliderModel.setImageAssetPath("assets/buy_sell.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc(
      "Find best offers at the lowest rates for trucking services. Great offers!");
  sliderModel.setTitle("ELD/GPS Devices");
  sliderModel.setImageAssetPath("assets/eld_gps.png");
  slides.add(sliderModel);
  sliderModel = new SliderModel();

  //4
  sliderModel.setDesc(
      "Find the best schools in the industry and get certified from experts. Join a reputed CDL school.");
  sliderModel.setTitle("CDL Schools");
  sliderModel.setImageAssetPath("assets/cdl_school.png");
  slides.add(sliderModel);
  sliderModel = new SliderModel();

  //4
  sliderModel.setDesc(
      "Get back on the road and browse Repairs and Services to find everything you need wherever you are.");
  sliderModel.setTitle("Repairs and Services");
  sliderModel.setImageAssetPath("assets/repair_services.png");
  slides.add(sliderModel);
  sliderModel = new SliderModel();
  return slides;
}
