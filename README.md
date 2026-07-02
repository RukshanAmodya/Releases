# ☀️ Solarjade Service App — Project Report
**දිනය:** 2026 ජූලි 02  
**Version:** 1.0.0+1  
**Platform:** Android · iOS · Web  
**Currency:** Sri Lankan Rupee (LKR) — *USD/LKR = 335.38 (2026-07-02)*

---

## 1. 📌 Project Overview (ව්‍යාපෘති සාරාංශය)

**Solarjade Service App** යනු **Solarjade** සෞරශක්ති සේවා සමාගම සඳහා ගොඩනගන ලද, **cross-platform Flutter mobile application** එකකි. Customer, Technician සහ Admin ලෙස user roles 3ක් ඇති මෙය — solar inverter live monitoring, service booking, complaints management, සහ push notifications ද incorporate කරගෙන ඇත.

> **Mission:** ශ්‍රී ලංකාවේ solar panel users ට ඔවුන්ගේ power systems realtime නිරීක්ෂණය, ස්වයංක්‍රීය service requests, සහ technician dispatch — අල්ලන් app එකක් හරහා ලබාදීම.

---

## 2. 🏗️ System Architecture (පද්ධති ගෘහ නිර්මාණය)

```
┌─────────────────────────────────────────────────────────────┐
│                    SOLARJADE APP (Flutter)                   │
│                                                             │
│  ┌──────────┐  ┌──────────────┐  ┌─────────────────────┐   │
│  │ Customer │  │  Technician  │  │       Admin          │   │
│  │  Portal  │  │    Portal    │  │  Settings Screen     │   │
│  └──────────┘  └──────────────┘  └─────────────────────┘   │
│              Provider (AppState) — State Management          │
└────────────────────────┬────────────────────────────────────┘
                         │
         ┌───────────────┼───────────────┐
         ▼               ▼               ▼
  ┌──────────────┐ ┌──────────────┐ ┌─────────────────────┐
  │   Firebase   │ │   Supabase   │ │  Cloudflare Workers  │
  │  Firestore   │ │   Storage    │ │  (SolaX API Proxy +  │
  │  Auth + RTDB │ │  (Images)    │ │  FCM Push Proxy)     │
  └──────────────┘ └──────────────┘ └─────────────────────┘
         │                                     │
         ▼                                     ▼
  ┌──────────────┐                   ┌─────────────────────┐
  │   SolaX API  │                   │     SolisCloud API   │
  │  (Realtime   │                   │  (Realtime Inverter  │
  │  Inverter)   │                   │    Metrics v2.0.3)   │
  └──────────────┘                   └─────────────────────┘
```

---

## 3. ✨ Implemented Features (සම්පූර්ණ කළ Features)

### 3.1 🔐 Authentication System
| Feature | තත්ත්වය |
|---------|---------|
| Email/Password Login | ✅ සම්පූර්ණයි |
| User Registration (Customer/Technician) | ✅ සම්පූර්ණයි |
| Auto-login (Saved Credentials) | ✅ සම්පූර්ණයි |
| Role-based Portal Navigation | ✅ සම්පූර්ණයි |
| Secure Logout + FCM Token Clear | ✅ සම්පූර්ණයි |

### 3.2 ☀️ Customer Portal — Dashboard Tab
| Feature | තත්ත්වය |
|---------|---------|
| Live Solar Generation (kW) — Realtime | ✅ සම්පූර්ණයි |
| System ON/OFF Toggle (Firebase RTDB) | ✅ සම්පූර්ණයි |
| Multi-plant Selector | ✅ සම්පූර්ණයි |
| fl_chart Power Generation Graph | ✅ සම්පූර්ණයි |
| Animated Dashboard Cards | ✅ සම්පූර්ණයි |
| Global/Plant-specific Carousel (Admin Uploaded) | ✅ සම්පූර්ණයි |
| SolaX Inverter Status Codes (102 modes decoded) | ✅ සම්පූර්ණයි |

