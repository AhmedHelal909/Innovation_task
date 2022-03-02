-- Adminer 4.7.8 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `doctors`;
CREATE TABLE `doctors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci,
  `dob` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_firebase` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `height` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smoking` tinyint(1) DEFAULT NULL,
  `alcohol` tinyint(1) DEFAULT NULL,
  `login` tinyint(1) NOT NULL DEFAULT '0',
  `serial_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'doctor.png',
  `verified_email` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `doctors_phone_unique` (`phone`),
  UNIQUE KEY `doctors_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `doctor_family_histories`;
CREATE TABLE `doctor_family_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `doctor_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `relation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diagnosis` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_family_histories_doctor_id_foreign` (`doctor_id`),
  CONSTRAINT `doctor_family_histories_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `doctor_forget_emails`;
CREATE TABLE `doctor_forget_emails` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `doctor_medical_reports`;
CREATE TABLE `doctor_medical_reports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `doctor_id` bigint(20) unsigned NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_medical_reports_doctor_id_foreign` (`doctor_id`),
  CONSTRAINT `doctor_medical_reports_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `doctor_personal_histories`;
CREATE TABLE `doctor_personal_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `doctor_id` bigint(20) unsigned NOT NULL,
  `disease` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diagnosis_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `medicines` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_personal_histories_doctor_id_foreign` (`doctor_id`),
  CONSTRAINT `doctor_personal_histories_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `doctor_travel_histories`;
CREATE TABLE `doctor_travel_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `doctor_id` bigint(20) unsigned NOT NULL,
  `destination` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_travel_histories_doctor_id_foreign` (`doctor_id`),
  CONSTRAINT `doctor_travel_histories_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `doctor_verify_emails`;
CREATE TABLE `doctor_verify_emails` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `emergencs`;
CREATE TABLE `emergencs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `emergenc_children`;
CREATE TABLE `emergenc_children` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `emergenc_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emergenc_children_emergenc_id_foreign` (`emergenc_id`),
  CONSTRAINT `emergenc_children_emergenc_id_foreign` FOREIGN KEY (`emergenc_id`) REFERENCES `emergencs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `emergenc_child_translations`;
CREATE TABLE `emergenc_child_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `emergenc_child_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emergenc_child_translations_emergenc_child_id_locale_unique` (`emergenc_child_id`,`locale`),
  KEY `emergenc_child_translations_locale_index` (`locale`),
  CONSTRAINT `emergenc_child_translations_emergenc_child_id_foreign` FOREIGN KEY (`emergenc_child_id`) REFERENCES `emergenc_children` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `emergenc_translations`;
CREATE TABLE `emergenc_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emergenc_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emergenc_translations_emergenc_id_locale_unique` (`emergenc_id`,`locale`),
  KEY `emergenc_translations_locale_index` (`locale`),
  CONSTRAINT `emergenc_translations_emergenc_id_foreign` FOREIGN KEY (`emergenc_id`) REFERENCES `emergencs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `first_aids`;
CREATE TABLE `first_aids` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `first_aids` (`id`, `created_at`, `updated_at`) VALUES
(1,	'2022-01-04 20:02:46',	'2022-01-04 20:02:46'),
(2,	'2022-01-07 14:51:24',	'2022-01-07 14:51:24'),
(3,	'2022-01-07 14:51:52',	'2022-01-07 14:51:52'),
(4,	'2022-01-07 15:58:05',	'2022-01-07 15:58:05'),
(5,	'2022-01-07 16:18:48',	'2022-01-07 16:18:48'),
(6,	'2022-01-07 16:22:33',	'2022-01-07 16:22:33'),
(7,	'2022-01-07 16:24:17',	'2022-01-07 16:24:17'),
(8,	'2022-01-07 16:27:01',	'2022-01-07 16:27:01'),
(9,	'2022-01-07 17:30:24',	'2022-01-07 17:30:24'),
(10,	'2022-01-09 13:42:52',	'2022-01-09 13:42:52'),
(11,	'2022-01-09 13:53:00',	'2022-01-09 13:53:00'),
(12,	'2022-01-09 13:55:30',	'2022-01-09 13:55:30'),
(13,	'2022-01-09 13:57:37',	'2022-01-09 13:57:37');

DROP TABLE IF EXISTS `first_aid_children`;
CREATE TABLE `first_aid_children` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `first_aid_children_first_id_foreign` (`first_id`),
  CONSTRAINT `first_aid_children_first_id_foreign` FOREIGN KEY (`first_id`) REFERENCES `first_aids` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `first_aid_children` (`id`, `first_id`, `created_at`, `updated_at`) VALUES
(2,	1,	'2022-01-04 20:29:49',	'2022-01-04 20:29:49'),
(3,	1,	'2022-01-06 01:09:03',	'2022-01-06 01:09:03'),
(4,	1,	'2022-01-06 01:34:09',	'2022-01-06 01:34:09'),
(5,	1,	'2022-01-07 15:18:38',	'2022-01-07 15:18:38'),
(6,	1,	'2022-01-07 16:39:17',	'2022-01-07 16:39:17'),
(7,	1,	'2022-01-07 16:47:17',	'2022-01-07 16:47:17'),
(8,	4,	'2022-01-07 17:20:41',	'2022-01-07 17:20:41'),
(9,	5,	'2022-01-07 17:29:08',	'2022-01-07 17:29:08'),
(10,	7,	'2022-01-07 17:47:46',	'2022-01-07 17:47:46'),
(11,	9,	'2022-01-07 17:53:38',	'2022-01-07 17:53:38'),
(12,	6,	'2022-01-07 17:58:04',	'2022-01-07 17:58:04'),
(13,	7,	'2022-01-07 18:08:16',	'2022-01-07 18:08:16'),
(14,	9,	'2022-01-07 18:10:08',	'2022-01-07 18:10:08'),
(15,	2,	'2022-01-07 18:29:57',	'2022-01-07 18:29:57'),
(16,	4,	'2022-01-08 13:31:34',	'2022-01-08 13:31:34'),
(17,	8,	'2022-01-08 13:34:22',	'2022-01-08 13:34:22'),
(18,	8,	'2022-01-08 13:35:51',	'2022-01-08 13:35:51'),
(19,	8,	'2022-01-08 13:37:29',	'2022-01-08 13:37:29'),
(20,	8,	'2022-01-08 13:38:54',	'2022-01-08 13:38:54'),
(21,	8,	'2022-01-08 13:39:59',	'2022-01-08 13:39:59'),
(22,	8,	'2022-01-08 13:40:58',	'2022-01-08 13:40:58'),
(23,	8,	'2022-01-08 13:42:23',	'2022-01-08 13:42:23'),
(24,	4,	'2022-01-08 13:44:10',	'2022-01-08 13:44:10'),
(25,	5,	'2022-01-08 14:41:16',	'2022-01-08 14:41:16'),
(26,	8,	'2022-01-08 14:56:05',	'2022-01-08 14:56:05'),
(27,	2,	'2022-01-08 15:02:27',	'2022-01-08 15:02:27'),
(28,	10,	'2022-01-09 13:44:55',	'2022-01-09 13:44:55'),
(29,	2,	'2022-01-09 13:47:39',	'2022-01-09 13:47:39'),
(30,	11,	'2022-01-09 13:54:14',	'2022-01-09 13:54:14'),
(31,	1,	'2022-01-09 14:10:54',	'2022-01-09 14:10:54'),
(32,	1,	'2022-01-09 14:15:47',	'2022-01-09 14:15:47'),
(33,	1,	'2022-01-09 14:18:55',	'2022-01-09 14:18:55');

