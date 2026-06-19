// ============================================================
// APP CONFIG — ServeDesk
// ============================================================
// Single source of truth for every design token in the app.
// Change a value here → it applies everywhere automatically.
//
// Sections:
//   1.  AppColors         — colors & gradients
//   2.  AppSpacing        — spacing scale
//   3.  AppRadius         — border radius scale
//   4.  AppTextStyles     — typography (Inter via Google Fonts)
//   5.  AppButtonStyles   — button decorations & ButtonStyle objects
//   6.  AppInputStyles    — InputDecoration helper
//   7.  AppCardStyles     — card BoxDecoration variants
//   8.  AppShadows        — reusable BoxShadow presets
//   9.  AppBadgeData      — badge data model
//   10. AppBadgeStyles    — booking status & online/offline badge tokens
//   11. AppAnimations     — durations & curves
//   12. AppIconSizes      — icon size scale
//   13. AppAvatarSizes    — avatar size scale
//   14. AppBottomSheetStyle — modal bottom sheet decoration
//   15. AppSnackBar       — success / error / info snack bars
//   16. AppOpacity        — opacity constants
//   17. AppBreakpoints    — responsive width thresholds
//   18. AppElevation      — material elevation scale
//   19. AppStrings        — app-wide constant strings
//   20. AppAssets         — asset path constants
//   21. AppTheme          — full MaterialApp ThemeData
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

// ─── 1. COLORS ───────────────────────────────────────────────────────────────

class AppColors {
  AppColors._();

  // ── Brand ──────────────────────────────────────────────────
  static const Color primary      = Color(0xFF4158D0); // main blue
  static const Color primaryLight = Color(0xFFEEF0FA); // kept for compat
  static const Color teal         = Color(0xFF4DD0E1); // accent cyan

  // ── Surfaces ───────────────────────────────────────────────
  static const Color background     = Color(0xFFEEF0FA); // app scaffold bg
  static const Color surface        = Color(0xFFFFFFFF); // card / sheet bg
  static const Color white          = Color(0xFFFFFFFF); // alias kept for compat
  static const Color surfaceVariant = Color(0xFFF5F6FF); // light tinted surface

  // ── Text ───────────────────────────────────────────────────
  static const Color textPrimary   = Color(0xFF0D0D2B);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textHint      = Color(0xFFADB5BD);
  static const Color textWhite     = Color(0xFFFFFFFF);

  // ── Semantic status ────────────────────────────────────────
  static const Color success   = Color(0xFF22C55E);
  static const Color successBg = Color(0xFFDCFCE7);
  static const Color error     = Color(0xFFEF4444);
  static const Color errorBg   = Color(0xFFFEE2E2);
  static const Color warning   = Color(0xFFF59E0B);
  static const Color warningBg = Color(0xFFFEF3C7);
  static const Color amber     = Color(0xFFF59E0B); // alias kept for compat

  // ── Online / offline ───────────────────────────────────────
  static const Color online   = Color(0xFF22C55E);
  static const Color onlineBg = Color(0xFFDCFCE7);

  // ── Booking status badge colours ───────────────────────────
  static const Color statusConfirmed  = Color(0xFF4158D0); // blue
  static const Color statusPending    = Color(0xFFF59E0B); // amber
  static const Color statusCompleted  = Color(0xFF22C55E); // green
  static const Color statusCancelled  = Color(0xFFEF4444); // red
  static const Color statusInProgress = Color(0xFF8B5CF6); // purple

  // ── Chrome ─────────────────────────────────────────────────
  static const Color border  = Color(0xFFE5E7EB);
  static const Color divider = Color(0xFFF3F4F6);

  // ── Gradients ──────────────────────────────────────────────
  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)],
  );

  static const LinearGradient headerGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFC8DCFF), Color(0xFFEEF0FA)],
  );

  static const LinearGradient avatarGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)],
  );

  static const LinearGradient cardHeaderGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)],
  );

  static const LinearGradient earningsCardGradient = cardHeaderGradient;

  static const LinearGradient darkButtonGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFF0D0D2B), Color(0xFF1A1A4B)],
  );

  // ── Card decoration (kept for backward compat) ─────────────
  static BoxDecoration get cardDecoration => BoxDecoration(
    color: surface,
    borderRadius: BorderRadius.circular(AppRadius.card),
    boxShadow: AppShadows.md,
  );
}