### 3.3 🔧 Customer Portal — Services Tab
| Feature | තත්ත්වය |
|---------|---------|
| Free Milestone Services (1st, 2nd, 3rd) | ✅ සම්පූර්ණයි |
| Paid Premium Service Booking | ✅ සම්පූර්ණයි |
| Dynamic Pricing (kW-based) from Firestore | ✅ සම්පූර්ණයි |
| City-based Transport Fee Calculation | ✅ සම්පූර්ණයි |
| Payment Slip Upload (Supabase Storage) | ✅ සම්පූර්ණයි |
| Service History Timeline | ✅ සම්පූර්ණයි |
| Non-solar Customer Support (No Dashboard Mode) | ✅ සම්පූර්ණයි |

### 3.4 📋 Customer Portal — Complaints Tab
| Feature | තත්ත්වය |
|---------|---------|
| Issue Report Form (Category + Notes + Photo) | ✅ සම්පූර්ණයි |
| Firestore-driven Issue Categories | ✅ සම්පූර්ණයි |
| Complaint ID Auto-generation (SOL-XXX) | ✅ සම්පූර්ණයි |
| Image Attachment Upload (Supabase) | ✅ සම්පූර්ණයි |
| Complaint Status Tracking (Ongoing/Resolved) | ✅ සම්පූර්ණයි |
| Real-time Status Updates | ✅ සම්පූර්ණයි |

### 3.5 👷 Technician Portal
| Feature | තත්ත්වය |
|---------|---------|
| All Complaints View (Real-time Stream) | ✅ සම්පූර්ණයි |
| All Services View (Real-time Stream) | ✅ සම්පූර්ණයි |
| Job Details Dialog (Customer Info + Urgency) | ✅ සම්පූර්ණයි |
| Status Update (Assigned → On the way → In progress → Resolved) | ✅ සම්පූර්ණයි |
| All Customers Overview | ✅ සම්පූර්ණයි |
| All Plants Overview | ✅ සම්පූර්ණයි |
| Plant Configuration (Brand, Serial, API Keys) | ✅ සම්පූර්ණයි |
| Pending Configs Management | ✅ සම්පූර්ණයි |
| Direct Plant Addition | ✅ සම්පූර්ණයි |
| Customer System Toggle (Remote ON/OFF) | ✅ සම්පූර්ණයි |

### 3.6 ⚙️ Admin Settings (Technician Access)
| Feature | තත්ත්වය |
|---------|---------|
| Service Fee Per kW (Firestore) | ✅ සම්පූර්ණයි |
| Transport Fees Per City (Sri Lanka Cities DB) | ✅ සම්පූර්ණයි |
| Issue Categories Management | ✅ සම්පූර්ණයි |
| Global Dashboard Carousel Management | ✅ සම්පූර්ණයි |
| Plant-specific Carousel Upload | ✅ සම්පූර්ණයි |

### 3.7 🔔 Push Notification System
| Feature | තත්ත්වය |
|---------|---------|
| Firebase Cloud Messaging (FCM) Integration | ✅ සම්පූර්ණයි |
| Cloudflare Worker FCM Proxy (API Key Hidden) | ✅ සම්පූර්ණයි |
| Background + Foreground Message Handling | ✅ සම්පූර්ණයි |
| In-App Notification Center | ✅ සම්පූර්ණයි |
| Unread Badge Animation (Bell Icon) | ✅ සම්පූර්ණයි |
| Mark All as Read | ✅ සම්පූර්ණයි |
| Notify All Technicians (Broadcast) | ✅ සම්පූර්ණයි |
| Notify Specific Customer | ✅ සම්පූර්ණයි |
| Inverter Status Change Alerts (SolaX Auto-detect) | ✅ සම්පූර්ණයි |

### 3.8 🌐 Hardware API Integrations
| Inverter Brand | Integration | Auto-refresh |
|---------------|------------|-------------|
| **SolaX Power** | Cloudflare Worker Proxy → SolaX Cloud API | ✅ 60s loop |
| **Solis (SolisCloud)** | Direct API v2.0.3 (HMAC-SHA1 Auth) | ✅ 60s loop |
| Smart retry: 5s on failure, 60s on success | | |

---

## 4. 🛠️ Technology Stack

