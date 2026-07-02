# Clientenx

A Flutter app that connects customers with verified service professionals (CAs, lawyers, doctors, consultants, designers, tech experts) for on-demand bookings — online or in-person.

---

## Table of Contents

1. [Tech Stack](#tech-stack)
2. [Project Structure](#project-structure)
3. [App Entry & Navigation Shell](#app-entry--navigation-shell)
4. [Customer Flow](#customer-flow)
5. [Professional Flow](#professional-flow)
6. [Screen Descriptions](#screen-descriptions)
7. [Design System](#design-system)
8. [Key Logic & Patterns](#key-logic--patterns)

---

## Tech Stack

| Layer | Choice |
|---|---|
| Framework | Flutter (Dart) |
| UI system | Material Design 3 (`useMaterial3: true`) |
| Typography | Inter via `google_fonts` |
| State | `StatefulWidget` + `setState` (local state only) |
| Navigation | `Navigator.push` / `MaterialPageRoute` |
| Theme | Centralised tokens in `lib/core/app_config.dart` |

---

## Project Structure

```
lib/
├── main.dart                          # App entry point
├── core/
│   ├── app_config.dart                # All design tokens (colors, spacing, typography, theme)
│   └── app_colors.dart                # Color constants (alias file)
├── widgets/
│   └── gradient_button.dart           # Reusable gradient CTA button
└── screens/
    ├── splash_screen.dart             # Branded splash → Onboarding
    ├── onboarding/
    │   └── onboarding_screen.dart     # 3-slide feature walkthrough → Login
    ├── auth/
    │   ├── login_screen.dart          # Phone number entry
    │   ├── otp_screen.dart            # 6-digit OTP verification
    │   └── profile_setup_screen.dart  # Name + profile photo after first login
    ├── customer/
    │   ├── customer_shell.dart        # Bottom nav shell (4 tabs)
    │   ├── home/
    │   │   ├── customer_home_screen.dart     # Home feed with promo slider
    │   │   ├── category_screen.dart          # Category services with filter chips
    │   │   ├── service_detail_screen.dart    # Service detail + experts offering it
    │   │   ├── search_screen.dart            # Search with Expert / Service / Rating tabs
    │   │   ├── location_picker_screen.dart   # Location selection
    │   │   └── search_filters_screen.dart    # Advanced search filters
    │   ├── experts/
    │   │   └── expert_profile_screen.dart    # Expert bio, reviews, booking CTA
    │   ├── booking/
    │   │   ├── book_appointment_screen.dart  # Date + time slot selection
    │   │   ├── upload_documents_screen.dart  # Document upload (Step 2 of 3)
    │   │   ├── confirm_booking_screen.dart   # Order summary (Step 3 of 3)
    │   │   ├── payment_screen.dart           # Payment method selection
    │   │   ├── booking_confirmed_screen.dart # Success confirmation
    │   │   └── payment_failed_screen.dart    # Payment failure + retry
    │   ├── bookings/
    │   │   ├── customer_bookings_screen.dart      # My bookings (Upcoming / Completed / Cancelled)
    │   │   ├── customer_booking_detail_screen.dart # Booking detail + actions
    │   │   ├── reschedule_booking_screen.dart      # Date + time slot reschedule
    │   │   ├── cancel_booking_screen.dart          # Cancel with reason
    │   │   └── meeting_link_screen.dart            # Join video meeting
    │   ├── alerts/
    │   │   └── alerts_screen.dart            # Notifications list
    │   ├── chat/
    │   │   └── customer_chat_screen.dart     # In-app chat with expert
    │   ├── review/
    │   │   ├── rate_expert_screen.dart       # Star rating + comment
    │   │   └── review_success_screen.dart    # Thank you after review
    │   └── profile/
    │       ├── customer_profile_screen.dart          # Profile menu
    │       ├── edit_profile_screen.dart              # Edit name, email, phone
    │       ├── saved_experts_screen.dart             # Bookmarked experts
    │       ├── saved_addresses_screen.dart           # Saved locations
    │       ├── add_address_screen.dart               # Add/edit an address
    │       ├── payment_methods_screen.dart           # Saved cards & UPI
    │       ├── add_payment_method_screen.dart        # Add card or UPI
    │       ├── notification_preferences_screen.dart  # Push / SMS toggles
    │       ├── privacy_security_screen.dart          # Password, 2FA, delete account
    │       └── help_support_screen.dart              # FAQs + contact options
    └── pro/
        ├── pro_shell.dart             # Bottom nav shell (5 tabs)
        ├── home/
        │   └── pro_home_screen.dart   # Dashboard: stats, requests, schedule
        ├── requests/
        │   └── requests_screen.dart   # Incoming booking requests
        ├── booking/
        │   └── booking_detail_screen.dart  # Booking detail + start job
        ├── schedule/
        │   └── schedule_screen.dart   # Calendar view of upcoming sessions
        ├── chat/
        │   └── chat_screen.dart       # In-app chat with customer
        ├── earnings/
        │   ├── earnings_screen.dart   # Earnings overview + transactions
        │   ├── payout_screen.dart     # Request payout flow
        │   └── payout_settings_screen.dart  # Manage bank / UPI accounts
        ├── notifications/
        │   └── notifications_screen.dart  # Pro notifications
        ├── profile/
        │   ├── profile_screen.dart         # Pro profile menu
        │   ├── edit_profile_screen.dart    # Edit bio, title, languages, phone
        │   ├── my_services_screen.dart     # Toggle active services + set prices
        │   ├── availability_screen.dart    # Set working hours per day
        │   ├── my_reviews_screen.dart      # Rating summary + review cards + reply
        │   └── help_support_screen.dart    # Pro-specific FAQs + support
        └── onboarding/
            ├── become_expert_screen.dart         # Registration form for new pros
            ├── verification_pending_screen.dart  # Waiting for KYC review
            └── verification_rejected_screen.dart # Rejection with fix instructions
```

---

## App Entry & Navigation Shell

```
SplashScreen
    └── OnboardingScreen (3 slides)
            └── LoginScreen (phone number)
                    └── OtpScreen (6-digit verify)
                            └── ProfileSetupScreen (first login only)
                                    ├── CustomerShell  (customer mode)
                                    └── ProShell       (pro mode, via BecomeExpertScreen)
```

### CustomerShell — 4-tab bottom nav

| Tab | Screen | Description |
|-----|--------|-------------|
| 0 | Home | Discovery feed |
| 1 | Bookings | My bookings list |
| 2 | Alerts | Notification centre |
| 3 | Profile | Account settings |

### ProShell — 5-tab bottom nav

| Tab | Screen | Description |
|-----|--------|-------------|
| 0 | Home | Dashboard |
| 1 | Requests | Incoming booking requests |
| 2 | Schedule | Calendar |
| 3 | Earnings | Revenue + payouts |
| 4 | Profile | Account + services |

Both shells use `IndexedStack` so each tab preserves its scroll position between switches.

---

## Customer Flow

### 1. Discovery

```
CustomerHomeScreen
    ├── Promo slider (3 promotional banners — swipeable PageView)
    ├── Categories grid (6 categories)
    │       └── CategoryScreen (category: 'Legal' / 'Health' / etc.)
    │               └── ServiceDetailScreen
    │                       └── ExpertProfileScreen
    │                               └── BookAppointmentScreen
    ├── Featured experts (horizontal scroll)
    │       └── ExpertProfileScreen
    ├── Popular services
    │       └── ServiceDetailScreen
    └── Search bar → SearchScreen
```

### 2. Search

```
SearchScreen
    ├── Live TextField with autofocus
    ├── Tab: All → experts + services
    ├── Tab: Experts → expert cards → ExpertProfileScreen
    ├── Tab: Services → service cards → ServiceDetailScreen
    └── Tab: 4.5★ → high-rated experts only
```

### 3. Booking (3-step wizard)

```
BookAppointmentScreen  (Step 1 — date & time)
    └── UploadDocumentsScreen  (Step 2 — attach files)
            └── ConfirmBookingScreen  (Step 3 — order summary)
                    └── PaymentScreen
                            ├── BookingConfirmedScreen  ✓
                            └── PaymentFailedScreen     ✗
```

### 4. Booking Management

```
CustomerBookingsScreen
    ├── Upcoming tab → CustomerBookingDetailScreen
    │       ├── Reschedule → RescheduleBookingScreen
    │       │       └── Date chip + time slot grid → confirm
    │       ├── Cancel → CancelBookingScreen (reason selection)
    │       ├── Message expert → CustomerChatScreen
    │       └── Meeting link → MeetingLinkScreen
    ├── Completed tab → RateExpertScreen → ReviewSuccessScreen
    └── Cancelled tab → CustomerBookingDetailScreen (read-only)
```

### 5. Notifications

```
AlertsScreen
    ├── Booking confirmed → CustomerBookingDetailScreen
    ├── New message → CustomerChatScreen
    ├── Payment receipt → SnackBar
    └── Rate your expert → RateExpertScreen
```

### 6. Profile

```
CustomerProfileScreen
    ├── Edit profile → EditProfileScreen
    ├── Saved experts → SavedExpertsScreen
    ├── Saved addresses → SavedAddressesScreen → AddAddressScreen
    ├── Payment methods → PaymentMethodsScreen → AddPaymentMethodScreen
    ├── Notification preferences → NotificationPreferencesScreen
    ├── Privacy & security → PrivacySecurityScreen
    ├── Help & support → CustomerHelpSupportScreen
    ├── Switch to professional → ProShell
    └── Log out → OnboardingScreen
```

---

## Professional Flow

### 1. Onboarding (new pro)

```
BecomeExpertScreen (registration form)
    └── VerificationPendingScreen (KYC under review)
            ├── Approved → ProShell
            └── Rejected → VerificationRejectedScreen
                    └── Contact support / Reapply
```

### 2. Home Dashboard

```
ProHomeScreen
    ├── Online/Offline toggle (Switch → updates status dot + subtitle)
    ├── Stats row (today's bookings, monthly earnings, rating)
    ├── New requests card
    │       ├── Accept → BookingDetailScreen
    │       └── Decline → SnackBar
    └── Today's schedule
            ├── View all → ScheduleScreen
            └── Tap session → BookingDetailScreen
```

### 3. Requests

```
RequestsScreen
    └── _RequestCard (per request)
            ├── Accept → BookingDetailScreen
            └── Decline → SnackBar
```

### 4. Booking Detail (Pro)

```
BookingDetailScreen
    ├── Customer card → ChatScreen (message icon)
    ├── Service details row
    ├── Customer documents
    ├── Share meeting link → SnackBar (copy to clipboard)
    └── Start job → SnackBar
```

### 5. Earnings

```
EarningsScreen
    ├── Balance card → PayoutScreen (request payout)
    ├── Stats (this month, total)
    └── Transactions list
            └── Export → SnackBar
```

### 6. Profile

```
ProfileScreen
    ├── Edit profile → ProEditProfileScreen
    │       (name, profession title, bio, phone, languages)
    ├── My services → MyServicesScreen
    │       (toggle services on/off, set own price)
    │       └── + button → SnackBar (add service coming soon)
    ├── Availability → AvailabilityScreen
    ├── My reviews → MyReviewsScreen
    │       (rating summary, review cards, inline reply form)
    ├── Payout settings → PayoutSettingsScreen
    │       (manage bank/UPI, set default, add new)
    ├── Help & support → ProHelpSupportScreen
    ├── Switch to customer → CustomerShell
    └── Log out → OnboardingScreen
```

---

## Screen Descriptions

### Shared / Auth

| Screen | File | Description |
|--------|------|-------------|
| Splash | `splash_screen.dart` | Branded screen with "clientenx" name, auto-navigates after 2 s |
| Onboarding | `onboarding_screen.dart` | 3-page `PageView` walkthrough (Find expert → Book → Trusted pros) |
| Login | `login_screen.dart` | Phone number entry with country code |
| OTP | `otp_screen.dart` | 6 individual `TextField` boxes, digits-only, auto-advance on fill |
| Profile Setup | `profile_setup_screen.dart` | Name + avatar for new users |

### Customer — Home

| Screen | File | Description |
|--------|------|-------------|
| Home | `customer_home_screen.dart` | Greeting header, search bar, promo slider (3 cards, dot indicator), 6-category grid, featured experts horizontal scroll, popular services |
| Category | `category_screen.dart` | Data-driven: category passed as param; each of 6 categories shows its own services with 5 filter chips (All / Popular / Online / In-person / Top rated) |
| Service Detail | `service_detail_screen.dart` | Service icon, description, pricing card, experts offering it (tappable rows), Book now CTA |
| Search | `search_screen.dart` | Live `TextField`, 4 tabs (All / Experts / Services / 4.5★), result count updates per tab |
| Expert Profile | `expert_profile_screen.dart` | Avatar, rating, bio, services offered, reviews section, Book now CTA |

### Customer — Booking Wizard

| Screen | File | Description |
|--------|------|-------------|
| Book Appointment | `book_appointment_screen.dart` | Step 1: date picker + time slot grid |
| Upload Documents | `upload_documents_screen.dart` | Step 2: drag/tap upload area + uploaded file preview |
| Confirm Booking | `confirm_booking_screen.dart` | Step 3: order summary, coupon field, proceed to pay |
| Payment | `payment_screen.dart` | Card / UPI / Net banking selection, pay button |
| Booking Confirmed | `booking_confirmed_screen.dart` | Success animation, booking ID, done CTA |
| Payment Failed | `payment_failed_screen.dart` | Error state, retry CTA |

### Customer — Booking Management

| Screen | File | Description |
|--------|------|-------------|
| My Bookings | `customer_bookings_screen.dart` | 3-tab segmented control (Upcoming / Completed / Cancelled), booking cards |
| Booking Detail | `customer_booking_detail_screen.dart` | 4-step stepper, expert card, meeting link, service details, documents; bottom bar: Reschedule / Cancel / Message expert |
| Reschedule | `reschedule_booking_screen.dart` | Current booking summary, 7-day date chip row, morning/afternoon/evening time slots (greyed-out = unavailable), confirm button activates when slot selected |
| Cancel Booking | `cancel_booking_screen.dart` | Reason selection list, confirm cancellation |
| Meeting Link | `meeting_link_screen.dart` | Video meeting join screen |

### Customer — Other

| Screen | File | Description |
|--------|------|-------------|
| Alerts | `alerts_screen.dart` | Notification cards: booking confirmed → booking detail, new message → chat, payment → SnackBar, rate expert → rate screen |
| Chat | `customer_chat_screen.dart` | Real-time style chat UI with expert |
| Rate Expert | `rate_expert_screen.dart` | 1–5 star tap rating + written comment |
| Review Success | `review_success_screen.dart` | Confirmation after submitting a review |

### Customer — Profile

| Screen | File | Description |
|--------|------|-------------|
| Profile | `customer_profile_screen.dart` | Avatar, name, menu cards |
| Edit Profile | `edit_profile_screen.dart` | Full name, email, phone with pre-filled values |
| Saved Experts | `saved_experts_screen.dart` | Bookmarked expert cards |
| Saved Addresses | `saved_addresses_screen.dart` | Address list, add/edit/delete |
| Payment Methods | `payment_methods_screen.dart` | Saved cards + UPI |
| Notification Prefs | `notification_preferences_screen.dart` | Push / SMS / email toggles |
| Privacy & Security | `privacy_security_screen.dart` | Password change, 2FA, account deletion |
| Help & Support | `help_support_screen.dart` | Contact buttons + FAQ accordion |

### Professional — Home & Requests

| Screen | File | Description |
|--------|------|-------------|
| Pro Home | `pro_home_screen.dart` | Online toggle, stats row (bookings, earnings, rating), new request card (accept/decline), today's schedule (View all → ScheduleScreen) |
| Requests | `requests_screen.dart` | All incoming requests, accept → BookingDetailScreen, decline → SnackBar |
| Booking Detail | `booking_detail_screen.dart` | Customer info + chat/call icons, service/date/earn details, customer docs, share meeting link (SnackBar), Start job (SnackBar) |
| Schedule | `schedule_screen.dart` | Calendar view of all confirmed sessions |
| Chat | `chat_screen.dart` | In-app chat with customer |

### Professional — Earnings

| Screen | File | Description |
|--------|------|-------------|
| Earnings | `earnings_screen.dart` | Balance card with Request Payout CTA, this-month / total stats, transaction list with Export button |
| Payout | `payout_screen.dart` | Enter amount, select account, confirm payout |
| Payout Settings | `payout_settings_screen.dart` | List of bank/UPI accounts, set default, remove; Add payout account CTA (SnackBar) |

### Professional — Notifications

| Screen | File | Description |
|--------|------|-------------|
| Notifications | `notifications_screen.dart` | Notification list with read/unread state, Mark all read button |

### Professional — Profile

| Screen | File | Description |
|--------|------|-------------|
| Profile | `profile_screen.dart` | Gradient header (avatar, name, verified badge), menu cards |
| Edit Profile | `edit_profile_screen.dart` | Name, profession/title, bio, phone, languages; camera icon for photo |
| My Services | `my_services_screen.dart` | Toggle each service on/off, edit pricing per service |
| Availability | `availability_screen.dart` | Set hours per weekday |
| My Reviews | `my_reviews_screen.dart` | Overall rating + bar breakdown, review cards with inline reply toggle |
| Help & Support | `help_support_screen.dart` | Partner-specific contact + FAQ accordion |

### Professional — Onboarding

| Screen | File | Description |
|--------|------|-------------|
| Become Expert | `become_expert_screen.dart` | Multi-field registration form |
| Verification Pending | `verification_pending_screen.dart` | KYC submitted, awaiting review |
| Verification Rejected | `verification_rejected_screen.dart` | Issues listed in a red card, Contact support + Reapply CTAs |

---

## Design System

All tokens live in `lib/core/app_config.dart`. Nothing is hardcoded at the widget level — widgets reference these classes:

### Color System (`AppColors`)

| Token | Value | Usage |
|-------|-------|-------|
| `primary` | `#4158D0` | Buttons, active states, links |
| `teal` | `#4DD0E1` | Gradient start (left), accent |
| `background` | `#EEF0FA` | Scaffold background |
| `surface` | `#FFFFFF` | Cards, bottom sheets |
| `textPrimary` | `#0D0D2B` | Headings, primary labels |
| `textSecondary` | `#6B7280` | Subtitles, captions |
| `success` | `#22C55E` | Completed, online, confirmed |
| `error` | `#EF4444` | Cancelled, failed, destructive |
| `warning` | `#F59E0B` | Pending, amber states |

**Gradients:**
- `buttonGradient` — teal → primary (all CTAs)
- `headerGradient` — `#C8DCFF` → `#EEF0FA` (page headers)

### Typography (`AppTextStyles`)

All using **Inter** (Google Fonts). Scale: `h1` (28 px) → `h4` (16 px), `bodyLg` (16 px) → `bodySm` (12 px), `caption` (11 px).

### Spacing (`AppSpacing`)

4 px base grid: `xs=4`, `sm=8`, `md=12`, `base=16`, `lg=20`, `xl=24`, `xxl=32`.

### Border Radius (`AppRadius`)

`sm=8`, `md=12`, `lg=16`, `card=16`, `button=14`, `chip=20`, `circle=999`.

### Badge Tokens (`AppBadgeStyles`)

Pre-built `AppBadgeData` objects for: `confirmed`, `pending`, `completed`, `cancelled`, `inProgress`, `online`, `offline`, `verified`, `rejected`. Each exposes `.toWidget()` for a ready-made pill.

### Theme (`AppTheme`)

Single `ThemeData` wired to `MaterialApp.theme`. Sets `useMaterial3: true`, Inter font family, transparent `AppBar`, `CupertinoPageTransitionsBuilder` on all platforms for smooth slide transitions.

---

## Key Logic & Patterns

### State Management

All state is local (`StatefulWidget` + `setState`). No external state management library.

Key stateful patterns in the app:

| Pattern | Where used |
|---------|-----------|
| Online/offline toggle | `ProHomeScreen._isOnline` |
| Tab switching (`_tabIndex`) | `CustomerBookingsScreen`, `CategoryScreen`, `SearchScreen` |
| Promo slider page (`_promoPage`) | `CustomerHomeScreen` + `PageController` |
| Review reply toggle (`_replying`) | `_ReviewCard` in `MyReviewsScreen` |
| Default payout account | `PayoutSettingsScreen._accounts` list |
| Service active toggle | `MyServicesScreen._services` list |
| Notification read state | `ProNotificationsScreen._notifs` list |
| Date/slot selection | `RescheduleBookingScreen._selectedDay`, `_selectedSlot` |
| Save/unsave (heart) | `ServiceDetailScreen._isSaved` |

### Navigation Pattern

All navigation uses `Navigator.push` with `MaterialPageRoute`. No named routes.

```dart
// Push forward
Navigator.of(context).push(
  MaterialPageRoute(builder: (_) => const TargetScreen()),
);

// Replace entire stack (mode switch / logout)
Navigator.of(context).pushAndRemoveUntil(
  MaterialPageRoute(builder: (_) => const CustomerShell()),
  (_) => false,
);
```

### Category Screen — Data-Driven Architecture

`CategoryScreen` accepts a `category` string parameter. All 6 category configurations are defined as compile-time constants in a top-level `Map<String, _CatConfig>`. The `_items` getter derives the correct service list based on the active filter index:

```dart
CategoryScreen(category: 'Legal')  // passes category name from home grid
```

Each `_CatConfig` holds 5 service lists (all, popular, online, inPerson, topRated) — switching filter chips updates only `_filterIndex`, the getter re-derives the list.

### OTP Screen — Auto-advance

Each of the 6 OTP boxes uses a dedicated `TextEditingController` and `FocusNode`. On `onChanged`, if a digit is entered the focus moves to the next box; on backspace (`onKey`), focus moves to the previous box. `FilteringTextInputFormatter.digitsOnly` prevents non-numeric input.

### Reschedule Screen — Conditional CTA

The Confirm button uses `AnimatedContainer` — it renders grey with disabled text when no slot is selected (`_selectedSlot < 0`), and switches to the brand gradient with an arrow label once a slot is tapped. The `onTap` is `null` when disabled, so the gesture is silently ignored.

### Pro Request Accept/Decline

- **Home screen**: Accept navigates to `BookingDetailScreen`; Decline shows a SnackBar.
- **Requests screen**: Accept calls `onAccept` callback (navigates to `BookingDetailScreen`); Decline wrapped in `GestureDetector` shows SnackBar.

### Shell Tab Persistence

Both shells use `IndexedStack` rather than rebuilding screens on tab switch. This means scroll positions, form state, and loaded data are all retained when switching tabs.

### Booking Status Colours

Consistent across all booking cards:

| Status | Text colour | Background |
|--------|------------|------------|
| Confirmed | `#4158D0` | `#E0E7FF` |
| Pending | `#D97706` | `#FEF3C7` |
| Completed | `#22C55E` | `#DCFCE7` |
| Cancelled | `#EF4444` | `#FEE2E2` |

### Prototype Placeholders

Features requiring native plugins (file picker, camera, clipboard, meeting SDK) show a floating `SnackBar` instead of crashing:

```dart
ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(
    content: Text('Feature coming soon'),
    behavior: SnackBarBehavior.floating,
  ),
);
```

Screens affected: upload document, camera icon (both profiles), add service, add payout account, export transactions, share meeting link, start job.

---

## Running the App

```bash
flutter pub get
flutter run
```

Minimum Flutter version: **3.19** (required for `.withValues(alpha:)` and `WidgetStateProperty`).