// ─── 2. SPACING ──────────────────────────────────────────────────────────────

class AppSpacing {
  AppSpacing._();

  // Base 4 px grid
  static const double xs   = 4;
  static const double sm   = 8;
  static const double md   = 12;
  static const double base = 16;
  static const double lg   = 20;
  static const double xl   = 24;
  static const double xxl  = 32;
  static const double xxxl = 48;

  /// Left/right padding applied on every screen
  static const double screenH = 20;

  /// Vertical gap between major page sections
  static const double sectionGap = 24;

  /// Vertical gap between list cards
  static const double cardGap = 12;

  /// Gap between a tightly coupled icon + label pair
  static const double itemGap = 8;
}

// ─── 3. BORDER RADIUS ────────────────────────────────────────────────────────

class AppRadius {
  AppRadius._();

  static const double xs  = 6;
  static const double sm  = 8;
  static const double md  = 12;
  static const double lg  = 16;
  static const double xl  = 20;
  static const double xxl = 24;

  /// Buttons
  static const double button = 14;

  /// Cards & sheets
  static const double card = 16;

  /// Text input fields
  static const double input = 14;

  /// Chip / pill badges
  static const double chip = 20;

  /// Circular avatars, FABs, toggles
  static const double circle = 999;
}

// ─── 4. TYPOGRAPHY ───────────────────────────────────────────────────────────

class AppTextStyles {
  AppTextStyles._();

  // ── Headings ──────────────────────────────────────────────
  static TextStyle get h1 => GoogleFonts.inter(
    fontSize: 28, fontWeight: FontWeight.w700,
    color: AppColors.textPrimary, letterSpacing: -0.5, height: 1.2,
  );
  static TextStyle get h2 => GoogleFonts.inter(
    fontSize: 22, fontWeight: FontWeight.w700,
    color: AppColors.textPrimary, letterSpacing: -0.3, height: 1.3,
  );
  static TextStyle get h3 => GoogleFonts.inter(
    fontSize: 18, fontWeight: FontWeight.w600,
    color: AppColors.textPrimary, height: 1.4,
  );
  static TextStyle get h4 => GoogleFonts.inter(
    fontSize: 16, fontWeight: FontWeight.w600,
    color: AppColors.textPrimary, height: 1.4,
  );

  // ── Body ──────────────────────────────────────────────────
  static TextStyle get bodyLg => GoogleFonts.inter(
    fontSize: 16, fontWeight: FontWeight.w400,
    color: AppColors.textPrimary, height: 1.5,
  );
  static TextStyle get body => GoogleFonts.inter(
    fontSize: 14, fontWeight: FontWeight.w400,
    color: AppColors.textPrimary, height: 1.5,
  );
  static TextStyle get bodySm => GoogleFonts.inter(
    fontSize: 12, fontWeight: FontWeight.w400,
    color: AppColors.textSecondary, height: 1.5,
  );

  // ── Labels / medium weight ────────────────────────────────
  static TextStyle get labelLg => GoogleFonts.inter(
    fontSize: 16, fontWeight: FontWeight.w500,
    color: AppColors.textPrimary, height: 1.4,
  );
  static TextStyle get label => GoogleFonts.inter(
    fontSize: 14, fontWeight: FontWeight.w500,
    color: AppColors.textPrimary, height: 1.4,
  );
  static TextStyle get labelSm => GoogleFonts.inter(
    fontSize: 12, fontWeight: FontWeight.w500,
    color: AppColors.textPrimary, height: 1.4,
  );

  // ── Supporting ────────────────────────────────────────────
  static TextStyle get caption => GoogleFonts.inter(
    fontSize: 11, fontWeight: FontWeight.w400,
    color: AppColors.textSecondary, height: 1.4,
  );
  static TextStyle get overline => GoogleFonts.inter(
    fontSize: 11, fontWeight: FontWeight.w600,
    color: AppColors.textSecondary, letterSpacing: 0.8, height: 1.4,
  );