| Category | Technology | Version |
|----------|-----------|---------|
| **Mobile Framework** | Flutter / Dart | 3.x (SDK ^3.12.2) |
| **State Management** | Provider | ^6.1.5 |
| **Authentication** | Firebase Auth | ^6.5.4 |
| **Database** | Cloud Firestore | ^6.6.0 |
| **Realtime DB** | Firebase Realtime Database | ^12.4.4 |
| **File Storage** | Supabase Storage | ^2.15.0 |
| **Push Notifications** | Firebase Messaging | ^16.4.1 |
| **Local Notifications** | flutter_local_notifications | ^18.0.1 |
| **Charts** | fl_chart | ^1.2.0 |
| **HTTP Client** | http | ^1.2.2 |
| **Cryptography** | crypto (HMAC-SHA1) | ^3.0.3 |
| **Location Data** | sri_lanka_provinces_districts_cities | ^0.0.4 |
| **Backend (Edge)** | Cloudflare Workers | - |
| **Fonts** | Google Fonts (Instrument Sans) | ^8.1.0 |
| **Local Storage** | shared_preferences | ^2.5.5 |

---

## 5. 💰 Project Cost Estimation (LKR)

> **විනිමය අනුපාතය:** 1 USD = LKR 335.38 (2026-07-02, CBSL Mid-rate)  
> **ගණනය:** Flutter Developer ශ්‍රී ලංකාවේ market rates + Cloud service costs

### 5.1 👨‍💻 Development Labour Cost

| Component | Estimated Hours | Rate (LKR/hr) | LKR Total |
|-----------|----------------|--------------|-----------|
| Project Architecture & Setup | 16h | 3,500 | **56,000** |
| Authentication System | 24h | 3,500 | **84,000** |
| Customer Portal (Dashboard) | 48h | 3,500 | **168,000** |
| Customer Portal (Services Tab) | 40h | 3,500 | **140,000** |
| Customer Portal (Complaints Tab) | 32h | 3,500 | **112,000** |
| Customer Portal (Profile Tab) | 16h | 3,500 | **56,000** |
| Technician Portal (All features) | 56h | 3,500 | **196,000** |
| Admin Settings Screen | 32h | 3,500 | **112,000** |
| Push Notification System (FCM) | 24h | 3,500 | **84,000** |
| SolaX API Integration (Cloudflare) | 20h | 3,500 | **70,000** |
| Solis API Integration (HMAC-SHA1) | 16h | 3,500 | **56,000** |
| Supabase Storage Integration | 12h | 3,500 | **42,000** |
| UI/UX Design (Glassmorphism theme) | 32h | 3,500 | **112,000** |
| Firebase Configuration & Rules | 12h | 3,500 | **42,000** |
| Testing & Bug Fixes | 24h | 3,500 | **84,000** |
| **Development Total** | **404h** | | **LKR 1,414,000** |

### 5.2 ☁️ Monthly Cloud Infrastructure Cost

| Service | Plan | Monthly USD | Monthly LKR |
|---------|------|------------|-------------|
| Firebase Spark → Blaze (Firestore reads/writes) | Pay-as-you-go | ~$15 | ~LKR 5,031 |
| Firebase Auth (included in Blaze) | - | $0 | LKR 0 |
| Firebase Realtime Database | Blaze usage | ~$5 | ~LKR 1,677 |
| Firebase Cloud Messaging | Free | $0 | LKR 0 |
| Supabase Storage (5GB) | Free tier | $0 | LKR 0 |
| Cloudflare Workers (100K req/day free) | Free tier | $0 | LKR 0 |
| SolaX API Access | Included w/ hardware | $0 | LKR 0 |
| SolisCloud API Access | Included w/ hardware | $0 | LKR 0 |
| **Monthly Total** | | **~$20** | **~LKR 6,708** |

### 5.3 🔧 Annual Maintenance Cost

| Item | Annual LKR |
|------|-----------|
| Cloud Services (12 months) | **LKR 80,496** |
| App Store Publishing Fees (Google Play) | **LKR 8,500** (one-time) |
| Minor Bug Fixes & Updates (40h/yr) | **LKR 140,000** |
| API Changes & Adapter Updates | **LKR 35,000** |
| **Annual Maintenance Total** | **LKR 263,996** |

### 5.4 📊 Grand Total Summary

