// import 'package:flutter/material.dart';
// import 'package:translation_app/routes/route_constants.dart';
//
// import '../../db/form/table.dart';
//
//
// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     final args = settings.arguments;
//     switch (settings.name) {
//       case Routes.initial:
//         return MaterialPageRoute(
//           builder: (_) => const SplashScreen(),
//         );
//       case Routes.signIn:
//         return MaterialPageRoute(
//           builder: (_) => const SignInScreen(),
//         );
//       case Routes.home:
//         return MaterialPageRoute(
//           builder: (_) => const HomeScreen(),
//         );
//       case Routes.blankForm:
//         return MaterialPageRoute(
//           builder: (_) => const BlankFormScreen(),
//         );
//       case Routes.editForm:
//         return MaterialPageRoute(
//           builder: (_) => const EditFormScreen(),
//         );
//       case Routes.savedForm:
//         return MaterialPageRoute(
//           builder: (_) => const SavedFormScreen(),
//         );
//       case Routes.dynamicForm:
//         args as Map<String, dynamic>;
//         return MaterialPageRoute(
//           builder: (_) => DynamicFormPage(
//             formId: args['form_id'] as int?,
//             monitoringId: args['monitoring_id'] as int?,
//           ),
//         );
//       case Routes.barcodeScanner:
//         return MaterialPageRoute(
//           builder: (_) => const BarcodeScannerScreen(),
//         );
//       case Routes.forgetPass:
//         return MaterialPageRoute(
//           builder: (_) => const ForgetPassScreen(),
//         );
//       case Routes.allPlans:
//         args as Map<String, dynamic>?;
//         return MaterialPageRoute(
//           builder: (_) => PlanListScreen(success: (args?['success'] as bool)),
//         );
//       case Routes.syncCheckList:
//         return MaterialPageRoute(
//           builder: (_) => const SyncScreen(),
//         );
//       case Routes.planDetail:
//         args as Map<String, dynamic>;
//         return MaterialPageRoute(
//           builder: (_) => PlanDetail(
//             planItem: args['planItem'] as FormTable?,
//             planId: args['planId'] as String,
//             planType: args['planType'] as String,
//             planDate: args['planDate'] as String?,
//             facilityType: args['facilityType'] as String?,
//           ),
//         );
//
//       case Routes.addPlan:
//         //args as Map<String, dynamic>;
//         final args = settings.arguments as Map<String, dynamic>?;
//         return MaterialPageRoute(
//           builder: (_) => AddPlanScreen(
//             index: args?['index'] as int?,
//             planItem: args?['planItem'] as Plan?,
//             planId: args?['planId'] as String?,
//             planDate: args?['planDate'] as String?,
//             facilityType: args?['facilityType'] as String?,
//             isEdit: args?['isEdit'] as bool? ?? false,
//             isEditVisited: args?['isEditVisited'] as bool? ?? false,
//           ),
//         );
//       case Routes.approvedPlans:
//         return MaterialPageRoute(builder: (_) {
//           return ApprovedPlansScreen();
//         });
//       case Routes.plansApproval:
//         return MaterialPageRoute(builder: (_) {
//           return PlansApprovalScreen();
//         });
//
//       default:
//         return _errorRoute();
//     }
//   }
//
//   static Route<dynamic> _errorRoute() {
//     return MaterialPageRoute(builder: (_) {
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text('Error'),
//         ),
//         body: const Center(
//           child: Text('ERROR'),
//         ),
//       );
//     });
//   }
// }