  // ── Buttons ───────────────────────────────────────────────
  static TextStyle get buttonLg => GoogleFonts.inter(
    fontSize: 16, fontWeight: FontWeight.w600,
    color: AppColors.textWhite, letterSpacing: 0.2,
  );
  static TextStyle get buttonMd => GoogleFonts.inter(
    fontSize: 14, fontWeight: FontWeight.w600,
    color: AppColors.textWhite, letterSpacing: 0.2,
  );

  // ── Prices / amounts ──────────────────────────────────────
  static TextStyle get price => GoogleFonts.inter(
    fontSize: 18, fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );
  static TextStyle get priceLg => GoogleFonts.inter(
    fontSize: 28, fontWeight: FontWeight.w700,
    color: AppColors.textPrimary, letterSpacing: -0.5,
  );
  static TextStyle get priceXl => GoogleFonts.inter(
    fontSize: 36, fontWeight: FontWeight.w700,
    color: AppColors.textPrimary, letterSpacing: -1,
  );
}

// ─── 5. BUTTON STYLES ────────────────────────────────────────────────────────

class AppButtonStyles {
  AppButtonStyles._();

  // ── Heights ───────────────────────────────────────────────
  static const double heightLg = 56;
  static const double heightMd = 48;
  static const double heightSm = 40;

  // ── BoxDecoration (for custom gradient InkWell buttons) ───
  static BoxDecoration get primaryGradient => BoxDecoration(
    gradient: AppColors.buttonGradient,
    borderRadius: BorderRadius.circular(AppRadius.button),
    boxShadow: AppShadows.colored,
  );

  static BoxDecoration get dark => BoxDecoration(
    color: AppColors.textPrimary,
    borderRadius: BorderRadius.circular(AppRadius.button),
  );

  static BoxDecoration get outline => BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(AppRadius.button),
    border: Border.all(color: AppColors.border, width: 1.5),
  );

  static BoxDecoration get danger => BoxDecoration(
    color: AppColors.errorBg,
    borderRadius: BorderRadius.circular(AppRadius.button),
    border: Border.all(color: AppColors.error.withValues(alpha: 0.3), width: 1),
  );

  // ── ButtonStyle (for ElevatedButton / OutlinedButton / TextButton) ──
  static ButtonStyle get elevated => ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.textWhite,
    minimumSize: const Size(double.infinity, heightMd),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.button),
    ),
    elevation: 0,
    textStyle: AppTextStyles.buttonLg,
  );

  static ButtonStyle get elevatedSm => ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.textWhite,
    minimumSize: const Size(0, heightSm),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.button),
    ),
    elevation: 0,
    textStyle: AppTextStyles.buttonMd,
  );

  static ButtonStyle get outlinedStyle => OutlinedButton.styleFrom(
    foregroundColor: AppColors.textPrimary,
    side: const BorderSide(color: AppColors.border, width: 1.5),
    minimumSize: const Size(double.infinity, heightMd),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.button),
    ),
    elevation: 0,
    textStyle: AppTextStyles.buttonMd,
  );

  static ButtonStyle get textStyle => TextButton.styleFrom(
    foregroundColor: AppColors.primary,
    textStyle: AppTextStyles.label,
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.sm,
      vertical: AppSpacing.xs,
    ),
  );
}

// ─── 6. INPUT STYLES ─────────────────────────────────────────────────────────

class AppInputStyles {
  AppInputStyles._();

  /// Use in any TextField / TextFormField's `decoration:` parameter.
  static InputDecoration field({
    required String hint,
    Widget? prefix,
    Widget? suffix,
    String? label,
  }) =>
      InputDecoration(
        hintText: hint,
        labelText: label,
        prefixIcon: prefix,
        suffixIcon: suffix,
        hintStyle: AppTextStyles.body.copyWith(color: AppColors.textHint),
        labelStyle: AppTextStyles.label.copyWith(color: AppColors.textSecondary),
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.base,
          vertical: AppSpacing.md,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: const BorderSide(color: AppColors.error, width: 1.5),
        ),
      );
}