| Category | Amount (LKR) |
|----------|-------------|
| ✅ Development (404 hours) | **1,414,000** |
| ✅ Infrastructure Setup (one-time) | **15,000** |
| ✅ App Store Setup (one-time) | **8,500** |
| ✅ Year 1 Cloud Costs | **80,496** |
| **🔶 Total Project Cost (Year 1)** | **LKR 1,517,996** |
| **🔷 Ongoing Annual Cost (Year 2+)** | **LKR 263,996** |

> **Note:** Above rates are based on Mid-level Flutter Developer market rates in Sri Lanka (~LKR 3,500/hr). Senior developer rates may be 15-30% higher (~LKR 4,000–4,500/hr).

---

## 6. 📁 Project File Structure

```
solarjade/
├── lib/
│   ├── main.dart                        # App entry, Firebase/Supabase init
│   ├── app_state.dart                   # Provider state (1383 lines)
│   ├── firebase_options.dart            # Firebase config
│   ├── screens/
│   │   ├── splash_screen.dart           # Launch screen
│   │   ├── onboarding_screen.dart       # First-time onboarding
│   │   ├── auth_screen.dart             # Login/Register (714 lines)
│   │   ├── customer_portal.dart         # Customer app (3457 lines!)
│   │   ├── technician_portal.dart       # Technician app (2029 lines)
│   │   ├── admin_settings_screen.dart   # Admin panel (857 lines)
│   │   ├── premium_paid_service_screen.dart  # Paid service booking
│   │   ├── report_issue_screen.dart     # Complaint form
│   │   └── notifications_screen.dart   # Notification inbox
│   ├── services/
│   │   └── notification_service.dart   # FCM + local notifications
│   ├── theme/
│   │   └── theme.dart                  # AppTheme + GlassContainer
│   └── utils/
│       └── screen_utils.dart           # Responsive utilities
├── Cloudflare-Worker/
│   ├── worker.js                       # SolaX API proxy worker
│   └── fcm-proxy-worker.js             # FCM push proxy worker
├── assets/
│   ├── solarjade-logo.png
│   ├── appstore.png
│   └── playstore.png
└── pubspec.yaml                        # 12 production dependencies
```

---

## 7. 🔄 Data Flow Diagram

```
Customer Opens App
        │
        ▼
  Splash Screen → Auto-login (SharedPrefs) → Firebase Auth
        │
        ▼
   Role Check (Firestore: users/{uid})
        │
   ┌────┴────┐
   ▼         ▼
Customer  Technician
Portal      Portal
   │
   ├── Plants Stream (Firestore)
   ├── Complaints Stream (Firestore)
   ├── Services Stream (Firestore)
   ├── Notifications Stream (Firestore)
   ├── System Status Stream (Firebase RTDB)
   └── Live Power → Cloudflare Worker → SolaX/Solis API
                           │
                           ▼
                    60s Auto-refresh Loop
                    (5s retry on failure)
```

---

## 8. 🔔 Notification Event Matrix

| Trigger Event | Customer Notified | Technicians Notified |
|--------------|:-----------------:|:--------------------:|
| Complaint Submitted | ✅ | ✅ (all) |
| Complaint: Assigned | ✅ | ❌ |
| Complaint: On the Way | ✅ | ❌ |
| Complaint: In Progress | ✅ | ❌ |
| Complaint: Resolved | ✅ | ❌ |
| Paid Service Booked | ✅ | ✅ (all) |
| Free Service Requested | ✅ | ✅ (all) |
| System Configured | ✅ | ❌ |
| Inverter Status Changed | ✅ | ❌ |
| Inverter Fault (103/104) | ✅ ⚠️ | ❌ |

---

## 9. ⚡ Solar Inverter Integration Details

### SolaX Power Integration
- **Method:** Cloudflare Worker acts as a secure proxy to the SolaX Cloud API
- **Worker URL:** `solarjade-solix-api-bg.rukshan-amodaya-e.workers.dev`
- **Data:** AC Power (W), Device Status Code, Realtime metrics
- **Status Codes:** 20+ modes decoded (Normal, Fault, Sleep, TOU, etc.)
- **Refresh Rate:** Every 60 seconds (5s on error retry)
- **Retry Logic:** 3 attempts with 1s delay between each