DROP TABLE IF EXISTS `first_aid_child_translations`;
CREATE TABLE `first_aid_child_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_aid_child_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `first_aid_child_translations_first_aid_child_id_locale_unique` (`first_aid_child_id`,`locale`),
  KEY `first_aid_child_translations_locale_index` (`locale`),
  CONSTRAINT `first_aid_child_translations_first_aid_child_id_foreign` FOREIGN KEY (`first_aid_child_id`) REFERENCES `first_aid_children` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `first_aid_child_translations` (`id`, `first_aid_child_id`, `locale`, `title`, `description`) VALUES
(3,	2,	'ar',	'الآم مقدمة الرأس (الآم خفيفة او متوسطة)',	'<p>أولا يجب تقدير الالم على مقياس من 1 - 10 ثم تحديد مدى انتشار الالم :</p>\r\n\r\n<p>&nbsp;اذا كان الالم على المقياس بين 1 الى 5 فهذا الم يتراوح بين الالم الخفيف الى الالم المتوسط ويجب تحديد اذا كان الالم مرتبط بالتالي :</p>\r\n\r\n<p>&nbsp; &nbsp;أ - اذا كان الالم مرتبط بمقدمة الرأس&nbsp;&nbsp;الى منطقة العينين وجانبهما وكان هناك تاريخ سابق بأي نوع من اصابات العينين او ضعف النظر او غيرهما&nbsp;فهذه ليست من حالات الطوارئ غالبا ويتم مراجعتها في عيادة طبيب الرمد مع امكانية استخدام احدى المسكنات التي تحتوي على مادة&nbsp;&nbsp;<strong>الباراسيتامول</strong> او مادة <strong>الايبوبروفين</strong> في جرعة خفيفة تساعد المريض حتى وقت زيارة الطبيب المختص</p>\r\n\r\n<p>ب - اذا كان الالم مرتبط بمقدمة الرأس ومنطقة الجبهه بالكامل بالاضافة الى الانف و عظام الخدين وكان هناك تاريخ سابق بأي نوع من حساسية الجيوب الأنفية فهذه غالبا ليست من حالات الطوارئ ويتم مراجعتها في عيادة الانف والاذن والحنجرة مع امكانية استخدام احدى المسكنات التي تحتوي على مادة <strong>الباراسيتامول</strong> او مادة <strong>الايبوبروفين</strong> في جرعة خفيفة تساعد الامريض حتى وقت زيارة الطبيب المختص&nbsp;</p>'),
(4,	2,	'en',	'pain in the front area of the head (light to moderate)',	'<p>First, the pain should be evaluated on a scale of 1-10, and then the extent of the pain should be determined:</p>\r\n\r\n<p>&nbsp;If the pain is on the scale between 1 to 5, then this pain ranges from mild to moderate pain, and it must be determined if the pain is related to the following:</p>\r\n\r\n<p>&nbsp; &nbsp;a - If the pain is related to the front of the head to the area and the side of the eyes, and there is a previous history of any kind of eye injury, poor vision, or other</p>\r\n\r\n<p>&nbsp; &nbsp;These are often not emergency cases and are reviewed at the ophthalmologist&rsquo;s clinic, with the possibility of using an analgesic that contains<strong> paracetamol </strong>or <strong>ibuprofen </strong>in a light dose that helps the patient until the time of visiting the specialist&nbsp;</p>\r\n\r\n<p>B - If the pain is related to the front of the head and the entire forehead area in addition to the nose and cheekbones, and there was a previous history of any type of sinus allergy, then this is often not an emergency and is reviewed in the ENT clinic with the possibility of using one of the analgesics that contain <strong>Paracetamol </strong>Or <strong>ibuprofen </strong>in a light dose that helps the patient until the time of visiting the specialist</p>\r\n\r\n<p>&nbsp;</p>'),
(5,	3,	'ar',	'الآم مقدمة الرأس (الآم شديدة أو مفاجأة)',	'<p>يجب أولا تحديد شدة الالم على مقياس من 1 - 10 فاذا كان الالم بين 5 - 10 بالنسبة للمريض فهو على كذا منحى :</p>\r\n\r\n<p>اذا بدأ الالم بسيطا واصبح شديدا فجأة مع الوقت ولا تؤثر بيه المسكنات او ادوية اخرى تم وصفها بناءا على تشخيصات سابقة فيجب مراجعة الطبيب فورا لاستبعاد التشخصيات الخطيرة وخاصة التي يرافقها أعراض أخرى وهذه بعض الامثلة على ذلك :</p>\r\n\r\n<p>أ&nbsp; - الآم مقدمة الرأس ويرفقها <strong>(عدم اتزان - صعوبة في المشي وخاصة في ناحية واحدة في الجسم - تشويش في الحواس)</strong> وفي اقصى الحالات يكون معها <strong>بدايات شلل نصفي و ارتفاع في ضغط الدم و انحراف في زاوية الفم مع وجود تاريخ مرضي بالتدخين او امراض السكري والضغط المرتفع المزمنين او سابقة حدوث جلطات دماغية او كبر السن عندها :</strong></p>\r\n\r\n<p><strong>يكون هناك احتمالية كبرى في حدوث جلطة دماغية ويجب التوجه مباشرة الى اقرب مركز صحي او مستشفى للطوارئ&nbsp;</strong></p>\r\n\r\n<p>ب - لو رافق الآم مقدمة الرأس ذات الوتيرة الشديدة <strong>(درجات حرارة مرتفعة - الآم في الظهر والرقبة - تغير في درجة الوعي - غثيان وقئ - رهاب من الضوء)</strong>&nbsp;خاصة في الاطفال فيجب التوجه على الفور الى اقرب مستشفى للطوارئ (اشتباه في حالة التهاب السحايا الدماغية)</p>'),
(6,	3,	'en',	'pain in the front area of the head (sever or sudden)',	'<p>First, the severity of the pain must be determined on a scale of 1-10. If the pain is between 5-10 for the patient, then it is on such a scale:</p>\r\n\r\n<p>If the pain begins to be mild and suddenly becomes severe over time, and the painkillers or other medications that were prescribed based on previous diagnoses do not affect it, the doctor should be consulted immediately to rule out serious diagnoses, especially those accompanied by other symptoms. Here are some examples of that:</p>\r\n\r\n<p>A - Pain in the front of the head and accompanied by it (imbalance - difficulty walking, especially on one side of the body - confusion in the senses) and in the most extreme cases, it has the beginnings of hemiplegia, high blood pressure and deviation in the corner of the mouth with a history of smoking or diabetes Chronic high blood pressure, a history of stroke, or old age:</p>\r\n\r\n<p>There is a high possibility of a stroke, and you must go directly to the nearest health center or emergency hospital</p>\r\n\r\n<p>B - If the&nbsp;high frequency pain&nbsp;in the front of the head accompanies with (high temperatures - pain in the back and neck - change in the degree of consciousness - nausea and vomiting - photophobia), especially in children, it is necessary to go immediately to the nearest emergency hospital (suspected meningities)</p>'),
(7,	4,	'ar',	'الآم المنطقة الوسط من الرأس والجانبيين',	'<p>الآم وسط الرأس تتراوح بين الخطيرة الشديدة والمتوسطه او الخفيفة العادية وهي كالتالي :</p>\r\n\r\n<p>أ - الآم&nbsp;الرأس شديد ويرفقها <strong>(عدم اتزان - صعوبة في المشي وخاصة في ناحية واحدة في الجسم - تشويش في الحواس)</strong> وفي اقصى الحالات يكون معها <strong>بدايات شلل نصفي و ارتفاع في ضغط الدم و انحراف في زاوية الفم مع وجود تاريخ مرضي بالتدخين او امراض السكري والضغط المرتفع المزمنين او سابقة حدوث جلطات دماغية او كبر السن عندها :</strong></p>\r\n\r\n<p><strong>يكون هناك احتمالية كبرى في حدوث جلطة دماغية ويجب التوجه مباشرة الى اقرب مركز صحي او مستشفى للطوارئ&nbsp;</strong></p>\r\n\r\n<p>ب - الآم الرأس الخفيفة الى المتوسطة وتكون غالبا ذات طابع بسيط وتكون عادة بسبب <strong>صداع التوتر او بسبب العداوى البسيطة مثل الجيوب الانفية او الارتفاع الطفيف في ضغط الدم</strong> ويتم التعامل معها بهدوء <strong>ولا تحتاج الى التوجه الى الطوارئ</strong> ويمكن مراجعتها مع الطبيب المختص واذا عانى منها الشخص يمكن عمل التالي :</p>\r\n\r\n<p><strong>أولا قياس ضغط الدم واذا كان مرتفعا بمقدار بسيط أو متوسط يمكن الاكتفاء بأخذ دواء يحتوي على مادة كابتوبريل بتركيز 25 ملجم ثم مراجعة الطبيب</strong></p>\r\n\r\n<p><strong>ثانيا اذا لم يكن هناك ارتفاع في ضغط الدم يتم الاكتفاء بأخذ دواء مسكن يحتوي على مادة الباراسيتامول أو الايبوبروفين ومراجعة الطبيب المختص</strong></p>'),
(8,	4,	'en',	'Pain in the middle area of ​​the head and sides',	'<p>The pain in the middle of the head ranges from severe to moderate or mild to normal, and they are as follows:</p>\r\n\r\n<p>a - The pain in the front of the head is severe and accompanied by <strong>(unbalance - difficulty walking, especially on one side of the body - confusion in the senses)</strong> and in the most extreme cases, it has the <strong>beginnings of hemiplegia, high blood pressure and a deviation in the corner of the mouth with a history of smoking or diabetes and pressure diseases Chronically high altitude, a history of stroke, or old age in whom:</strong></p>\r\n\r\n<p><strong>There is a high possibility of a stroke, and you must go directly to the nearest health center or emergency hospital</strong></p>\r\n\r\n<p>B - Headaches that are light to moderate and are often of<strong> a simple nature and are usually due to tension headaches or due to minor infections such as sinuses or a slight rise in blood pressure</strong>. Next work:</p>\r\n\r\n<p><strong>First, measure the blood pressure, and if it is slightly or moderately high, it is sufficient to take a drug containing captopril at a concentration of 25 mg, and then consult a doctor.</strong></p>\r\n\r\n<p><strong>Secondly, if there is no high blood pressure, it is sufficient to take an analgesic drug containing paracetamol or ibuprofen and refer to the specialist doctor</strong></p>'),
(9,	5,	'ar',	'الإغماء',	'<h1>أعراض وعلامات فقدان الوعي</h1>\r\n\r\n<h1>قد يسبق حدوث الإغماء ظهور عدد من الأعراض والعلامات، ومنها ما يلي</h1>\r\n\r\n<h2><strong>الشعور بالغثيان</strong>.</h2>\r\n\r\n<h2><strong>عدم وضوح الكلام</strong>.</h2>\r\n\r\n<h2><strong>تغير مفاجئ في حرارة الجسم</strong>.</h2>\r\n\r\n<h2><strong>التعرّق المفاجئ</strong>.</h2>\r\n\r\n<h2><strong>شحوب الجلد&nbsp;حدوثأ&nbsp;اضطراب في الرؤية</strong>.</h2>\r\n\r\n<h2><strong>الشعور بالدوار</strong> <strong>والدوخة</strong>.</h2>\r\n\r\n<h2><strong>الشعور بالخدران</strong>.</h2>\r\n\r\n<h2><strong>تسارع دقات القلب</strong>.</h2>\r\n\r\n<h1>كيفية التعامل مع حالات فقدان الوعي</h1>\r\n\r\n<h2>تمديد المريض على ظهره<br />\r\n<br />\r\nرفع قدمي المريض عن مستوى القلب بما يقارب 30 سم لزيادة كمية الدم المتدفق باتجاه الدماغ.</h2>\r\n\r\n<h2>محاولة تخفيف الضغط من خلال إزالة القلادات، والأحزمة، وربطة العنق، والملابس الضيقة.</h2>\r\n\r\n<h2>منع الشخص من النهوض مباشرة بعد استعادته للوعي.</h2>\r\n\r\n<h2>الاتصال بالطوارئ وطلب المساعدة الطبية في حال عدم استعادة الشخص للوعي بعد مرور دقيقة واحدة.</h2>\r\n\r\n<h2>التأكد من عدم وجود ما يعيق المجرى التنفسيّ في حال توقف نَفَس الشخص المغمى عليه، وفي حال عدم استعادة الشخص قدرته على التنفس الطبيعيّ يجب القيام بعمل إنعاش القلب والرئتين (بالإنجليزية: Cardiopulmonary resuscitation) اختصاراً (CPR)، إلى أنْ يستعيد الشخص قدرته على التنفس أو حتى تصل المساعدة الطبيّة.<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n&nbsp;</h2>'),
(10,	5,	'en',	'coma',	'<h2><strong>Symptoms and signs of loss of consciousness</strong><br />\r\nFainting may be preceded by a number of symptoms and signs, including the following:<br />\r\n1-feeling sick<br />\r\n2-slurred speech<br />\r\n3-Sudden change in body temperature.<br />\r\n4-sudden sweating<br />\r\n5-Pale skin, blurred vision.<br />\r\n6-Feeling and dizzy.<br />\r\n7-feeling numb<br />\r\n8-Rapid heart rate.<br />\r\n<strong>How to deal with cases of loss of consciousness:</strong><br />\r\n1-Extend the patient on his back</h2>\r\n\r\n<h2>2-Raise the patient&#39;s feet about 30 cm above the level of the heart to increase the amount of blood flowing towards the brain.<br />\r\n3-Try to relieve stress by removing necklaces, belts, ties, and tight clothing.<br />\r\n4-Prevent the person from getting up immediately after regaining consciousness.<br />\r\n5-Call 911 and seek medical help if the person has not regained consciousness after one minute.<br />\r\n6-Ensure that there is nothing obstructing the respiratory tract if the unconscious person stops breathing, and if the person does not regain his ability to breathe normally, cardiopulmonary resuscitation (CPR) must be performed until the person regains his ability to breathe or Until medical help arrives.</h2>'),
(11,	6,	'ar',	'ضربة الشمس',	'<p>اخرج من الحرارة بسرعة إلى مكان بارد ، أو على الأقل في الظل.</p>\r\n\r\n<p>استلقِ وارفع ساقيك لتدفق الدم إلى قلبك.</p>\r\n\r\n<p>اخلع أي ملابس ضيقة أو زائدة.</p>\r\n\r\n<p>ضع مناشف باردة على بشرتك أو خذ حمامًا باردًا. ...</p>\r\n\r\n<p>اشرب السوائل مثل الماء أو العصائر .</p>'),
(12,	6,	'en',	'sunstroke',	'<ol>\r\n	<li>Get out of the heat quickly and into a cool place, or at least shade.</li>\r\n	<li>Lie down and elevate your legs to get blood flowing to your heart.</li>\r\n	<li>Take off any tight or extra clothing.</li>\r\n	<li>Apply cool towels to your skin or take a cool bath.&nbsp;</li>\r\n	<li>Drink fluids, such as water or a sports drink.</li>\r\n</ol>'),
(13,	7,	'ar',	'نزيف الأنف',	'<p>الاسترخاء.</p>\r\n\r\n<p>اجلس في وضع مستقيم وقم بإمالة جسمك ورأسك للأمام قليلاً.</p>\r\n\r\n<p>تنفس من فمك.</p>\r\n\r\n<p>استخدم منديلًا أو قطعة قماش مبللة لتنشيف&nbsp;الدم.</p>\r\n\r\n<p>استخدم إبهامك وإصبعك السبابة لقرص الجزء الرخو من أنفك معًا.</p>'),
(14,	7,	'en',	'nose bleeding',	'<ol>\r\n	<li>Relax.</li>\r\n	<li>Sit upright and lean your body and your head slightly forward.</li>\r\n	<li>Breathe through your mouth.</li>\r\n	<li>Use a tissue or damp washcloth to catch the blood.</li>\r\n	<li>Use your thumb and index finger to pinch together the soft part of your nose.</li>\r\n</ol>'),
(15,	8,	'ar',	'توقف القلب والتنفس',	'<ul>\r\n	<li>إمالة رأس المصاب إلى الخلف حتى يبرز الذقن وفي حالة انسداد مجرى&nbsp;التنفس&nbsp;فيجب فتحه بازالة اية اجسام غريبة بالاصابع والضرب على الظهر بين الكتفين.</li>\r\n	<li>فحص استجابة المصاب: يجدر محاولة الحصول على إجابة شفوية بطرح أسئلة أو هز بلطف على كتف الطفل.</li>\r\n	<li>فتح مجرى التنفس بإمالة الرأس إلى الخلف ورفع الذقن لتفتح مجرى التنفس وأزل أي انسداد واضح.</li>\r\n	<li>فحص التنفس (انظر، اسمع، حس) لمده خمس ثواني، يتم الفحص لرؤية إذا كان هناك تنفس أو التنفس كافي أم لا.</li>\r\n	<li>يتم&nbsp;التنفس الصناعي&nbsp;باخذ المنقذ نفس عميق ثم يضع فمة على فم المصاب أو أنفه ويعطية اربعة انفاس سريعة بدون تسريب..وتكرار العملية حتى ينتظم التنفس أو يربط في الكمامات الخاصة.</li>\r\n	<li>فحص النبض الشرياني لدى الطفل وتحديد ما إذا كان موجوداً أم لا.</li>\r\n	<li>في حال عدم وجود تنفس يتم المباشرة بعمل&nbsp;إنعاش قلبي رئوي.</li>\r\n	<li>يتم مباشرة عملية الإنعاش بممارسة&nbsp;التدليك القلبي&nbsp;عبر الضغط براحة اليد على&nbsp;عظم القص&nbsp;بمعدل ضغطة كل ثانية ل30 ضغطة متتالية وذلك لمساعدة القلب على الضخ، ثم المباشرة بالتنفس الصناعي.</li>\r\n	<li>يعطى المصاب نفسي إنقاذ فعالين كل نفس 1.5 ثانية أو حتى يرتفع الصدر بشكل كافٍ.</li>\r\n	<li>يتم فحص دوران&nbsp;الدم&nbsp;لمدة لا تزيد على عشرة ثواني بعد كل جولة من التدليك القلبي والتنفس الصناعي.</li>\r\n	<li>يتم تكرارالعملية حتى يعود النبض والتنفس أو تصل سيارة الإسعاف أو تتعب أو تظهر علامات الوفاة مثل التخشب الرمي و برودة الجسم و ثبات توسع بؤبؤ العين.</li>\r\n</ul>'),
(16,	8,	'en',	'Heart and breathing stopped',	'<p>1-Tilt the patient&#39;s head back so that the chin protrudes. In the event of obstruction of the airway, it must be opened by removing any foreign bodies with the fingers and striking the back between the shoulders.</p>\r\n\r\n<p>2-&nbsp;Check the casualty&#39;s response: Try to get an oral answer by asking questions or gently rocking the child&#39;s shoulder.</p>\r\n\r\n<p>3-&nbsp;Open the airway by tilting the head back and lifting the chin to open the airway and remove any obvious obstruction.</p>\r\n\r\n<p>4-Breathing test (look, listen, feel) for five seconds. The test is done to see if there is enough breathing or breathing or not.</p>\r\n\r\n<p>5-&nbsp;Artificial respiration is carried out by the rescuer taking a deep breath, then placing his mouth on the mouth or nose of the victim and giving him four quick breaths without leaking.. and repeating the process until breathing is regular or tied in special masks.</p>\r\n\r\n<p>6-&nbsp;Examine the arterial pulse in the child and determine whether it is present or not.</p>\r\n\r\n<p>7-&nbsp;In the absence of breathing, cardiopulmonary resuscitation is initiated.</p>\r\n\r\n<p>8-&nbsp;The resuscitation process is carried out by practicing cardiac massage by applying pressure with the palm of the hand on the sternum at a rate of one pressure every second for 30 consecutive pressures to help the heart pump, then initiating artificial respiration.</p>\r\n\r\n<p>9-&nbsp;Give the casualty an effective rescue breath every 1.5 seconds or until the chest is sufficiently raised.</p>\r\n\r\n<p>10-&nbsp;The blood circulation is checked for no more than ten seconds after each round of cardiac massage and artificial respiration.</p>\r\n\r\n<p>11-&nbsp;The process is repeated until the pulse and breathing return, or the ambulance arrives, or you get tired, or signs of death appear, such as cataplexy, coldness of the body, and the persistence of dilated pupils.</p>'),
(17,	9,	'ar',	'الحروق',	'<p>يتم إسعاف&nbsp;الحروق&nbsp;بعد اخلاء الضحية واطفاء النار عن جسمه وتهدئته. ونزع الملابس أو قصها برفق من حول مكان الحرق. لا يجوز دهن الإصابة بأية مواد أو تغطية الحرق.</p>\r\n\r\n<ul>\r\n	<li>عدم إعطاء المصاب الماء والسوائل عن طريق الفم وتركيب كانيولا لاخذ محلول ملحي أو لبنات رينجر لتعويض الفاقد منها.</li>\r\n	<li>في حال كون الحرق كيماويا فيجب غسله فورا بالماء ولمدة نصف ساعة.</li>\r\n	<li>تفتح الفقاقيع في حروق الدرجة الأولى بشفرة معقمة ثم يجري تضميدها لمنع التلوث، كما يمكن تركها دون تدخل مع المحافظة على نظافة الحرق.</li>\r\n	<li>في حال كان الحرق عميقاً بحيث يشمل كل طبقات الجلد (حروق الدرجة الثالثة)، يجب فحص النبض في الأعضاء المصابة حيث أن الحروق تقوم بالانكماش ضاغطة على الأوعية الدموية التي تقع تحتها مما قد يعطل الدورة الدموية في المكان المصاب.</li>\r\n	<li>في حالات حروق الدرجة الثانية والثالثة يجب استدعاء الإسعاف أو نقل المريض إلى المستشفى على الفور.</li>\r\n</ul>'),
(18,	9,	'en',	'burns',	'<p>1-&nbsp;Burns are treated after evacuating the victim and putting out the fire from his body and calming him down. And disarmament of clothing or gently cut around the place burn. Fat may not be any material injury or cover the burn.</p>\r\n\r\n<p>2-&nbsp;Not giving the patient water and fluids orally and installing a cannula to take saline solution or Ringer&rsquo;s blocks to replace the lost ones.</p>\r\n\r\n<p>3-&nbsp;If the burn is chemical, it should be washed immediately with water for half an hour.</p>\r\n\r\n<p>4-&nbsp;Bubbles in first-degree burns are opened with a sterile blade and then bandaged to prevent contamination. They can also be left without interference while maintaining the cleanliness of the burn.</p>\r\n\r\n<p>5-&nbsp;In the event that the burn is deep and includes all layers of the skin (third-degree burns), the pulse in the affected organs must be checked, as the burns contract, pressing the blood vessels beneath them, which may disrupt blood circulation in the affected place.</p>\r\n\r\n<p>6-&nbsp;In cases of second and third degree burns, an ambulance should be called or the patient should be taken to the hospital immediately.</p>'),
(19,	10,	'ar',	'التسمم عن طريق الفم',	'<p>التسمم&nbsp;هو مجموعة اضطرابات في وظائف الجسم ناجمة عن اٍمتصاص مادة غريبة (السم)، والسم هو مادة تدخـل الجسـم بكميات كافيـة لأحداث ضـرر مؤقت أو دائـم.</p>\r\n\r\n<p><br />\r\nيتوجب اتباع الخطوات التالية عند التعامل مع حالات التسمم</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n	<li>سـؤال المصاب قبل أن يفقد وعيه عما حدث.</li>\r\n	<li>الاتصال بالإسعاف بسـرعة وأخبارهم عن حالة المصاب.</li>\r\n	<li>إذا كانت المادة السامة كيماوية.يجب عدم جعل المصاب يقيئ كما يجب عدم محاولة تبريدها بسقاية المصاب ماء أو حليب ليشربه.</li>\r\n	<li>إذا لم تكن المادة السـامة كاوية أو لم تكن المادة إحدى مشتقات البترول ولم يكن المصاب في حال صدمة أو فاقد الوعي فيمكن محاولة جعـل المصاب يتقيأ بوضع إصبع في حلقه. واعطائه ما يشربه.</li>\r\n	<li>إذا فقـد المصاب وعيه وبقي تنفسـه طبيعي، يجب وضعه في وضعية الاستشفاء.</li>\r\n	<li>إذا توقف التنفس ونبض القلب، يجب البدء فورا بعملية إنعاش قلبي رئوي.</li>\r\n	<li>يجب أخـذ الاحتياط لكي لا ينتقـل السـم إلى المسعف.</li>\r\n	<li>يتوجب نقل المصاب إلى المستشفي بسـرعة. مع إرسال عينات من القيء وأي علب تكون قريبة منه ليتم فحصهـا في المستشفى.</li>\r\n</ol>'),
(20,	10,	'en',	'poisoning',	'<p>Poisoning is a group of disturbances in the body&#39;s functions caused by the absorption of a foreign substance (toxin), and a poison is a substance that enters the body in sufficient quantities to cause temporary or permanent harm.</p>\r\n\r\n<p>The following steps must be taken when dealing with poisoning cases</p>\r\n\r\n<p>1-Ask the victim before he loses consciousness what happened.</p>\r\n\r\n<p>2-Call the ambulance quickly and tell them about the condition of the injured.</p>\r\n\r\n<p>3-If the toxic substance was a chemical. The patient should not be made to vomit, and it should not be attempted to cool it by giving the patient water or milk to drink.</p>\r\n\r\n<p>4-&nbsp;If the toxic substance is not caustic, or the substance is not a petroleum derivative, and the victim is not in a state of shock or unconscious, then an attempt can be made to make the victim vomit by placing a finger in his throat. And give him something to drink.</p>\r\n\r\n<p>5-&nbsp;If the victim loses consciousness and his breathing remains normal, he should be placed in the recovery position.</p>\r\n\r\n<p>6-&nbsp;If breathing and heart rate stop, CPR should be started immediately.</p>\r\n\r\n<p>7-&nbsp;Precautions must be taken so that the poison does not pass to the paramedic.</p>\r\n\r\n<p>8-&nbsp;The patient must be transported to the hospital quickly. Sending samples of vomit and any packages close to it to be examined in the hospital.</p>'),
(21,	11,	'ar',	'حوادث الصعق الكهربائي',	'<p>حوادث&nbsp;الصعق الكهربائي&nbsp;هي من الحوادث التي تقع في المنازل وأماكن العمل وتتراوح بين&nbsp;صدمة كهربائية بسيطة وصعق كهربائي&nbsp;خطير وقاتل. ينتج الضرر في حالات التعرض إلى صدمة كهربائية من الحروق والكسور حيث تكون العظام بمثابتة المقاومة في الدارة الناتجة، مما يسبب ارتفاع حرارة العظام وبالتالي تكون الحروق من الداخل إلى الخارج. كما تتسبب الصدمات الكهربائية في حدوث&nbsp;سكتة قلبية.</p>\r\n\r\n<p>خطوات إسعاف ضحية الصدمة الكهربائية تتلخص بما يلي:</p>\r\n\r\n<ol>\r\n	<li>قطع التيـار الكهربائي أولاً.</li>\r\n	<li>إبعاد المصاب عن مصدر التيار</li>\r\n	<li>فحص المصاب والتأكد من مدى الضرر</li>\r\n	<li>إذا كان المريض واعياً يفضل ذهابه إلى الطوارئ للتأكد من عدم وقوع أية كسور أو حروق داخلية.</li>\r\n	<li>إذا ما كان المريض فاقداُ للوعي يتوجب طلب الإسعاف بسرعة أو نقل المريض إلى أقرب مستشفى.</li>\r\n	<li>قد يتسبب الصعق الكهربائي في حدوث حروق أو قصور في عمل القلب، في حالة القصور يتم الإسعاف عن طريق إنعاش قلبي رئوي.</li>\r\n</ol>'),
(22,	11,	'en',	'electrocution accidents',	'<p>Electric shock accidents are accidents that occur in homes and workplaces and range from electric shock(** simple]] to dangerous and fatal electric shock. Damage in cases of exposure to electric shock results from burns and fractures where the bones are with constant resistance in the resulting circuit, causing The high temperature of the bones and consequently the burns from the inside out, and the electric shocks cause a heart attack.</p>\r\n\r\n<p>The steps for first aiding an electric shock victim are as follows:</p>\r\n\r\n<p>1-&nbsp;Cut off the power first.</p>\r\n\r\n<p>2-Remove the victim from the power source</p>\r\n\r\n<p>3-&nbsp;Examine the injured and ascertain the extent of the damage</p>\r\n\r\n<p>4-&nbsp;If the patient is conscious, it is preferable to go to the emergency room to ensure that there are no fractures or internal burns.</p>\r\n\r\n<p>5-If the patient is unconscious, an ambulance must be called quickly or the patient must be taken to the nearest hospital.</p>\r\n\r\n<p>6-&nbsp;Electrocution may cause burns or heart failure. In case of failure, CPR is treated.</p>'),
(23,	12,	'ar',	'الكسور',	'<p>الكسور هي من الطوارئ المتكررة الحدوث في المنزل وأماكن العمل نتيجة الانزلاق أو السقوط من ارتفاعات عالية كما أنها من أكثر الإصابات حدوثاً في حوادث السير والرياضة وغير ذلك. أنواع الكسور عديدة منها الكسور البسيطة والكسور المركبة، الكسور المغلقة والكسور المفتوحة.</p>\r\n\r\n<p>عند إسعاف الكسور العظمية يجب مراعاة الخطوات التالية:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>محاولة تركيــز الشخص المصاب بكسور بشكل مريح إذا كان الكسر واضحاً وفي منطقة سهلة كالأقدام واليدين ولذلك لتسهيل نقله إلى المستشفى، مع تثبيت الطرف المكسور قدر الإمكان.</li>\r\n	<li>في حالة عدم التأكد من مكان الكسر كمــا في الحوض والقفص الصدري أو العمود الفقري فلا يجب تحريك المصاب ويجب طلب الاسعــاف فوراً ومحاولة تهدئة المصاب والحد من حركته.</li>\r\n	<li>في حالة اصابة الرقبة أو الجمجمة لا يجب فعل شيء سوى طلب الإسعاف، بالرغم من أن الغالبية العظمى من كسور الرقبة أو الجمجمة يفقد المريض الوعي فيها إلا أنه قد يبقى واعياً بعدها، ولذى يجب إخباره بضرورة عدم التحرك.</li>\r\n</ul>'),
(24,	12,	'en',	'fractions',	'<p>Fractures are a frequent emergency in the home and workplace as a result of slipping or falling from high heights. They are also one of the most common injuries in traffic accidents, sports, and more. There are many types of fractures, including simple fractures, compound fractures, closed fractures and open fractures.</p>\r\n\r\n<p>When treating bone fractures, the following steps must be observed:</p>\r\n\r\n<p>1-&nbsp;Try to focus the person with fractures comfortably if the fracture is clear and in an easy area such as the feet and hands, so as to facilitate his transfer to the hospital, while immobilizing the broken limb as much as possible.</p>\r\n\r\n<p>2-&nbsp;In the event that the location of the fracture is uncertain, as in the pelvis, rib cage, or spine, the victim should not be moved and an ambulance should be called immediately and an attempt should be made to calm the victim and limit his movement.</p>\r\n\r\n<p>3-&nbsp;In the event of an injury to the neck or skull, nothing should be done except to call for an ambulance, although the vast majority of neck or skull fractures lose consciousness in them, but they may remain conscious afterwards, and who must be told not to move.</p>'),
(25,	13,	'ar',	'لسعة العقارب والأفاعي',	'<p>و تختلف خطورتها حسب نوع العقارب والأفاعي لكنها بشكل عام حالة طارئة خطيرة يجب التعامل معها على الفور. تشكل بعض أنواع اللسعات خطراً مميتاً حيث يمكن للسم شل عضلات المريض ولربما يصل السم إلى شل عضلة&nbsp;الحجاب الحاجز&nbsp;مما يؤدي إلى توقف النفس.</p>\r\n\r\n<p><br />\r\nطريقة الإسعاف</p>\r\n\r\n<p>يتم إسعاف الحالة عبر وقف انتشار السم في الجسم ومحاولة إخراج&nbsp;السم&nbsp;من الجسم، كما تتمثل بإعطاء الترياق الخاص بالسم. من الخطوات الواجب اتباعها في إسعاف ضحايا لسعة العقارب والأفاعي:<br />\r\nربط العضو المصاب على بعد 10سم من اللدغة، وتقليل حركة وخوف وانفعال المصاب إلى ادنى حد ممكن.</p>\r\n\r\n<ul>\r\n	<li>إخراج أكبر كمية من السموم,&nbsp;يمكن هرس ثوم ووضعه على مكان اللدغة&nbsp;كما يمكن عصر مكان الإصابة لإخراج الدم الملوث، ويفضل اجتناب الشفط بالفم خشية انتقال السم إلى المسعف.</li>\r\n	<li>تدليك مكان اللدغة&nbsp;ببلورات&nbsp;بيرمنغنات البوتاسيوم&nbsp;وتضميده بمحلول البيرمنغنات.<br />\r\n	يعطى المصاب شرابا ساخنا منعشا مع أكبر كمية ممكنة من الماء لتخفيف تركيز&nbsp;السم&nbsp;في الدم.يغطى جيدا لأحداث&nbsp;التعرق&nbsp;ويرسل إلى اقرب مستشفى أو وحدة اسعاف على الفور.<br />\r\n	&nbsp;</li>\r\n</ul>\r\n\r\n<ul>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n</ul>'),
(26,	13,	'en',	'Scorpion and snake sting',	'<p>Its danger varies according to the type of scorpions and snakes, but in general it is a serious emergency that must be dealt with immediately. Some types of stings pose a fatal danger, as the poison can paralyze the patient&#39;s muscles and the poison may even paralyze the diaphragm muscle, leading to respiratory arrest.</p>\r\n\r\n<p>ambulance method</p>\r\n\r\n<p>The case is treated by stopping the spread of the poison in the body and trying to remove the poison from the body, as represented by giving the antidote for the poison. Among the steps to be followed in providing first aid to victims of scorpion and snake stings:</p>\r\n\r\n<p>1-&nbsp;Tie the injured member 10 cm away from the sting, and reduce the movement, fear and emotion of the injured to a minimum.</p>\r\n\r\n<p>2-&nbsp;To remove the largest amount of toxins, garlic can be mashed and placed on the place of the sting, and the place of injury can be squeezed to remove the contaminated blood, and it is preferable to avoid suctioning in the mouth for fear of transmitting poison to the paramedic.</p>\r\n\r\n<p>3-&nbsp;Massage the bite site with potassium permanganate crystals and bandage it with a solution of permanganate.</p>\r\n\r\n<p>4-&nbsp;The casualty is given a hot, refreshing drink with as much water as possible to reduce the concentration of poison in the blood. Cover well for sweating events and send to the nearest hospital or ambulance unit immediately.</p>'),
(27,	14,	'ar',	'الغرق',	'<p>بعد إخراج الغريق من الماء يتم تنظيف فمه وانفة بسرعة من العوالق، ثم يمدد على ظهرة بحيث يكون راسة اسفل مستوى جسمه مع تقليبة من جانب إلى آخر والضغط الخفيف على البطن، وفي حال توقف التنفس تجرى عملية التنفس الصناعي فورا.</p>'),
(28,	14,	'en',	'drowning',	'<p>After the drowning person is removed from the water, his mouth and nose are quickly cleaned of plankton, then he lies on his back so that his head is below the level of his body with a flip from side to side and light pressure on the abdomen, and in the event of respiratory failure, artificial respiration is performed immediately.</p>'),
(29,	15,	'ar',	'الغصة  (الشرقة)',	'<p>&nbsp; قف على الجانب وخلف الشخص البالغ المختنق مباشرة&nbsp;أعط 5 ضربات على الظهر.</p>\r\n\r\n<p>أعط 5 ضغطات في البطن. قم بأداء خمس ضغطات على البطن (تُعرف أيضًا بمناورة هيمليك).</p>\r\n\r\n<p>بدّل بين 5 ضربات و 5 دفعات حتى يزول الانسداد.</p>'),
(30,	15,	'en',	'choking',	'<ol>\r\n	<li>Give 5 back blows.&nbsp;Stand to the side and just behind a choking adult.&nbsp;</li>\r\n	<li>Give 5 abdominal thrusts.&nbsp;Perform five abdominal thrusts (also known as the Heimlich maneuver).</li>\r\n	<li>Alternate between 5 blows and 5 thrusts until the blockage is dislodged.</li>\r\n</ol>'),
(31,	16,	'ar',	'الأزمة القلبية',	'<p><strong>الذبحة الصدرية</strong></p>\r\n\r\n<p>يؤدى تصلب الشرايين التاجية إلى قصور فى تلبية احتياج القلب من الدم أثناء القيام بمجهود مثل صعود السلم ونتيجة لذلك يحدث ألم فى منتصف الصدر ويتميز بأنه يمتدد إلى الكتف الأيسر خاصة</p>\r\n\r\n<p>وقد يؤدى لظهور هذا الألم أشياء أخرى مثل التدخين و الجو البارد و الإفراط فى تناول الطعام</p>\r\n\r\n<p><strong>الإسعافات</strong></p>\r\n\r\n<ol>\r\n	<li>يجب أن يستريح المريض على الفور فالراحة كفيلة لذهاب الألم أما الإستمرار فى المجهود فقد يؤدى إلى مضاعفات خطيرة.</li>\r\n	<li>يفك أى أربطة ضاغطة على العنق أو البطن أو الصدر.</li>\r\n	<li>يأخذ المريض أى قرص موشع للأوعية الدموية مثل ( انجيسيد <span dir=\"LTR\">angised</span>) تحت اللسان ويكرر بعد خمس دقائق إن لم يتحسن الألم</li>\r\n	<li>إن لم يتحسن المريض وبدأ فى التعرق فهذا يعنى أن المريض قد دخل فى جلطة فى القلب <span dir=\"LTR\">myocardial infarction </span>&nbsp;ويجب نقلة فورا إلى المستشفى لأنه يحتاج لوحدة العناية المركزة.</li>\r\n</ol>'),
(32,	16,	'en',	'heart attack',	'<p><strong>heart attack</strong><br />\r\nCoronary atherosclerosis leads to a failure to meet the heart&#39;s need for blood during exertion such as climbing stairs. As a result, pain occurs in the middle of the chest and is characterized by extending to the left shoulder, especially<br />\r\nOther things such as smoking, cold weather, and overeating may lead to the emergence of this pain<br />\r\n<strong>first aid</strong><br />\r\n1- The patient must rest immediately. Rest is enough to relieve the pain. Continuing the effort may lead to serious complications.<br />\r\n2- Loosen any pressure bandages on the neck, abdomen or chest.<br />\r\n3- The patient takes any vascular tablet such as (angised) under the tongue and repeats after five minutes if the pain does not improve<br />\r\n4- If the patient does not improve and starts to sweat, this means that the patient has entered into a myocardial infarction and must be transferred immediately to the hospital because he needs the intensive care unit.</p>'),
(33,	17,	'ar',	'جسم غريب فى العين',	'<p>جسم غريب فى العين</p>\r\n\r\n<ol>\r\n	<li>إذا ظهر لك هذا الجسم على بياض العين أو خلف الجفن السفلى فالتقطه للخارج بلطف بواسطة طرف منديل نظيف وقد تحتاج لجذب الجفن للأمام من الرموش</li>\r\n	<li>إذا لم يظهر لك يسحب الجفن العلوى إلى السفلى (تغميض العين ) لمدة دقيقة ربما يؤدى ذلك إلى تحريك الجسم عن مكانة وظهوره على بياض العين</li>\r\n	<li>إذا لم يظهر رغم اتباعك الخطوة السابقة اسحب الجفن العلوى للأمام و اثنه للوراء على عود كبريت مثلا واطلب من أحد المحيطين النظر إلى محيطه الداخلى . إن تمكن من رؤيته</li>\r\n</ol>\r\n\r\n<p>فيزيله بالطريقة السابقة</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>مادة كميائية فى العين</p>\r\n\r\n<ol>\r\n	<li>اغمر العين بسرعة بتيار من الماء البارد الجارى من الصنبور. و اثن رأسك للأمام بحيث تكون العين المصابة للأسفل</li>\r\n	<li>افتح الجفنين حتى تسمح بمرور الماء فى العين</li>\r\n	<li>وبعد غسل العين اربطها بضمادة واذهب للطبيب المختص على الفور</li>\r\n</ol>'),
(34,	17,	'en',	'foreign body in the eye',	'<p>foreign body in eye<br />\r\n1- If this object appears to you on the white of the eye or behind the lower eyelid, gently pick it out with the tip of a clean tissue. You may need to pull the eyelid forward from the eyelashes.<br />\r\n2- If it does not appear to you, pull the upper eyelid to the lower (blinding the eye) for a minute, this may lead to moving the body from its position and appearing on the white of the eye<br />\r\n3- If it does not appear despite following the previous step, pull the upper eyelid forward and bend it back on a match, for example, and ask one of those around to look at its inner circumference. If he can see it<br />\r\nRemove it as before</p>\r\n\r\n<p>chemical in the eye<br />\r\n1- Quickly immerse the eye in a stream of cold water running from the tap. Bend your head forward so that the affected eye is down<br />\r\n2- Open the eyelids to allow water to pass into the eye<br />\r\n3- After washing the eye, tie it with a bandage and go to the specialist doctor immediately</p>'),
(35,	18,	'ar',	'دخول مسمار فى القدم',	'<p>دخول مسمار فى القدم</p>\r\n\r\n<ol>\r\n	<li>قم بإخراج المسمار أو الدبوس بيدك أو بملقاط</li>\r\n</ol>\r\n\r\n<p><span dir=\"RTL\">إذا كان المسمار صدأ أو فى الشارع فيجب الذهاب فورا إلى الطبيب لتلقى مصل التيتانوس أو العلاج بالمضادات الحيوية ولا يجب التأخر عن 6 ساعت حتى يجدى المصل نفعا</span></p>'),
(36,	18,	'en',	'A nail in the foot',	'<p>A nail in the foot<br />\r\n1- Take out the pin or pin by hand or with tongs<br />\r\n2- If the nail is rusted or on the street, you must immediately go to the doctor to receive the tetanus serum or treatment with antibiotics, and it should not be delayed for more than 6 hours until the serum helps</p>'),
(37,	19,	'ar',	'دخول حشرة فى الأذن',	'<p>دخول حشرة فى الأذن</p>\r\n\r\n<p>&nbsp;قد يبدو الأمر غريبا ولكنه وارد الحدوث خاصة أذا لم يكن البيت نظيفا أو ينام الشخص على الأرض</p>\r\n\r\n<ol>\r\n	<li>لا تحاول إخراج الحشرة بعود كبريت أو دبوس</li>\r\n	<li>اثن رأسك إلى الجنب بحيث تصبح الأذن التى بها الحشرة لأعلى</li>\r\n	<li>اسكب زيت دافئ ( بروفين أو جلسرين ) داخل الأذن</li>\r\n	<li>انتظر من 15 إلى 20 دقيقة ثم مل رأسك للناحية الأخرى بحيث تخرج الحشرة مع الزيت</li>\r\n</ol>\r\n\r\n<p><span dir=\"RTL\">إن لم تفلح الطريقة السابقة فعليك بالرقود فى بانيو ماء دافئ مع غمر الأذن فى الماء لتخرج </span></p>'),
(38,	19,	'en',	'Insect in the ear',	'<p>Insect in the ear<br />\r\n&nbsp; It may seem strange, but it can happen, especially if the house is not clean or the person sleeps on the floor<br />\r\n1- Do not try to remove the insect with a match or a pin<br />\r\n2- Bend your head to the side so that the ear with the insect is up<br />\r\n3- Pour warm oil (ibuprofen or glycerin) into the ear<br />\r\n4- Wait from 15 to 20 minutes and then tilt your head to the other side so that the insect comes out with the oil<br />\r\n5- If the previous method did not work, you should lie in a bathtub of warm water with the ear immersed in the water to get out</p>'),
(39,	20,	'ar',	'دخول سنارة سمك فى الجلد',	'<p>دخول سنارة سمك فى الجلد</p>\r\n\r\n<p>إن محاولة اخراج هذا الجسم الصغير بطريقة عشوائية يمكن أن يؤدى إلى ضرر بالغ بالأنسجة . فإن لم تتمكن من استشارة الطبيب فعليك بهذه الطريقة البسيطة</p>\r\n\r\n<ol>\r\n	<li>قم بإخراج السن من الطرف المقابل ( استحمل الآلم البسيط الناتج عن ذلك )</li>\r\n	<li>قم بقص رأس السنارة بواسطة كماشة</li>\r\n	<li>الآن يمكنك سحب السنارة من نفس الجهة بكل سهولة</li>\r\n	<li>اعصر من الإصابة حتى يخرج أى تلوث وطهر الجرح ببعض البيتادين</li>\r\n	<li>عليك مراقبة الجرح فى الأيام التالية إن حدث تورم فهذا يعنى أن الجرح ملوث فعليك باستشارة الطبيب كما يمكن أن تأخذ مضاد حيوى عقب الإصابة مثل ( أمبيسلين&nbsp; 500مجم كل 6 ساعات &ndash; للبالغ )</li>\r\n</ol>'),
(40,	20,	'en',	'A fish hook into the skin',	'<p>a fish hook into the skin<br />\r\nAttempting to remove this small object in a random way can lead to severe tissue damage. If you are unable to consult a doctor, do this simple way<br />\r\n1- Take out the tooth from the opposite end (endure the slight pain resulting from this)<br />\r\n2- Cut the tip of the hook with pliers<br />\r\n3- Now you can easily pull the hook from the same side<br />\r\n4- Squeeze the injury until any contamination comes out and cleanse the wound with some betadine<br />\r\n5- You should monitor the wound in the following days. If swelling occurs, this means that the wound is contaminated. You should consult a doctor. You can also take an antibiotic after the injury, such as (Ampicillin 500 mg every 6 hours - for an adult)</p>'),
(41,	21,	'ar',	'بلع جسم غريب غير حاد (عملة معدنية )',	'<p>بلع جسم غريب غير حاد (عملة معدنية )</p>\r\n\r\n<p>عادة ما يخرج هذا الجسم مع البراز بعد يوم إلى ثلاثة أيام . و إذا صاحب الجسم الغريب متاعب مثل المغص أو الإمساك فإنه يمكن عمل أشعة لتوضيح مسار الجسم وفى كل يتم مراجعة الطبيب</p>'),
(42,	21,	'en',	'Swallowing a blunt foreign body (coin)',	'<p>Swallowing a blunt foreign body (coin)<br />\r\nThis body is usually excreted with stool after one to three days. And if the foreign body has troubles such as colic or constipation, x-rays can be done to clarify the path of the body, and in each case, the doctor is reviewed</p>'),
(43,	22,	'ar',	'بلع جسم حاد ( مسمار أو إبرة )',	'<p>بلع جسم حاد ( مسمار أو إبرة )</p>\r\n\r\n<p>&nbsp;مثل هذه الأشياء يصعب أن تمر من الأمعاء دون جروح ويجب مراجعة الطبيب لعمل أشعة لمعرفة وضع الجسم . كما يجب التأكد من نزول الجسم الغريب فى البراز وقد يحتاج إلى تدخل جراحى .</p>'),
(44,	22,	'en',	'Swallowing a sharp object (nail or needle)',	'<p>Swallowing a sharp object (nail or needle)<br />\r\n&nbsp; Such things are difficult to pass from the intestines without wounds, and the doctor must be consulted to do an x-ray to find out the position of the body. It should also make sure that the foreign body goes down in the stool and may need surgical intervention.</p>'),
(45,	23,	'ar',	'توقف جسم غريب بالمرئ',	'<p>توقف جسم غريب بالمرئ</p>\r\n\r\n<p>قد يحدث بعد بلع جسم غريب أنه لا يصل إلى المعدة و إنما يوقف فى المرئ و قد يحدث هذا ألم تجاه الجسم المحشور ومن الممكن أن يحدث نزيف دموى من الفم لذا يجب الذهاب بالسرعة إلى الطبيب المختص لإستخراج الجسم بواسطة المنظار.</p>'),
(46,	23,	'en',	'A foreign body in the esophagus',	'<p>A foreign body stopped in the esophagus<br />\r\nIt may happen after swallowing a foreign body that it does not reach the stomach, but stops in the esophagus, and this may cause pain towards the jammed body, and bloody bleeding may occur from the mouth, so you must go quickly to the specialist doctor to extract the body through the endoscope.</p>'),
(47,	24,	'ar',	'    الغشيان ( syncope  )',	'<p><strong>&nbsp;&nbsp;&nbsp; الغشيان ( </strong><strong><span dir=\"LTR\">syncope </span></strong><strong>&nbsp;)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>فقدان الوعى له أشكال كثيرة ومتعددة من أشهرها فقدان الوعى المفاجئ لوقت قصير ويحدث إذا انخفض وصول الدم إلى المخ بشكل حاد ولفترة قصيرة مثلما يحدث فى الوقوف لفترة طويلة أو فى حالات فقر الدم او عند التوتر الشديد أو رؤية منظر بشع أو أثناء تضميد الجروح إذا ما عولجت بطريقة خشنة . فى هذه الحالة يشحب وجه المريض وينتابه عرق غزير ونرى أنه لا يستجيب للمؤثرات الخارجية مثل الصوت و الوخز المؤلم</p>\r\n\r\n<p>الإسعاف</p>\r\n\r\n<ol>\r\n	<li>يمدد المريض على ظهره ويكون مستوى الرأس منخفض عن الجسم لمساعدة وصول الدم إلى الرأس</li>\r\n	<li>فك أى أربطة على الجسم مثل الحزام وربطة العنق لمساعدة المريض على التنفس</li>\r\n	<li>فتح النوافذ و إبعاد الناس عنه لكى يتمكن من استنشاق هواء نقى</li>\r\n	<li>رش الماء البارد وصفعه على وجهه أو يشم رائحة نفاذه مثل البصل أو النشادر</li>\r\n</ol>\r\n\r\n<p>فى أى حالة فقدان الوعى لا بد من الإطمئنان على عمل القلب واستمرار التنفس فإذا كان المصاب لايتنفس نجرى على الفور التنفس الصناعى وفى حالة وجود كسور ننقل المريض بحذر مع التأكد من عدم تحريك الجزء المصاب.</p>'),
(48,	24,	'en',	'syncope',	'<p>syncope</p>\r\n\r\n<p>Loss of consciousness has many and many forms, the most famous of which is sudden loss of consciousness for a short time, and it occurs if the blood supply to the brain decreases sharply and for a short period, such as in standing for a long time, in cases of anemia, when severe tension, seeing an ugly sight, or while dressing wounds if they are treated. in a rough way. In this case, the patient&#39;s face turns pale and profusely sweats, and we see that he does not respond to external stimuli such as sound and painful tingling.<br />\r\nambulance<br />\r\n1- The patient lies on his back and the level of the head is lower than the body to help the blood reach the head<br />\r\n2- Loosen any straps on the body, such as the belt and tie, to help the patient breathe<br />\r\n3- Open windows and keep people away from him so that he can breathe fresh air<br />\r\n4- Sprinkle cold water and slap him on the face or smell a strong odor such as onions or ammonia<br />\r\nIn any case of loss of consciousness, it is necessary to check on the work of the heart and the continuation of breathing. If the victim is not breathing, we immediately perform artificial respiration. In the event of fractures, we move the patient with caution, making sure not to move the injured part.</p>'),
(49,	25,	'ar',	'المبيدات',	'<p>يعد تهيج الجلد من المبيدات من الأعراض الأكثر شيوعًا والتي تدل على حدوث تسمم الجلد عند استخدام المبيدات، حيث يتمثل بحدوث&nbsp;التهاب الجلد&nbsp;الذي تتراوح أعراضه بين احمرار الجلد وطفحه.<br />\r\nتحدث معظم حالات تهيج الجلد من المبيدات نتيجة انسكابها أثناء النقل، أو تناثرها أثناء الخلط، أو الرش، أو لمس المحاصيل التي تم رشها حالًا.</p>\r\n\r\n<p>يمكن علاج تهيج الجلد من المبيدات باتباع بعض التعليمات التي تساعد في التخفيف من التهيج لحين التواصل مع مركز مراقبة في السموم، ومن الأساليب المستخدمة لعلاج تهيج الجلد من المبيدات:&nbsp;</p>\r\n\r\n<h3>1. إزالة الملابس</h3>\r\n\r\n<p>يجب إزالة جميع الملابس التي كان يرتديها الشخص المصاب والتي تكون ملوثة بالمبيدات، والتخلص منها بأكياس في مكب النفايات.</p>\r\n\r\n<h3>2. استخدام الماء</h3>\r\n\r\n<p>يجب غسل جميع أجزاء الجسم المعرضة للمبيدات باستخدام الماء النظيف والصابون.</p>\r\n\r\n<p>كما يجب التأكد من وصول الماء إلى تحت&nbsp;الأظافر&nbsp;وثنايا الجلد ويساعد ذلك في علاج تهيج الجلد من المبيدات.</p>\r\n\r\n<h3>3. استخدام الشامبو&nbsp;</h3>\r\n\r\n<p>قد يعلق بعض أنواع المبيدات بفروة الرأس والشعر، لذلك لا بد من استخدام الماء والشامبو للتخلص منها، مما يساعد في علاج تهيج الجلد من المبيدات.</p>\r\n\r\n<h3>4.&nbsp;الاتصال بالطبيب</h3>\r\n\r\n<p>يجب الاتصال بالطبيب أو مركز مراقبة السموم للحصول على النصائح العلاجية.</p>\r\n\r\n<p>كما يجب التنويه لضرورة تجنب الاتصال المباشر بالمصاب أو ملابسه الملوثة، وارتداء القفازات المضادة للمواد الكيميائية أثناء مساعدة المصاب.</p>'),
(50,	25,	'en',	'pesticides',	'<p>Skin irritation from pesticides is one of the most common symptoms that indicate the occurrence of skin poisoning when using pesticides, as it is the occurrence of dermatitis whose symptoms range from redness to the skin and rashes.</p>\r\n\r\n<p>Most skin irritations from pesticides are caused by spillage during transportation, scattering during mixing, spraying, or contact with crops that have just been sprayed.<br />\r\nSkin irritation from pesticides can be treated by following some instructions that help relieve irritation until contacting a poison control center. The methods used to treat skin irritation from pesticides include:</p>\r\n\r\n<p>1. Remove clothes<br />\r\nAll clothing worn by the infected person that was contaminated with pesticides should be removed and disposed of in bags at the landfill.</p>\r\n\r\n<p>2. Use of water<br />\r\nAll parts of the body exposed to pesticides should be washed using clean water and soap.</p>\r\n\r\n<p>You must also ensure that water reaches under the nails and folds of the skin, and this helps in treating skin irritation from pesticides.</p>\r\n\r\n<p>3. Use shampoo<br />\r\nSome types of pesticides may stick to the scalp and hair, so it is necessary to use water and shampoo to get rid of them, which helps in treating skin irritation from pesticides.</p>\r\n\r\n<p>4. Contact a doctor<br />\r\nA physician or poison control center should be contacted for treatment advice.</p>\r\n\r\n<p>It should also be noted the need to avoid direct contact with the victim or his contaminated clothing, and to wear anti-chemical gloves while assisting the injured.</p>'),
(51,	26,	'ar',	'بلع المبيدات',	'<p>يتطلب ابتلاع المبيدات تدخلًا طبيًا فوريًا، لكن يمكن تقديم بعض الإسعافات الأولية لحين وصول الطوارئ، ومنها:&nbsp;</p>\r\n\r\n<p>غسل الفم بالماء إذا كان هناك بقايا للمبيد بالفم.<br />\r\nالاستعانة بالإسعافات الأولية الموجودة على ملصق المبيد.<br />\r\nالاتصال بمركز الطوارئ فورًا، وتواصل مع مركز مراقبة السموم لمتابعة الحالة.<br />\r\nمحاولة إحداث قيء عند المريض باستخدام الإصبع، لكن يجب عليك التأكد أولًا أن حدوث القيء لمثل هذه الحالة مسموح.<br />\r\nاستخدام الفحم المنشط بعد القيء، حيث يعمل على امتصاص المواد الكيميائية.<br />\r\nالحفاظ على هدوء المصاب.</p>'),
(52,	26,	'en',	'swallowing pesticides',	'<p>Swallowing pesticides requires immediate medical intervention, but some first aid can be provided until the emergency arrives, including:</p>\r\n\r\n<p>1- Rinse the mouth with water if there is a residue of the pesticide in the mouth.<br />\r\n2- Use the first aid found on the pesticide label.<br />\r\n3- Call the emergency center immediately, and contact the poison control center for follow-up.<br />\r\n4- Attempting to induce vomiting in the patient using the finger, but you must first make sure that vomiting for such a case is permissible.<br />\r\n5- Use activated charcoal after vomiting, as it absorbs chemicals.<br />\r\n6- Keep the patient calm.</p>'),
(53,	27,	'ar',	'استنشاق المبيدات',	'<p>يحدث استنشاق المبيدات في بعض الحالات تسممًا عند المصاب، لذلك لا بد من التنويه لضرورة الالتزام بمعدات السلامة عند استخدام المبيدات.</p>\r\n\r\n<p>كما يمكن تقديم الإسعافات الأولية للمريض عند الاستنشاق كما يأتي:&nbsp;</p>\r\n\r\n<p>اسحب المصاب إلى الهواء الطلق فورًا.<br />\r\nافتح الأبواب والنوافذ لتجنب إصابة شخص اخر.<br />\r\nقم بفك ملابس المصاب خاصة الضيقة.<br />\r\nاتصل بمركز الطوارئ فورًا لتأمينك بجهاز التنفس الصناعي.</p>'),
(54,	27,	'en',	'inhalation of pesticides',	'<p>In some cases, inhalation of pesticides causes poisoning of the injured, so it must be noted the need to adhere to safety equipment when using pesticides.</p>\r\n\r\n<p>It can also provide first aid to the patient when inhaled as follows:</p>\r\n\r\n<p>1- Take the casualty out to fresh air immediately.<br />\r\n2- Open doors and windows to avoid injuring another person.<br />\r\n3- Loosen the casualty&#39;s clothing, especially the tight ones.<br />\r\n4- Call the emergency center immediately to secure a respirator.</p>'),
(55,	28,	'ar',	'التشنجات ',	'<p><strong>التشنجات&nbsp;</strong><br />\r\nهى حركات لا إرادية تنتاب عضلات الجسم وتحدث فى شكل فجائى وتتكرر فى صورة نوبات .&nbsp;<br />\r\nويعتبر مرض الصرع هو أكثر الأسباب شيوعا لدوث التشنجات وتحدث عادة بسبب عدم الإنتظام على الدواء.&nbsp;<br />\r\nوهناك التشنجات الهستيرية &nbsp;والتى تحدث عادة من فتاة أو سيدة غير مثقفة أمام متفرجين لذلك إنصراف أفراد الأسرة أمر ضرورى لوقف التشنجات الهستيرية .<br />\r\nوهناك أسباب أخرى للتشنجات فممكن أن تحدث فى الطفل بسبب ارتفاع درجة الحرارة أو ضربة شمس و قد تحدث للحوامل بسبب تسمم الحمل .<br />\r\nالإسعافات<br />\r\n1-&nbsp;&nbsp; &nbsp;إذا لم تكن سبب التشنجات مرض الصرع فيجب استدعاء الطبيب على الفور .<br />\r\n2-&nbsp;&nbsp; &nbsp;من الخطأ أن تحاول منع المريض من الحركة بالقوة فهذا قد يؤدى إلى تمزق العضلات أو خلع المفاصل أو حتى كسور<br />\r\n3-&nbsp;&nbsp; &nbsp;يجب وضع المريض على الأرض أو السرير و إبعاد أى شئ من حولة قد يؤذيه إلى أن تنتهى التشنجات.<br />\r\n4-&nbsp;&nbsp; &nbsp;بعد انتهاء التشنجات يجب وضع المريض فى غرفة هادئة مظلمة فى وضع الإفاقة ( الرأس إلى أسفل ) حتى يستعيد وعيه<br />\r\n5-&nbsp;&nbsp; &nbsp;فى حالة الطفل المصاب بالتشنجات نتيجة ارتفاع درجة الحرارة يجب عمل كمادات باردة على الجبهه بعد التشنجات لخفض درجة الحرارة مع العلم أن أدوية خفض الحرارة لا تعمل عند درجات الحرارة العالية جدا .<br />\r\n6-&nbsp;&nbsp; &nbsp;يجب استدعاء الطبيب أو الذهاب إلى الطبيب المختص فورا<br />\r\n&nbsp;</p>'),
(56,	28,	'en',	'convulsions',	'<p><strong>convulsions</strong><br />\r\nThey are involuntary movements of the muscles of the body that occur suddenly and are repeated in the form of fits.<br />\r\nEpilepsy is the most common cause of convulsions and usually occurs due to irregular medication.<br />\r\nThere are hysterical spasms, which usually occur from an uneducated girl or woman in front of spectators, so the departure of family members is necessary to stop hysterical spasms.<br />\r\nThere are other causes of convulsions, as they may occur in the child due to high temperature or heat stroke, and may occur to pregnant women due to preeclampsia.<br />\r\nfirst aid<br />\r\n1- If the convulsions are not caused by epilepsy, a doctor should be called immediately.<br />\r\n2- It is wrong to try to prevent the patient from moving by force, as this may lead to muscle tears, joint dislocation, or even fractures<br />\r\n3- The patient should be placed on the floor or the bed and anything around him that might harm him should be removed until the convulsions are over.<br />\r\n4- After the convulsions have ended, the patient should be placed in a dark, quiet room in the recovery position (head down) until he regains consciousness.<br />\r\n5- In the case of a child suffering from convulsions as a result of high temperature, cold compresses should be applied to the forehead after the convulsions to reduce the temperature, knowing that fever-reducing medicines do not work at very high temperatures.<br />\r\n6- You must call a doctor or go to a specialist doctor immediately</p>'),
(57,	29,	'ar',	'أزمة الربو',	'<p><strong>أزمة الربو</strong><strong> </strong></p>\r\n\r\n<p>يتعرض &nbsp;مرضى الربو لأزمات متكررة تستمر فيها صعوبة التنفس و يسمع تزييق الصدر واضحا للمحيطين بالمريض , و يظهر عليه التوتر و الجزع بوضوح</p>\r\n\r\n<p>ويحدث الربو بسبب التعرض للغبار أو الدخان ويساعد الإنفعال النفسى فى حدوث النوبة.</p>\r\n\r\n<p><strong>الإسعافات</strong></p>\r\n\r\n<ol>\r\n	<li>أهم ما يجب أن يحرص المحيطين بالمريض هو طمأنته و تهيئة جو نفسى مريح يساعده على مغالبة التوتر , أما الإلتفاف حوله والبكاء و العويل فإنة يؤدى إلى زيادة التوتر ممايؤدى إلى زيادة النوبة كما يمنع عنه الهواء النقى</li>\r\n	<li>يجلس المريض فى مكان موفور الهواء وياخذ الوضع الذى يناسبه فى التنفس.</li>\r\n	<li>يستعمل المريض بخاخة الربو المعتادة له مثل <strong>فنتولين </strong>( بخه واحده إذا لزم الأمر تكرر بعد خمس دقائق ولا تكرر ثانية إلا بعد ساعتين )</li>\r\n	<li>إذا لم يوجد بخاخ فيأخذ أى أقىرص موسعة للشعب مثل <strong>فنتولين </strong></li>\r\n	<li>يتم عمل حمام بخار واسنتشاق بخار الماء المتصاعد لإذابة المخاط فى الشعب الهوائية ومن الممكن إضافة ورق النعناع للماء المغلى</li>\r\n	<li>إذا لم يظهر أى تحسن أو ظهر إزرقاق المريض فيتم نقله فورا إلى المستشفى أو استدعاء الطبيب المختص .</li>\r\n</ol>'),
(58,	29,	'en',	'Asthma crisis',	'<p><strong>Asthma crisis</strong><br />\r\nAsthma patients are exposed to recurrent crises in which difficulty breathing persists, and the chest murmurs are heard clearly to those around the patient, and the tension and anxiety appear clearly on him.<br />\r\nAsthma occurs due to exposure to dust or smoke, and psychological agitation helps in the occurrence of the attack.<br />\r\n<strong>first aid</strong><br />\r\n1- The most important thing that people around the patient should be keen on is reassuring him and creating a comfortable psychological atmosphere that helps him to overcome tension.<br />\r\n2- The patient sits in a place with good air and takes the position that suits him for breathing.<br />\r\n3- The patient uses his usual asthma inhaler, such as Ventolin (one spray if necessary, to be repeated after five minutes and not to be repeated again until after two hours).<br />\r\n4- If there is no spray, take any extended-release tablets such as Ventolin<br />\r\n5- A steam bath is made and the rising water vapor is inhaled to dissolve the mucus in the airways. It is possible to add mint leaves to the boiling water.<br />\r\n6- If no improvement appears or the patient appears cyanosis, he is immediately transferred to the hospital or a specialist doctor is called.</p>'),
(59,	30,	'ar',	'نقص السكر بالدم',	'<p><strong>نقص السكر بالدم </strong></p>\r\n\r\n<p>يعتمد ضبط مستوى السكر فى الدم فى مريض السكر على الدواء و الغذاء و المجهود وبناء على ذلك إما أن ينخفض مستوى السكر فى الدم أو يرتفع وفى كلا الحالتين ممكن أن ينتهى الأمر بالدخول فى غيبوبة . و فى الحقيقة أن انخفاض مستوى السكر فى الدم أخطر بكثير من ارتفاعه إذ من الممكن أن يؤدى ذلك إلى غيبوبة يموت بعدها الشخص بوقت قصير</p>\r\n\r\n<p><strong>علامات نقص السكر فى الدم </strong></p>\r\n\r\n<p>عند تناول جرعة زائدة من الدواء أو فوات وجبة رئيسية أو عمل مجهود عضلى زائد يؤدى ذلك إلى :</p>\r\n\r\n<ol>\r\n	<li>يظهر على المريض العصبية&nbsp; التوتر و الذى قد يصل إلى حد الهياج و التشنجات</li>\r\n	<li>يظهر على المرض العرق الزائد</li>\r\n	<li>عدم القدرة على التركيز وضبط الأفكار وصدور أفعال غير مسؤولة منه</li>\r\n	<li>لو قمت بوضع شرائط التحليل فى عينة البول لن تجد أى تغيير مما يدل على عدم وجود سكر فى البول</li>\r\n</ol>\r\n\r\n<p><strong>الإسعافات</strong></p>\r\n\r\n<ol>\r\n	<li>إذا كان المريض غير فاقد الوعى يتناول كمية من السكر أو الحلويات</li>\r\n	<li>إذا بدأ المريض فى فقدان الوعى فلا يعطى شئ بالفم ولكن ممكن أن ندهن العسل على شفتتيه</li>\r\n	<li>يؤكد سرعة استجابة المريض صحة التشخيص فحالة انخفاض السكر كما تسوء سريعا تتحسن سريعا</li>\r\n	<li>لا بد من وضع بعض قوالب السكر أو الحلوى مع مريض السكر لإستخدامها فى الطوارئ</li>\r\n</ol>'),
(60,	30,	'en',	'Hypoglycemia',	'<p><strong>Hypoglycemia</strong><br />\r\nControlling the blood sugar level in a diabetic depends on medication, food, and effort. Accordingly, the blood sugar level either decreases or rises, and in both cases it may end up in a coma. In fact, low blood sugar is much more dangerous than high, as it can lead to a coma, after which the person dies in a short time.<br />\r\n<strong>Signs of low blood sugar</strong><br />\r\nWhen taking an overdose of the medicine, missing a main meal, or making excessive muscle effort, this leads to:<br />\r\n1- The patient appears nervous, which may reach the point of agitation and convulsions<br />\r\n2- The disease shows excessive sweating<br />\r\n3- The inability to focus and control thoughts and the issuance of irresponsible actions from him<br />\r\n4- If you put the analysis strips in the urine sample, you will not find any change, which indicates that there is no sugar in the urine<br />\r\n<strong>first aid</strong><br />\r\n1- If the patient is unconscious and eats an amount of sugar or sweets<br />\r\n2- If the patient begins to lose consciousness, do not give anything by mouth, but it is possible to apply honey on his lips<br />\r\n3- The patient&#39;s rapid response confirms the correctness of the diagnosis. The condition of low sugar as it worsens quickly improves quickly<br />\r\n4- Some sugar or candy molds must be placed with the diabetic to be used in emergency</p>'),
(61,	31,	'ar',	'الارتجاج',	'<p>حالة يسببها هزّ الدماغ. والدماغ يوسّد ضمن الجمجمة بالسائل الدماغي الشوكي لذا فإذا ما تعرض الرأس لضربة فبإمكان الدماغ الارتداد من جانب لآخر مما يتسبب بتعطيل واسع الانتشار<br />\r\nلعمله الطبيعي فيمكن أن يغيب المصاب عن وعيه لفترة قصيرة (غالباً أقل من ثلا دقائق) وبعدها<br />\r\nينبغي أن يرتفع مستوى الاستجابة لديه ويجب أن يستعيد المصاب وعيه بالكامل إذا لم يكن ثمّة مضاعفات</p>\r\n\r\n<p><strong>الأعراض</strong></p>\r\n\r\n<ol>\r\n	<li>الغياب عن الوعي لفترة وجيزة يتبعها تحسن في مستوى الاستجابة ومن ثم استعادة الوعي<br />\r\n	&nbsp;</li>\r\n	<li>فقدان ذاكرة قصير الأمد وبخاصة للحاد</li>\r\n	<li>واضطراب وتهيّج</li>\r\n	<li>&nbsp;صداع معتدل وعام</li>\r\n	<li>شحوب الجلد وتعرقه</li>\r\n	<li>التنفس إما طبيعي أو خفيف</li>\r\n	<li>النبض إما سريع أو بطيء (الدم يحول إلى خارج<br />\r\n	الأطراف)</li>\r\n	<li>&nbsp;الحدقتان طبيعيتان ومتفاعلتان مع الضوء</li>\r\n	<li>&nbsp;من الممكن حدو غثيان أو إقياء عند استعادة الوعي\r\n	<p><strong>الاسعاف</strong></p>\r\n	</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>الإسعاف<br />\r\n*-&nbsp;&nbsp; &nbsp;اتصل بالإســـعـــاف إذا كــان الـمـصـاب غـائـبـاً عـن الوعي ومستوى<br />\r\nاستجابته يتدهور أو شككت بوجود كسر في الجمجمة .<br />\r\n*-&nbsp;&nbsp; &nbsp;حــافــظ عــلـــــى الـمـجـــــــاري التنـفسـيـة والـتـنـفس .<br />\r\n*-&nbsp;&nbsp; &nbsp; إذا أردت حمـايــة مجــاري الـتـنـفس فـقـم بـوضـع الـمـصـاب في وضعية إعادة<br />\r\nالوعي وأبـق الـرأس والعنـق والجســـم على استقامة واحدة أثناء تدوير المصاب</strong></p>\r\n\r\n<p><strong>*-&nbsp;&nbsp; &nbsp;إذا كــان الـمـصـاب واعياً (غير فاقد الوعي) ســـاعده في التمدد وأبق الرأس<br />\r\nوالعنـق والجسـم على استـقامــة واحدة خوفاًمن إمكانية وجود إصابة في العنق<br />\r\n*-&nbsp;&nbsp; &nbsp;سيطر على أي نزيف بالقيام بضغط لطيف حول الجرح ولكن في حال وجود<br />\r\nنزيف أو تفريغ (مفرزات) من الأذن فإياك أن تحاول سد الأذن أو أن توقف النزيف<br />\r\n*-&nbsp;&nbsp; &nbsp;ابحث عن مصابين آخرين وعالجهم<br />\r\n*-&nbsp;&nbsp; &nbsp;راقب باستمرار وسجل حالة التنفس والنبض ومستوى راقب باستمرار وسجل حالة التنفس والنبض ومستوى الاستجابة وحتى لو بدا أن المصاب بدأ باستعادة وعيه فاحترس<br />\r\nمن انخفاض مستوى الاستجابة فيما بعد.<br />\r\n*-&nbsp;&nbsp; &nbsp;تأكد من أن المصاب بالارتجاج المستعيد لوعيه لن يكون وحيداً في الساعات التالية وانصحه بمراجعة طبيب بأسرع ما يمكن<br />\r\n*-&nbsp;&nbsp; &nbsp;يجب على المصاب الذهاب فوراً إلى المشفى في الأيام التالية إذا أصبح يعاني من صداع حاد أو غثيان أو إقياء أو نعاس متزايد أو ضعف في إحدى الأطراف أو وجود مشاكل في النطق أو دوار أو خروج سوائل من الأنف أو الأذن أو وجود مشاكل بصرية أو نوبات أو تشوش(اضطراب)<br />\r\n*-&nbsp;&nbsp; &nbsp;لا تسمح لرياضي مصاب بارتجاج باللعب حتى يرى طبيباً<br />\r\n*-&nbsp;&nbsp; &nbsp;اطلب استشارة طبية قبل السماح للمصاب بالأكل أو الشرب</strong></p>'),
(62,	31,	'en',	'concussion',	'<p>A condition caused by shaking the brain. Within the skull, the brain is covered with cerebrospinal fluid, so if the head is hit, the brain can bounce from side to side, causing widespread disruption.<br />\r\nFor its normal work, the casualty may be unconscious for a short period (often less than three minutes) and then<br />\r\nThe response level should be raised and the casualty should fully regain consciousness if there are no complications</p>\r\n\r\n<p><strong>Symptoms</strong><br />\r\n1- Loss of consciousness for a short period, followed by an improvement in the level of response, and then regaining consciousness</p>\r\n\r\n<p>2- Short-term memory loss, especially severe<br />\r\n3- Confusion and irritability<br />\r\n4- Mild and general headache<br />\r\n5- Pale and sweaty skin<br />\r\n6- Breathing is either normal or light<br />\r\n7- The pulse is either fast or slow (blood turns outward<br />\r\nthe parties)<br />\r\n8- The pupils are normal and reactive to light<br />\r\n9- Nausea or vomiting may occur when consciousness is restored</p>\r\n\r\n<p><strong>first aid</strong></p>\r\n\r\n<p>ambulance<br />\r\n*- Call an ambulance if the casualty is unconscious and the level of<br />\r\nHis response is deteriorating or he suspects a skull fracture.<br />\r\n*- Maintain the airways and breathing.<br />\r\n*- If you want to protect the respiratory tract, put the casualty in a re-position.<br />\r\nAwareness and keep the head, neck and body straight while rotating the casualty</p>\r\n\r\n<p>*- If the casualty is conscious (not unconscious), help him to stretch and keep the head<br />\r\nThe neck and the body are straight, for fear of the possibility of a neck injury<br />\r\n* - Control any bleeding by applying gentle pressure around the wound, but only if there is<br />\r\nBleeding or discharge (discharge) from the ear, do not try to block the ear or stop the bleeding<br />\r\n* Find and treat other patients<br />\r\n*- Constantly monitor and record the state of respiration and pulse and the level of constantly monitor and record the state of respiration and pulse and the level of response, and even if it appears that the patient is starting to regain consciousness, be careful<br />\r\nfrom a lower level of response later.<br />\r\n*- Make sure that the concussion victim is not alone in the following hours and advise him to see a doctor as soon as possible<br />\r\n*- The patient must go immediately to the hospital in the following days if he suffers from severe headache, nausea, vomiting, increased drowsiness, weakness in one of the limbs, speech problems, dizziness, fluid from the nose or ear, visual problems or seizures. or confusion<br />\r\n*- Do not allow an athlete with a concussion to play until they see a doctor<br />\r\n*- Seek medical advice before allowing the casualty to eat or drink</p>\r\n\r\n<p>&nbsp;</p>'),
(63,	32,	'ar',	'الانضغاط',	'<p>حالة خطيرة جداً لأن الدماغ يكون فيها متوضعاً تحت ضغط هائل سببه إما نزيف أو تورم في الجوف القحفي ويمكن أن يكون سبب الانضغاط هو كسر في الجمجمة أو إصابة في الرأس ويمكن أن يحد بسبب المرض مثل تمزق الأوعية الدموية (وهو أحد أنواع السكتة الدماغية) أو بسبب ورم الدماغ أو بسبب العدوى كمرض السحايا. وهذه الحالة لا يتعامل معها إلا الطبيب المختص</p>\r\n\r\n<p><strong>الأعراض</strong></p>\r\n\r\n<p>*- يمكن للمصاب تذكر قصة حادثة إصابة رأسه الأخيرة مع استعادة وعيه ظاهرياً لكن بعد ذلك تتدهور حالته<br />\r\n<span dir=\"LTR\">* </span>- يسوء مستوى الاستجابة كلما تطورت الحالة<br />\r\n<span dir=\"LTR\">* </span>&nbsp;- صداع شديد</p>\r\n\r\n<p>&nbsp;*- الجلد يكون محمراً وجافاً<br />\r\n<span dir=\"LTR\">* </span>&nbsp;-التنفس إما عميق أو ضوضائي أو بطيء (إذا كان الضغط على مركز التنفس في<br />\r\nالدماغ )</p>\r\n\r\n<p>* -النبض إما ضعيف أو قوي (بسببارتفاع ضغط الدم)</p>\r\n\r\n<p>*- قد تتوسع إحدى أو كلا الحدقتين إذا ازداد الضغط على الدماغ<br />\r\n<span dir=\"LTR\">* </span>- تصبح الحالة أسوأ وربما تحد نوبات دون استعادة المصاب للوعي</p>\r\n\r\n<p><strong>الإسعاف</strong></p>\r\n\r\n<p><strong>نفس خطوات الارتجاج</strong></p>'),
(64,	32,	'en',	'compression',	'<p>A very serious condition because the brain is under tremendous pressure caused by either bleeding or swelling in the cranial cavity. The cause of the compression can be a skull fracture or head injury and may be limited by disease such as rupture of blood vessels (a type of stroke) or due to Brain tumor or infection such as meningitis. This case can only be dealt with by a specialist doctor</p>\r\n\r\n<p><strong>Symptoms</strong><br />\r\nThe casualty can remember the story of his last head injury while apparently regaining consciousness, but then his condition deteriorates<br />\r\n* - The level of response worsens as the condition progresses<br />\r\n* &nbsp;- Severe headache<br />\r\n&nbsp; * The skin is red and dry</p>\r\n\r\n<p><strong>first aid</strong></p>\r\n\r\n<p><strong>Same steps as concussion</strong><br />\r\n* - Breathing is either deep, noisy, or slow (if the pressure on the respiratory center is in<br />\r\nthe brain )<br />\r\n* - The pulse is either weak or strong (due to high blood pressure)<br />\r\n*- One or both pupils may dilate if pressure on the brain increases<br />\r\n* - The condition becomes worse and may limit seizures without regaining consciousness</p>'),
(65,	33,	'ar',	'كسر الجمجمة',	'<p>إن كسر الجمجمة خطير لأن العظم المكسور يمكنه أن يؤذي الدماغ مباشرة أو يسبب النزيف والذي بدوره يؤدي إلى الانضغاط. فتوقع من أي مريض تلقى ضربة على رأسه أن يكون لديه كسر في الجمجمة وخاصة إذا كان المريض بمستوى متدنٍ من الاستجابة . فى هذه الحالة يجب الذهاب فورا إلى أقرب مستشفى طوارئ<br />\r\n&nbsp;</p>\r\n\r\n<p><strong>الأعراض</strong></p>\r\n\r\n<p>*- يمكن أن يعاني المصاب أيضاً من الارتجاج أو الانضغاط مع الكسر لذا فتلك<br />\r\nالعلامات والأعراض يمكن أن تحصل إضافة لـ<span dir=\"LTR\"> :<br />\r\n* </span>نزيف أو تورّم أو رض للرأس<br />\r\n<span dir=\"LTR\">* </span>منطقة طرية أو انخفاض في فروة الرأس<br />\r\n<span dir=\"LTR\">* </span>كدمات حول إحدى أو كلي العينين<br />\r\n<span dir=\"LTR\">* </span>كدمات (رضوض) أو تورّم خلف الأذن<br />\r\n<span dir=\"LTR\">* </span>نزيف أو خروج سائل من الأذن أو الأنف<br />\r\n<span dir=\"LTR\">* </span>وجود تشوه أو نقص في تناسق الرأس<br />\r\n<span dir=\"LTR\">* </span>وجود دم في بياض العين</p>\r\n\r\n<p><strong>الإسعاف </strong></p>\r\n\r\n<p><strong>نفس خطوات الارتجاج </strong></p>'),
(66,	33,	'en',	'skull fracture',	'<p>A skull fracture is dangerous because the broken bone can directly injure the brain or cause bleeding, which in turn leads to compression. Expect any patient who received a blow to the head to have a skull fracture, especially if the patient had a low level of response. In this case, you must immediately go to the nearest emergency hospital</p>\r\n\r\n<p><strong>Symptoms</strong><br />\r\n*- The patient may also suffer from concussion or compression with the fracture, so this is<br />\r\nSigns and symptoms can occur in addition to:<br />\r\n* Bleeding, swelling or trauma to the head<br />\r\n* A tender or drooping area of the scalp<br />\r\nBruising around one or both eyes<br />\r\nBruising (bruising) or swelling behind the ear<br />\r\n* Bleeding or fluid draining from the ear or nose<br />\r\n* The presence of deformation or lack of coordination of the head<br />\r\n* There is blood in the white of the eye</p>\r\n\r\n<p><strong>first aid</strong><br />\r\nSame steps as concussion</p>');

DROP TABLE IF EXISTS `first_aid_translations`;
CREATE TABLE `first_aid_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_aid_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `first_aid_translations_first_aid_id_locale_unique` (`first_aid_id`,`locale`),
  KEY `first_aid_translations_locale_index` (`locale`),
  CONSTRAINT `first_aid_translations_first_aid_id_foreign` FOREIGN KEY (`first_aid_id`) REFERENCES `first_aids` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `first_aid_translations` (`id`, `first_aid_id`, `locale`, `name`) VALUES