// ─── 7. CARD STYLES ──────────────────────────────────────────────────────────

class AppCardStyles {
  AppCardStyles._();

  /// Standard shadow card
  static BoxDecoration get card => BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(AppRadius.card),
    boxShadow: AppShadows.md,
  );

  /// Stronger shadow — use for modals or floating elements
  static BoxDecoration get cardElevated => BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(AppRadius.card),
    boxShadow: AppShadows.lg,
  );

  /// Border only, no shadow — use for list items inside a card
  static BoxDecoration get cardBordered => BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(AppRadius.card),
    border: Border.all(color: AppColors.border),
  );

  /// Blue border — use for the actively selected / checked card
  static BoxDecoration get cardSelected => BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(AppRadius.card),
    border: Border.all(color: AppColors.primary, width: 1.5),
  );
}

// ─── 8. SHADOWS ──────────────────────────────────────────────────────────────

class AppShadows {
  AppShadows._();

  /// Subtle — input fields, small chips
  static List<BoxShadow> get sm => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.04),
      blurRadius: 4,
      offset: const Offset(0, 1),
    ),
  ];

  /// Standard — cards, list items
  static List<BoxShadow> get md => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.06),
      blurRadius: 12,
      offset: const Offset(0, 2),
    ),
  ];

  /// Strong — modals, bottom sheets, floating elements
  static List<BoxShadow> get lg => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.10),
      blurRadius: 24,
      offset: const Offset(0, 8),
    ),
  ];

  /// Extra strong — dialogs, full-screen overlays
  static List<BoxShadow> get xl => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.16),
      blurRadius: 40,
      offset: const Offset(0, 16),
    ),
  ];

  /// Brand coloured shadow — primary gradient buttons
  static List<BoxShadow> get colored => [
    BoxShadow(
      color: AppColors.primary.withValues(alpha: 0.25),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];

  /// Teal coloured shadow — accent elements
  static List<BoxShadow> get teal => [
    BoxShadow(
      color: AppColors.teal.withValues(alpha: 0.30),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];
}

// ─── 9. BADGE DATA MODEL ─────────────────────────────────────────────────────

/// Holds the colours and label for a status badge.
/// Call [badge.toWidget()] to get a ready-made pill widget,
/// or use [badge.background] / [badge.textColor] in your own layout.
class AppBadgeData {
  final Color background;
  final Color textColor;
  final String label;

  const AppBadgeData({
    required this.background,
    required this.textColor,
    required this.label,
  });

  /// Returns a styled pill Container ready to drop into any widget tree.
  Widget toWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppRadius.chip),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: textColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: AppTextStyles.labelSm.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}

// ─── 10. BADGE STYLES ────────────────────────────────────────────────────────

/// Booking status and availability badge tokens.
/// Usage:
///   AppBadgeStyles.confirmed.toWidget()
///   — or —
///   color: AppBadgeStyles.pending.textColor
class AppBadgeStyles {
  AppBadgeStyles._();

  // ── Booking statuses ──────────────────────────────────────
  static const AppBadgeData confirmed = AppBadgeData(
    background: Color(0xFFEEF2FF),
    textColor: AppColors.statusConfirmed,
    label: 'Confirmed',
  );

  static const AppBadgeData pending = AppBadgeData(
    background: AppColors.warningBg,
    textColor: AppColors.statusPending,
    label: 'Pending',
  );

  static const AppBadgeData completed = AppBadgeData(
    background: AppColors.successBg,
    textColor: AppColors.statusCompleted,
    label: 'Completed',
  );

  static const AppBadgeData cancelled = AppBadgeData(
    background: AppColors.errorBg,
    textColor: AppColors.statusCancelled,
    label: 'Cancelled',
  );

  static const AppBadgeData inProgress = AppBadgeData(
    background: Color(0xFFF3E8FF),
    textColor: AppColors.statusInProgress,
    label: 'In progress',
  );