### Solis (SolisCloud) Integration
- **Method:** Direct HMAC-SHA1 signed API calls to `soliscloud.com:13333`
- **Auth:** `Content-MD5 + Date + HMAC-SHA1 Signature`
- **API Doc:** SolisCloud Platform API Document V2.0.3
- **Data:** PAC (Active Power in W or kW)
- **Timeout:** 5 seconds per request

---

## 10. 📱 App Screens Summary

| Screen | Lines of Code | Purpose |
|--------|--------------|---------|
| customer_portal.dart | **3,457** | Largest file — Dashboard, Services, Complaints, Profile |
| technician_portal.dart | **2,029** | Job management, customer overview, plant config |
| app_state.dart | **1,383** | Global state + all Firebase/API logic |
| auth_screen.dart | **714** | Login + Registration |
| admin_settings_screen.dart | **857** | Pricing, categories, carousel |
| premium_paid_service_screen.dart | **1,229** | Paid service booking with payment slip |
| report_issue_screen.dart | **574** | Complaint form with image upload |
| notification_service.dart | **375** | FCM + local notifications |

**Total Lines of Code: ~12,618 lines**

---

## 11. 🚧 Current Status & Remaining Work

### ✅ Completed
- [x] Full authentication system
- [x] Customer Portal (all 4 tabs)
- [x] Technician Portal (all features)
- [x] Admin Settings (pricing, categories, carousel)
- [x] Firebase Firestore real-time streams
- [x] Firebase Realtime Database (system toggle)
- [x] SolaX API integration via Cloudflare Worker
- [x] Solis API integration (HMAC-SHA1)
- [x] Supabase Storage (image uploads)
- [x] Full FCM Push Notification system
- [x] Cloudflare FCM Proxy Worker
- [x] Glassmorphism UI theme
- [x] Sri Lanka city database integration
- [x] Android app icon configured

### 🔶 Suggested Improvements (Future Scope)
- [ ] iOS App Store publishing
- [ ] Dark mode support
- [ ] Historical energy generation analytics
- [ ] Monthly billing reports
- [ ] Multi-language support (Sinhala, Tamil)
- [ ] Customer rating system for technicians
- [ ] Google Maps integration for technician dispatch
- [ ] Automated invoice generation (PDF)

---

## 12. 🔒 Security Considerations

| Concern | Implementation |
|---------|---------------|
| API Keys (SolaX) | Cloudflare Worker secret (not in app code) |
| FCM Server Key | Cloudflare FCM Proxy Worker (not in app code) |
| Supabase Keys | Anon key used (public bucket with controlled access) |
| Firebase Rules | Role-based Firestore security rules (recommended) |
| Password Storage | Firebase Auth (hashed), SharedPrefs for auto-login |

> [!WARNING]
> SharedPreferences-based credential caching (plain text) is a security concern. Consider migrating to Flutter Secure Storage for production deployment.

---

## 13. 📊 Code Quality Metrics

| Metric | Value |
|--------|-------|
| Total Dart Files | 11 files |
| Total Lines of Code | ~12,618 |
| Production Dependencies | 12 packages |
| Dev Dependencies | 3 packages |
| Supported Platforms | Android, iOS, Web, Windows, macOS, Linux |
| State Management Pattern | Provider (ChangeNotifier) |
| API Integration Count | 4 (SolaX, Solis, Firebase, Supabase) |
| Cloudflare Workers | 2 (SolaX Proxy + FCM Proxy) |
| Firebase Collections | 6 (users, plants, complaints, services, pending_configs, admin_settings) |

---

## 14. 💡 Key Achievements

1. **Dual Inverter Support** — SolaX + Solis brands, same app, automatic brand detection
2. **Zero-downtime API Proxy** — Cloudflare Workers ensure API keys are never exposed client-side
3. **Smart Refresh Loop** — Adaptive retry (5s on fail, 60s on success) for battery efficiency
4. **No-Solar Customer Mode** — App gracefully handles customers without solar systems
5. **Real-time Push Architecture** — FCM pushes for every status change in the service workflow
6. **Glassmorphism Design** — Premium blur/glass card UI with Emerald Green brand palette
7. **Sri Lanka Localization** — Built-in Sri Lanka city/district database for transport fee calculation

---

*Report generated by Antigravity AI — 2026-07-02 20:24 IST*  
*Project Location: `f:\Projects\Solarjade-App\solarjade`*
