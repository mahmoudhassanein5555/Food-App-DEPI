# شاشات الـ UI — متوافقة مع structure الريبو بتاعكم

## ⚠️ مهم قبل أي حاجة
الملفات دي **متتعارضش** مع أي حاجة موجودة عند زمايلك:
- **متلمسش `core/app_colors.dart` ولا `core/app_string.dart` بتوعهم** — الملفات دي مش موجودة هنا أصلاً، عشان كده منزلتش نسخة تانية منهم.
- ألواني اتحطت في ملف **جديد** اسمه `home_ui_colors.dart` بكلاس اسمه **`HomeUiColors`** (مش `AppColors`) عشان محدش يتلخبط أو يستبدل حاجة بغلط.

## هيكل الملفات (زي ما هو، انسخه فوق `lib/` بتاع الريبو)
```
lib/
  core/
    home_ui_colors.dart        # جديد — ألوان الشاشات دي بس (HomeUiColors)
    app_icons.dart              # جديد — أيقونات Iconsax (AppIcons)
    mock_data.dart               # جديد — بيانات وهمية للتجربة
    models/
      app_models.dart            # جديد — FoodCategory, Restaurant, FoodItem
    widgets/
      circle_icon_button.dart
      rating_info_row.dart
      section_header.dart
      restaurant_card.dart
      food_item_card.dart
  features/
    home/screens/home_screen.dart
    search/screens/search_screen.dart
    food_listing/screens/food_listing_screen.dart
    food_details/screens/food_details_screen.dart
    restaurant/screens/restaurant_view_screen.dart
  main_preview.dart              # للتجربة بس، متستبدلش main.dart بيه
```

## خطوات النسخ (Windows / PowerShell)
انت دلوقتي واقف جوه `F:\app\project\Food-App-DEPI` على branch `feature/ui-screens-momin`. افتح الـ zip الجديد وانسخ **كل حاجة جوه فولدر `lib_new`** (مش `lib_new` نفسه، اللي جواه) فوق فولدر `lib` بتاع الريبو، دمج عادي (كل الأسامي هنا جديدة 100%، مفيش أي استبدال هيحصل).

بعد النسخ، لازم يبقى شكل `core/` كده:
```
core/
  app_colors.dart      ← بتاعهم، زي ما هو
  app_string.dart      ← بتاعهم، زي ما هو
  home_ui_colors.dart  ← بتاعي (جديد)
  app_icons.dart        ← بتاعي (جديد)
  mock_data.dart
  models/
  widgets/
```

## بعد النسخ
1. ضيف في `pubspec.yaml` تحت `dependencies:`
   ```yaml
     iconsax_flutter: ^1.0.0
   ```
   وشغل `flutter pub get`
2. جرب:
   ```
   flutter analyze
   flutter run -t lib/main_preview.dart
   ```
3. Commit و push للـ branch زي ما اتفقنا.

## ملاحظة عن الألوان
لو حابب بعدين توحّد الألوان في ملف واحد بس (`app_colors.dart` بتاعهم)، تقدر تاخد القيم من `home_ui_colors.dart` وتضيفها كأسامي جديدة (متعملش override لأي اسم موجود عندهم زي `textPrimary` أو `background` لإن القيم مختلفة وهتبوظلهم شاشات cart/orders). الأنضف دلوقتي إنك تسيبهم منفصلين.