  // ── Availability ──────────────────────────────────────────
  static const AppBadgeData online = AppBadgeData(
    background: AppColors.onlineBg,
    textColor: AppColors.online,
    label: 'Online',
  );

  static const AppBadgeData offline = AppBadgeData(
    background: Color(0xFFF3F4F6),
    textColor: AppColors.textSecondary,
    label: 'Offline',
  );

  static const AppBadgeData busy = AppBadgeData(
    background: AppColors.warningBg,
    textColor: AppColors.warning,
    label: 'Busy',
  );

  // ── Verification ──────────────────────────────────────────
  static const AppBadgeData verified = AppBadgeData(
    background: AppColors.successBg,
    textColor: AppColors.success,
    label: 'Verified',
  );

  static const AppBadgeData verificationPending = AppBadgeData(
    background: AppColors.warningBg,
    textColor: AppColors.warning,
    label: 'Under review',
  );

  static const AppBadgeData rejected = AppBadgeData(
    background: AppColors.errorBg,
    textColor: AppColors.error,
    label: 'Rejected',
  );

  // ── Delivery mode ─────────────────────────────────────────
  static const AppBadgeData modeOnline = AppBadgeData(
    background: Color(0xFFEEF2FF),
    textColor: AppColors.primary,
    label: 'Online',
  );

  static const AppBadgeData modeOfficeVisit = AppBadgeData(
    background: Color(0xFFF3E8FF),
    textColor: AppColors.statusInProgress,
    label: 'Office visit',
  );

  static const AppBadgeData modeHomeVisit = AppBadgeData(
    background: AppColors.successBg,
    textColor: AppColors.success,
    label: 'Home visit',
  );

  /// Returns the badge data for any booking status string from the API.
  /// Falls back to [pending] for unknown values.
  static AppBadgeData fromStatus(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed':   return confirmed;
      case 'pending':     return pending;
      case 'completed':   return completed;
      case 'cancelled':   return cancelled;
      case 'in_progress':
      case 'inprogress':  return inProgress;
      default:            return pending;
    }
  }

  /// Returns the badge data for any delivery mode string from the API.
  static AppBadgeData fromDeliveryMode(String mode) {
    switch (mode.toLowerCase()) {
      case 'online':
      case 'external_link': return modeOnline;
      case 'office_visit':  return modeOfficeVisit;
      case 'home_visit':    return modeHomeVisit;
      default:              return modeOnline;
    }
  }
}

// ─── 11. ANIMATIONS ──────────────────────────────────────────────────────────

class AppAnimations {
  AppAnimations._();

  // ── Durations ─────────────────────────────────────────────
  /// Micro-interactions: tap ripple, toggle, checkbox
  static const Duration fast   = Duration(milliseconds: 150);

  /// Standard UI transitions: most buttons, list items fading in
  static const Duration normal = Duration(milliseconds: 250);

  /// Page-level transitions: screen slides, bottom sheet open
  static const Duration slow   = Duration(milliseconds: 350);

  /// Emphasis moments: booking confirmed, payment success
  static const Duration xSlow  = Duration(milliseconds: 500);

  /// Lottie / full-screen animations
  static const Duration splash  = Duration(milliseconds: 800);

  // ── Curves ────────────────────────────────────────────────
  /// Default — most transitions
  static const Curve standard = Curves.easeInOut;

  /// Screen / element entering from off-screen
  static const Curve enter    = Curves.easeOut;

  /// Screen / element leaving the viewport
  static const Curve exit     = Curves.easeIn;

  /// Bouncy — success confirmations, added-to-cart
  static const Curve spring   = Curves.elasticOut;

  /// Smooth deceleration — bottom sheets sliding up
  static const Curve decel    = Curves.decelerate;

  /// Sharp snap — toggles, checkboxes
  static const Curve sharp    = Curves.easeInOutCubic;
}

// ─── 12. ICON SIZES ──────────────────────────────────────────────────────────

class AppIconSizes {
  AppIconSizes._();