(1,	1,	'ar',	'الآم الرأس'),
(2,	1,	'en',	'head'),
(3,	2,	'ar',	'الجهاز التنفسى'),
(4,	2,	'en',	'Respiratory system'),
(5,	3,	'ar',	'الجروح'),
(6,	3,	'en',	'wounds'),
(7,	4,	'ar',	'إضطرابات الدورة الدموية'),
(8,	4,	'en',	'circulatory disorders'),
(9,	5,	'ar',	'الجلد'),
(10,	5,	'en',	'skin'),
(11,	6,	'ar',	'الكسور'),
(12,	6,	'en',	'fractions'),
(13,	7,	'ar',	'التسمم'),
(14,	7,	'en',	'poisoning'),
(15,	8,	'ar',	'الأجسام الغريبة'),
(16,	8,	'en',	'foreign bodies'),
(17,	9,	'ar',	'حوادث'),
(18,	9,	'en',	'Accidents'),
(19,	10,	'ar',	'الأمراض العصبية'),
(20,	10,	'en',	'Neurological diseases'),
(21,	11,	'ar',	'الجهاز الهضمى'),
(22,	11,	'en',	'Gastrointestinal tract'),
(23,	12,	'ar',	'المجرى البولى والتناسلى'),
(24,	12,	'en',	'Urinary and genital tract'),
(25,	13,	'ar',	'عضة الحيوانات'),
(26,	13,	'en',	'animals bite');

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_resets_table',	1),
(3,	'2016_06_01_000001_create_oauth_auth_codes_table',	1),
(4,	'2016_06_01_000002_create_oauth_access_tokens_table',	1),
(5,	'2016_06_01_000003_create_oauth_refresh_tokens_table',	1),
(6,	'2016_06_01_000004_create_oauth_clients_table',	1),
(7,	'2016_06_01_000005_create_oauth_personal_access_clients_table',	1),
(8,	'2019_08_19_000000_create_failed_jobs_table',	1),
(9,	'2021_03_22_191340_laratrust_setup_tables',	1),
(10,	'2021_09_21_085542_create_notifications_table',	1),
(11,	'2021_10_21_172949_create_specials_table',	1),
(12,	'2021_11_21_171930_create_doctors_table',	1),
(13,	'2021_11_21_174715_create_patients_table',	1),
(14,	'2021_11_22_095454_create_doctor_verify_emails_table',	1),
(15,	'2021_11_22_110619_create_doctor_forget_emails_table',	1),
(16,	'2021_12_02_120433_create_patient_medicals_table',	1),
(17,	'2021_12_05_114428_create_doctor_personal_histories_table',	1),
(18,	'2021_12_06_124148_create_patient_personal_histories_table',	1),
(19,	'2021_12_09_134159_create_doctor_family_histories_table',	1),
(20,	'2021_12_09_155103_create_patient_family_histories_table',	1),
(21,	'2021_12_10_105355_create_doctor_travel_histories_table',	1),
(22,	'2021_12_10_133627_create_patient_travel_histories_table',	1),
(23,	'2021_12_12_110808_create_doctor_medical_reports_table',	1),
(24,	'2021_12_13_105532_create_patient_medical_reports_table',	1),
(25,	'2021_12_13_130031_create_firstaids_table',	1),
(26,	'2021_12_13_130219_create_firstaid_children_table',	1),
(27,	'2021_12_14_115157_create_emergencs_table',	1),
(28,	'2021_12_14_115738_create_emergenc_children_table',	1),
(29,	'2021_12_19_194048_create_first_aid_translations_table',	1),
(30,	'2021_12_19_211419_create_first_aid_child_translations_table',	1),
(31,	'2021_12_20_122949_create_emergenc_translations_table',	1),
(32,	'2021_12_20_130856_create_emergenc_child_translations_table',	1);

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bidder_id` bigint(20) unsigned DEFAULT NULL,
  `vehicle_id` bigint(20) unsigned DEFAULT NULL,
  `whowinner_id` bigint(20) unsigned DEFAULT NULL,
  `whowner_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `read_at` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `patients`;
