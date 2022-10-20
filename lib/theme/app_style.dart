part of app_theme;

final styleTextField = typoRegular14.copyWith(color: colorText100);

final decorTextField = InputDecoration(
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: colorWhite, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: colorWhite, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  contentPadding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
  hintStyle: typoLight14.copyWith(color: colorText80),
  counterText: '',
  fillColor: Colors.white,
  filled: true,
);

final decorContainerBox = BoxDecoration(
  borderRadius: const BorderRadius.all(Radius.circular(10)),
  boxShadow: boxShadow,
  color: colorWhite,
);

final boxShadow = [
  BoxShadow(
    color: colorBlack.withOpacity(0.05),
    spreadRadius: 0,
    blurRadius: 12,
    offset: const Offset(0, 0),
  ),
];

final boxShadowFocus = [
  BoxShadow(
    color: colorBlack.withOpacity(0.15),
    spreadRadius: 0,
    blurRadius: 40,
    offset: const Offset(0, 10),
  ),
];

final boxShadowFocusTextField = [
  BoxShadow(
    color: colorBlack.withOpacity(0.15),
    spreadRadius: 0,
    blurRadius: 10,
    offset: const Offset(0, 0),
  ),
];