  /// Inline icons inside dense text, badge dots
  static const double xs  = 12;

  /// Small list row icons, trailing arrows
  static const double sm  = 16;

  /// Nav bar icons, input prefix/suffix icons
  static const double md  = 20;

  /// Standard action icons, tab bar icons
  static const double lg  = 24;

  /// Feature section icons, card leading icons
  static const double xl  = 32;

  /// Empty-state illustrations, hero icons
  static const double xxl = 48;

  /// Full onboarding / success screen icons
  static const double xxxl = 80;
}

// ─── 13. AVATAR SIZES ────────────────────────────────────────────────────────

class AppAvatarSizes {
  AppAvatarSizes._();

  /// Compact rows — chat list, notification items
  static const double sm  = 32;

  /// Standard list cards — booking cards, request cards
  static const double md  = 44;

  /// Booking detail header — professional row in booking
  static const double lg  = 56;

  /// Profile hero — professional profile screen
  static const double xl  = 80;

  /// Onboarding / rate screen — large centered avatar
  static const double xxl = 100;
}

// ─── 14. BOTTOM SHEET STYLE ──────────────────────────────────────────────────

class AppBottomSheetStyle {
  AppBottomSheetStyle._();

  /// Decoration for all modal bottom sheets (cancel modal,
  /// decline reason, go-offline confirm, share meeting link, etc.)
  static BoxDecoration get decoration => BoxDecoration(
    color: AppColors.surface,
    borderRadius: const BorderRadius.vertical(
      top: Radius.circular(AppRadius.xxl),
    ),
    boxShadow: AppShadows.xl,
  );

  /// Content padding — apply inside every bottom sheet body
  static const EdgeInsets padding =
      EdgeInsets.fromLTRB(AppSpacing.screenH, AppSpacing.lg, AppSpacing.screenH, 36);

  /// Drag handle dimensions
  static const double handleWidth  = 40;
  static const double handleHeight = 4;

  /// Colour of the drag handle pill
  static const Color handleColor = AppColors.border;

  /// Builds the standard drag handle widget
  static Widget get handle => Center(
    child: Container(
      width: handleWidth,
      height: handleHeight,
      margin: const EdgeInsets.only(top: AppSpacing.md, bottom: AppSpacing.lg),
      decoration: BoxDecoration(
        color: handleColor,
        borderRadius: BorderRadius.circular(AppRadius.circle),
      ),
    ),
  );
}

// ─── 15. SNACK BAR ───────────────────────────────────────────────────────────

/// Usage:
///   ScaffoldMessenger.of(context).showSnackBar(AppSnackBar.success('Booking confirmed!'));
class AppSnackBar {
  AppSnackBar._();

  static SnackBar success(String message) => _build(
    message: message,
    background: AppColors.success,
    icon: Icons.check_circle_outline_rounded,
  );

  static SnackBar error(String message) => _build(
    message: message,
    background: AppColors.error,
    icon: Icons.error_outline_rounded,
  );

  static SnackBar info(String message) => _build(
    message: message,
    background: AppColors.primary,
    icon: Icons.info_outline_rounded,
  );

  static SnackBar warning(String message) => _build(
    message: message,
    background: AppColors.warning,
    icon: Icons.warning_amber_rounded,
  );

  static SnackBar _build({
    required String message,
    required Color background,
    required IconData icon,
  }) {
    return SnackBar(
      content: Row(
        children: [
          Icon(icon, color: AppColors.textWhite, size: AppIconSizes.md),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              message,
              style: AppTextStyles.label.copyWith(color: AppColors.textWhite),
            ),
          ),
        ],
      ),
      backgroundColor: background,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      margin: const EdgeInsets.all(AppSpacing.base),
      duration: AppAnimations.xSlow,
    );
  }
}

// ─── 16. OPACITY ─────────────────────────────────────────────────────────────

class AppOpacity {
  AppOpacity._();

  /// Disabled buttons, greyed-out list items
  static const double disabled  = 0.40;

  /// Overlay on photos / cards
  static const double overlay   = 0.50;