CREATE TABLE `patients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci,
  `dob` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_firebase` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `height` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smoking` tinyint(1) DEFAULT NULL,
  `alcohol` tinyint(1) DEFAULT NULL,
  `login` tinyint(1) NOT NULL DEFAULT '0',
  `serial_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'patient.png',
  `verified_email` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `patients_phone_unique` (`phone`),
  UNIQUE KEY `patients_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `patients` (`id`, `full_name`, `phone`, `email`, `password`, `token`, `dob`, `gender`, `token_firebase`, `type`, `height`, `blood_type`, `smoking`, `alcohol`, `login`, `serial_key`, `avatar`, `verified_email`, `created_at`, `updated_at`) VALUES
(34,	'Mohamed Adel',	'01017238583',	'mohamedadel.developer@gmail.com',	'$2y$10$mSf5uHyMufORpkKHKir/xOJgLXPXG/CmmEUujhi9Qyp1xEiZEKAN.',	'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vcGhwbGFyYXZlbC02OTUwMTgtMjMwMDQ3NC5jbG91ZHdheXNhcHBzLmNvbS9hcGkvbG9naW4iLCJpYXQiOjE2NDE4NTQ3ODMsIm5iZiI6MTY0MTg1NDc4MywianRpIjoiVlR6QWs4R0RjMVBJSmw1cCIsInN1YiI6MzQsInBydiI6Ijc1Mjg5NTY3MTBkMWM3NWI2NzEzMGQ0ZTRjNWMwZWU5YTBhZWI2MTQiLCJ0eXBlIjoicGF0aWVudCJ9.gdE24ub0MA6yK97O_Q1v6wxEG56t-Af3EUamo2z2xbk',	'12/10/2000',	'Male',	NULL,	'patient',	NULL,	NULL,	NULL,	NULL,	1,	'21641854760',	'patient.png',	1,	'2022-01-10 22:46:00',	'2022-01-10 22:46:23');

DROP TABLE IF EXISTS `patient_family_histories`;
CREATE TABLE `patient_family_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `relation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diagnosis` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_family_histories_patient_id_foreign` (`patient_id`),
  CONSTRAINT `patient_family_histories_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `patient_medicals`;
