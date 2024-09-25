class ImageConstants {
  ImageConstants._init();
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  // Icon
  String get calendar => toIconPng('calendar');
  String get time => toIconPng('time');
  String get add => toIconPng('add');
  String get edit => toIconPng('edit');
  String get bin => toIconPng('bin');
  String get addProduct => toIconPng('add_product');
  String get search => toIconPng('search');
  String get checkCircle => toIconPng('check_circle');
  String get checkWarning => toIconPng('check_warning');
  String get checkIn => toIconPng('check_in');
  String get close => toIconPng('close');
  String get keyboardArrowDown => toIconPng('keyboard_arrow_down');
  String get questionCircle => toIconPng('question_circle');
  String get minus => toIconPng('minus');
  String get filter => toIconPng('filter');
  String get attachFile => toIconPng('attach_file');
  String get removeCircle => toIconPng('remove_circle');
  String get comment => toIconPng('comment');
  String get checkOut => toIconPng('check_out');
  String get deliveryTracking => toIconPng('delivery_tracking');
  String get mapMarker => toIconPng('map_marker');
  String get arrowBack => toIconPng('arrow_back');
  String get arrowForward => toIconPng('arrow_forward');
  String get visibility => toIconPng('visibility');
  String get visibilityOff => toIconPng('visibility_off');
  String get notification => toIconPng('notification');

  String get errordialog => toIconPng('info-circle-red');
  String get warningdialog => toIconPng('info-circle');
  String get greendialog => toIconPng('tick-circle');

  //Image
  String get product => toImagePng('product');
  String get map => toImagePng('map');
  String get cancel => toImagePng('cancel');
  String get checkin => toImagePng('checkin');
  String get planner => toImagePng('planner');
  // String get logo => toImagePng('logo');
  String get loginBG => toImagePng('login_bg');
  String get noPlanner => toImagePng('no_plan');
  String get schedulePlanning => toImagePng('schedule_planning');
  // String get splashscreen => toImagePng('splashscreen');
  String get forgetPassword => toImagePng('forget_password');
  String get changePassword => toImagePng('change_password');

  String get splashscreen => toImagePng('login');
  String get logo => toImagePng('dog_logo2');
  String get rectangle => toImagePng('rectangle');

  String get logoajev => toImagePng('Asset_logo@4x');
  String get backgrounddark => toIconPng('Asset 21@4x');
  String get backgrouniconAJ => toImagePng('logoiconajev');

  String get bike => toImagePng('BIKE');
  String get home => toImagePng('HOME');
  String get news => toImagePng('NEWS');
  String get service => toImagePng('SERVICE');
  String get vector => toImagePng('ACCOUNT(1)');

  String get biketap => toImagePng('BIKE(1)');
  String get hometap => toImagePng('HOME(1)');
  String get newstap => toImagePng('NEWS(1)');
  String get servicetap => toImagePng('SERVICE(1)');
  String get vectortap => toImagePng('ACCOUNT');

  String get group48 => toImagePng('Group 48');
  String get group75 => toImagePng('Group 75');
  String get group481 => toImagePng('Group 48 (1)');
  String get group49 => toImagePng('Group 49');
  String get group50 => toImagePng('Group 50');
  String get group51 => toImagePng('Group 51');
  String get evbikenone => toImagePng('EV Bike None-01');

  String toIconPng(String name) => 'assets/icons/$name.png';
  String toImagePng(String name) => 'assets/images/$name.png';
}