  /// Hover / pressed state tint
  static const double hover     = 0.08;

  /// Subtle background tint (selected chip bg, etc.)
  static const double tint      = 0.12;

  /// Skeleton / shimmer loading placeholder
  static const double skeleton  = 0.15;

  /// Dividers, border lines
  static const double divider   = 0.20;

  /// Inactive nav icon
  static const double inactive  = 0.45;
}

// ─── 17. BREAKPOINTS ─────────────────────────────────────────────────────────

class AppBreakpoints {
  AppBreakpoints._();

  /// Small phones — < 360 px wide
  static const double xs = 360;

  /// Standard phones — 360–480 px (most Android/iOS)
  static const double sm = 480;

  /// Large phones / small tablets — 480–768 px
  static const double md = 768;

  /// Tablets — 768–1024 px
  static const double lg = 1024;

  /// Desktops / large tablets — ≥ 1024 px
  static const double xl = 1280;

  /// Returns true when the screen is wider than [md] (tablet+)
  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= md;

  /// Returns true when the screen is a small phone (< [xs])
  static bool isSmallPhone(BuildContext context) =>
      MediaQuery.sizeOf(context).width < xs;
}

// ─── 18. ELEVATION ───────────────────────────────────────────────────────────

class AppElevation {
  AppElevation._();

  /// Flat — cards sitting on background
  static const double none   = 0;

  /// Slight lift — active cards, selected items
  static const double low    = 1;

  /// Standard — nav bar, app bar
  static const double medium = 4;

  /// Raised — bottom sheets, dialogs
  static const double high   = 8;

  /// Highest — full-screen overlays
  static const double xHigh  = 16;
}

// ─── 19. STRINGS ─────────────────────────────────────────────────────────────

class AppStrings {
  AppStrings._();

  // ── App identity ──────────────────────────────────────────
  static const String appName        = 'ServeDesk';
  static const String appTagline     = 'Book verified experts, instantly.';
  static const String supportEmail   = 'support@servedesk.in';
  static const String supportPhone   = '+91 98765 00000';

  // ── Common actions ────────────────────────────────────────
  static const String continueLabel  = 'Continue';
  static const String saveChanges    = 'Save changes';
  static const String cancel         = 'Cancel';
  static const String confirm        = 'Confirm';
  static const String goBack         = 'Go back';
  static const String retry          = 'Retry';
  static const String done           = 'Done';
  static const String edit           = 'Edit';
  static const String submit         = 'Submit';
  static const String apply          = 'Apply';
  static const String viewAll        = 'View all';
  static const String seeAll         = 'See all';
  static const String skip           = 'Skip';

  // ── Auth ──────────────────────────────────────────────────
  static const String sendOtp        = 'Send OTP';
  static const String verifyOtp      = 'Verify & continue';
  static const String otpHint        = 'We\'ll send a 6-digit code to verify your number. Standard SMS rates may apply.';
  static const String resendOtp      = 'Resend OTP';

  // ── Booking ───────────────────────────────────────────────
  static const String bookNow        = 'Book now';
  static const String proceedToPay   = 'Proceed to payment';
  static const String startJob       = 'Start job';
  static const String markComplete   = 'Mark as complete';
  static const String acceptBooking  = 'Accept';
  static const String declineBooking = 'Decline';
  static const String cancelBooking  = 'Cancel booking';
  static const String shareLink      = 'Share meeting link';
  static const String joinMeeting    = 'Join meeting';

  // ── Payments ──────────────────────────────────────────────
  static const String paySecurely    = 'Pay securely';
  static const String requestPayout  = 'Request payout';
  static const String couponHint     = 'Enter coupon code';
  static const String payoutNote     = 'Payouts are processed within 2–3 business days.';

  // ── Empty states ──────────────────────────────────────────
  static const String noBookings     = 'No bookings yet';
  static const String noNotifications = 'You\'re all caught up!';
  static const String noResults      = 'No results found';

  // ── Legal ─────────────────────────────────────────────────
  static const String termsLabel     = 'Terms';
  static const String privacyLabel   = 'Privacy Policy';
  static const String termsNote      = 'By continuing you agree to our';
}