CREATE TABLE `patient_medicals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `doctor_id` bigint(20) unsigned DEFAULT NULL,
  `patient_id` bigint(20) unsigned DEFAULT NULL,
  `doc_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_medicals_doctor_id_foreign` (`doctor_id`),
  KEY `patient_medicals_patient_id_foreign` (`patient_id`),
  KEY `patient_medicals_doc_id_foreign` (`doc_id`),
  CONSTRAINT `patient_medicals_doc_id_foreign` FOREIGN KEY (`doc_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `patient_medicals_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `patient_medicals_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `patient_medical_reports`;
CREATE TABLE `patient_medical_reports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` bigint(20) unsigned NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_medical_reports_patient_id_foreign` (`patient_id`),
  CONSTRAINT `patient_medical_reports_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `patient_personal_histories`;
CREATE TABLE `patient_personal_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` bigint(20) unsigned NOT NULL,
  `disease` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diagnosis_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `medicines` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_personal_histories_patient_id_foreign` (`patient_id`),
  CONSTRAINT `patient_personal_histories_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `patient_travel_histories`;
CREATE TABLE `patient_travel_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` bigint(20) unsigned NOT NULL,
  `destination` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_travel_histories_patient_id_foreign` (`patient_id`),
  CONSTRAINT `patient_travel_histories_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1,	'create-users',	'Create Users',	'Create Users',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(2,	'read-users',	'Read Users',	'Read Users',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(3,	'update-users',	'Update Users',	'Update Users',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(4,	'delete-users',	'Delete Users',	'Delete Users',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(5,	'create-roles',	'Create Roles',	'Create Roles',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(6,	'read-roles',	'Read Roles',	'Read Roles',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(7,	'update-roles',	'Update Roles',	'Update Roles',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(8,	'delete-roles',	'Delete Roles',	'Delete Roles',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(9,	'create-doctors',	'Create Doctors',	'Create Doctors',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(10,	'read-doctors',	'Read Doctors',	'Read Doctors',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(11,	'update-doctors',	'Update Doctors',	'Update Doctors',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(12,	'delete-doctors',	'Delete Doctors',	'Delete Doctors',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(13,	'create-patients',	'Create Patients',	'Create Patients',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(14,	'read-patients',	'Read Patients',	'Read Patients',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(15,	'update-patients',	'Update Patients',	'Update Patients',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(16,	'delete-patients',	'Delete Patients',	'Delete Patients',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(17,	'create-firstaids',	'Create Firstaids',	'Create Firstaids',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(18,	'read-firstaids',	'Read Firstaids',	'Read Firstaids',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(19,	'update-firstaids',	'Update Firstaids',	'Update Firstaids',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(20,	'delete-firstaids',	'Delete Firstaids',	'Delete Firstaids',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(21,	'create-firstaidchildren',	'Create Firstaidchildren',	'Create Firstaidchildren',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(22,	'read-firstaidchildren',	'Read Firstaidchildren',	'Read Firstaidchildren',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(23,	'update-firstaidchildren',	'Update Firstaidchildren',	'Update Firstaidchildren',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(24,	'delete-firstaidchildren',	'Delete Firstaidchildren',	'Delete Firstaidchildren',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(25,	'create-emergencs',	'Create Emergencs',	'Create Emergencs',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(26,	'read-emergencs',	'Read Emergencs',	'Read Emergencs',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(27,	'update-emergencs',	'Update Emergencs',	'Update Emergencs',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(28,	'delete-emergencs',	'Delete Emergencs',	'Delete Emergencs',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(29,	'create-emergencchildren',	'Create Emergencchildren',	'Create Emergencchildren',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(30,	'read-emergencchildren',	'Read Emergencchildren',	'Read Emergencchildren',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(31,	'update-emergencchildren',	'Update Emergencchildren',	'Update Emergencchildren',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(32,	'delete-emergencchildren',	'Delete Emergencchildren',	'Delete Emergencchildren',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(33,	'create-logoutdoctors',	'Create Logoutdoctors',	'Create Logoutdoctors',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(34,	'read-logoutdoctors',	'Read Logoutdoctors',	'Read Logoutdoctors',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(35,	'update-logoutdoctors',	'Update Logoutdoctors',	'Update Logoutdoctors',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(36,	'delete-logoutdoctors',	'Delete Logoutdoctors',	'Delete Logoutdoctors',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(37,	'create-logoutpatients',	'Create Logoutpatients',	'Create Logoutpatients',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(38,	'read-logoutpatients',	'Read Logoutpatients',	'Read Logoutpatients',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(39,	'update-logoutpatients',	'Update Logoutpatients',	'Update Logoutpatients',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(40,	'delete-logoutpatients',	'Delete Logoutpatients',	'Delete Logoutpatients',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10');

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1,	1),
(2,	1),
(3,	1),
(4,	1),
(5,	1),
(6,	1),
(7,	1),
(8,	1),
(9,	1),
(10,	1),
(11,	1),
(12,	1),
(13,	1),
(14,	1),
(15,	1),
(16,	1),
(17,	1),
(17,	2),
(18,	1),
(18,	2),
(19,	1),
(19,	2),
(20,	1),
(20,	2),
(21,	1),
(21,	2),
(22,	1),
(22,	2),
(23,	1),
(23,	2),
(24,	1),
(24,	2),
(25,	1),
(25,	2),
(26,	1),
(26,	2),
(27,	1),
(27,	2),
(28,	1),
(28,	2),
(29,	1),
(29,	2),
(30,	1),
(30,	2),
(31,	1),
(31,	2),
(32,	1),
(32,	2),
(33,	1),
(34,	1),
(35,	1),
(36,	1),
(37,	1),
(38,	1),
(39,	1),
(40,	1);

DROP TABLE IF EXISTS `permission_user`;
CREATE TABLE `permission_user` (
  `permission_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  KEY `permission_user_permission_id_foreign` (`permission_id`),
  CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1,	'super',	'Super',	'Super',	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(2,	'user',	'User',	'user',	'2022-01-06 19:45:17',	'2022-01-06 19:45:17');

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `role_user` (`role_id`, `user_id`, `user_type`) VALUES
(1,	1,	'App\\User'),
(2,	3,	'App\\User');

DROP TABLE IF EXISTS `specials`;
CREATE TABLE `specials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_unique` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `address`, `email_verified_at`, `password`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1,	'Super',	'super@eg.com',	NULL,	NULL,	NULL,	'$2y$10$x7eoUjA7p8bO.eNW17q4x.Q/QHswE8Xk369L6MZY8ETdujfDlJM6y',	NULL,	NULL,	'2022-01-03 17:47:10',	'2022-01-03 17:47:10'),
(3,	'mohammed',	'mohammed@gmail.com',	'01242648954',	'Cairo',	NULL,	'$2y$10$1YQwPnQ.stHw4seWV/As0Oq6Fzl69bR6pby0nZ6yW31ojs6c0vm2q',	'6544751641498345.png',	NULL,	'2022-01-06 19:44:25',	'2022-01-06 19:45:45');

-- 2022-01-10 22:46:58