// ─── 20. ASSETS ──────────────────────────────────────────────────────────────

/// All asset paths in one place.
/// Add the paths to pubspec.yaml flutter.assets section before using them.
class AppAssets {
  AppAssets._();

  // ── Images ────────────────────────────────────────────────
  static const String logo             = 'assets/images/logo.png';
  static const String logoWhite        = 'assets/images/logo_white.png';
  static const String placeholder      = 'assets/images/placeholder.png';
  static const String avatarPlaceholder= 'assets/images/avatar_placeholder.png';

  // ── Onboarding slides ─────────────────────────────────────
  static const String onboarding1      = 'assets/images/onboarding_1.png';
  static const String onboarding2      = 'assets/images/onboarding_2.png';
  static const String onboarding3      = 'assets/images/onboarding_3.png';

  // ── Empty states ──────────────────────────────────────────
  static const String emptyBookings    = 'assets/images/empty_bookings.png';
  static const String emptySearch      = 'assets/images/empty_search.png';
  static const String emptyNotifications = 'assets/images/empty_notifications.png';

  // ── Lottie animations ─────────────────────────────────────
  static const String successAnim      = 'assets/animations/success.json';
  static const String loadingAnim      = 'assets/animations/loading.json';
  static const String emptyAnim        = 'assets/animations/empty.json';
  static const String confettiAnim     = 'assets/animations/confetti.json';
}

// ─── 21. THEME DATA ──────────────────────────────────────────────────────────

class AppTheme {
  AppTheme._();

  static ThemeData get theme => ThemeData(
    useMaterial3: true,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
      primary: AppColors.primary,
      secondary: AppColors.teal,
      surface: AppColors.surface,
      error: AppColors.error,
    ),

    scaffoldBackgroundColor: AppColors.background,

    // Font — Inter replaces default Roboto
    fontFamily: GoogleFonts.inter().fontFamily,
    textTheme: GoogleFonts.interTextTheme().copyWith(
      displayLarge:  AppTextStyles.h1,
      displayMedium: AppTextStyles.h2,
      titleLarge:    AppTextStyles.h3,
      titleMedium:   AppTextStyles.h4,
      bodyLarge:     AppTextStyles.bodyLg,
      bodyMedium:    AppTextStyles.body,
      bodySmall:     AppTextStyles.bodySm,
      labelLarge:    AppTextStyles.labelLg,
      labelMedium:   AppTextStyles.label,
      labelSmall:    AppTextStyles.labelSm,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: AppElevation.none,
      scrolledUnderElevation: AppElevation.none,
      centerTitle: false,
      titleTextStyle: AppTextStyles.h3,
      iconTheme: const IconThemeData(color: AppColors.textPrimary),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppButtonStyles.elevated,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: AppButtonStyles.outlinedStyle,
    ),
    textButtonTheme: TextButtonThemeData(
      style: AppButtonStyles.textStyle,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      hintStyle: AppTextStyles.body.copyWith(color: AppColors.textHint),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.base,
        vertical: AppSpacing.md,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        borderSide: const BorderSide(color: AppColors.error),
      ),
    ),

    dividerTheme: const DividerThemeData(
      color: AppColors.divider,
      thickness: 1,
      space: 0,
    ),

    chipTheme: ChipThemeData(
      backgroundColor: AppColors.surfaceVariant,
      selectedColor: AppColors.primary.withValues(alpha: AppOpacity.tint),
      labelStyle: AppTextStyles.labelSm,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.chip),
      ),
      side: BorderSide.none,
    ),

    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? AppColors.white
            : AppColors.textHint,
      ),
      trackColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? AppColors.primary
            : AppColors.border,
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.surface,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
      selectedLabelStyle: AppTextStyles.caption.copyWith(
        color: AppColors.primary,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: AppTextStyles.caption,
      type: BottomNavigationBarType.fixed,
      elevation: AppElevation.high,
    ),

    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
    ),

    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS:     CupertinoPageTransitionsBuilder(),
        TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}
