---
trigger: always_on
---

# 🎯 Antigravity AI Agent System Rules

> **Version:** 2.4 | **Last Updated:** 2025-12-22

These rules are MANDATORY for all AI agents working on this project.

---

## 📌 Rule 1: Workflow-First Development

| Task Type | Command | Platform |
|-----------|---------|----------|
| Product Planning | `/plan-product` | Agnostic |
| New Feature | `/feature-flutter` or `/feature-reactnative` | Mobile |
| Code Review | `/review-flutter` or `/review-reactnative` | Mobile |
| Test Generation | `/test-flutter` or `/test-reactnative` | Mobile |
| Design Conversion | `/stitch-flutter` or `/stitch-reactnative` | Mobile |

> [!IMPORTANT]
> **CRITICAL: MANDATORY USE OF EXISTING AGENTS!**
> When running a workflow, you MUST use the agents defined in `.agent/agents/` (Project) or Global configuration.
> ❌ DO NOT create ad-hoc agents.
> ❌ DO NOT ignore agent references (e.g., `@grand-architect-flutter`).
> ✅ ALWAYS call the specific listed agent in the workflow using `INVOKE: @agent-name` syntax.
>
> DO NOT start coding without using the appropriate workflow. Workflows ensure all quality gates are met.

### Available Agents

| Platform | Agent | Purpose |
|----------|-------|--------|
| Agnostic | `@product-planner` | Product discovery & PRD generation |
| Flutter | `@grand-architect-flutter` | Architecture & planning |
| Flutter | `@stitch-converter-flutter` | Design-to-code conversion |
| Flutter | `@security-specialist-flutter` | Security audit (OWASP) |
| Flutter | `@test-generator-flutter` | Test suite generation |
| Flutter | `@a11y-enforcer-flutter` | Accessibility (WCAG 2.2) |
| Flutter | `@design-token-guardian-flutter` | Theme token compliance |
| Flutter | `@performance-prophet-flutter` | Performance prediction |
| Flutter | `@performance-enforcer-flutter` | Runtime optimization |
| React Native | `@grand-architect-reactnative` | Architecture & planning |
| React Native | `@stitch-converter-reactnative` | Design-to-code conversion |
| React Native | `@security-specialist-reactnative` | Security audit (OWASP) |
| React Native | `@test-generator-reactnative` | Test suite generation |
| React Native | `@a11y-enforcer-reactnative` | Accessibility (WCAG 2.2) |
| React Native | `@design-token-guardian-reactnative` | Theme token compliance |
| React Native | `@performance-prophet-reactnative` | Performance prediction |
| React Native | `@performance-enforcer-reactnative` | Runtime optimization |

---

## 🛡️ Rule 2: Quality Gates (Non-Negotiable)

### ❌ PROHIBITED (Hard Rules)
- Hardcode colors, spacing, typography → Use **design tokens**
- Skip accessibility for interactive elements → Require **Semantics widget**
- Ignore security for auth/payment features → Require **OWASP compliance**
- Deploy without tests → Minimum **widget test per feature**
- Commit with analyzer warnings → Must be **`flutter analyze` clean**

### ✅ REQUIRED (Mandatory)
- `const` constructor for static widgets
- `dispose()` for all controllers/streams
- 60fps minimum performance
- Touch target 48x48dp minimum
- WCAG 2.2 Level AA compliance

---

## 🔐 Rule 3: Security Standards

```yaml
Authentication:
  - BiometricAuth: Required for sensitive data
  - JWT: Proper validation + rotation
  - OAuth2: PKCE implementation
  - Storage: FlutterSecureStorage or ExpoSecureStorage only

Protection:
  - Root/Jailbreak: Detection required
  - Screenshots: Prevention on payment screens
  - SSL: Pinning enabled
  - Input: Sanitization required

Compliance:
  - OWASP: Mobile Top 10 coverage
  - GDPR: User data handling
  - Encryption: AES-256 for data at rest
```

---

## 🧪 Rule 4: Testing Requirements

| Test Type | Minimum Coverage | Priorities |
|-----------|-----------------|------------|
| Widget Tests | 80% per component | All UI components |
| Unit Tests | 90% business logic | Use cases, repositories |
| Integration Tests | Critical flows only | Auth, payment, core features |
| Golden Tests | Complex UI only | Custom widgets, animations |

**Required Actions:**
1. ROI-based test prioritization
2. State management tests (Provider/Bloc/Redux)
3. API mocking with Dio interceptors (Flutter) or MSW (React Native)
4. CI integration with GitHub Actions

---

## ⚡ Rule 5: Performance Budgets

```yaml
Flutter:
  FPS: 60 (minimum)
  Cold Start: < 3 seconds
  APK Size: < 50MB (release)
  IPA Size: < 100MB (release)
  Memory: < 150MB baseline
  Impeller: Enabled for rendering

React Native:
  FPS: 60 (minimum)  
  Cold Start: < 4 seconds
  Bundle Size: < 5MB (JS bundle)
  Memory: < 200MB baseline
  Hermes: Enabled for performance
```

---

## ♿ Rule 6: Accessibility Standards

- **WCAG 2.2 Level AA** compliance required
- **Semantics widgets** for all interactive elements
- **Color contrast** ratio 4.5:1 minimum
- **Screen reader** compatible (VoiceOver + TalkBack)
- **Keyboard navigation** support
- **Motion preferences** respected (reduced motion)
- **Dark mode** accessibility validated

---

## 🎨 Rule 7: Design System Compliance

**Theme Enforcement:**
- ❌ `Color(0xFF...)` → ✅ `Theme.of(context).colorScheme.primary`
- ❌ `TextStyle(fontSize: 16)` → ✅ `Theme.of(context).textTheme.bodyLarge`
- ❌ `EdgeInsets.all(16)` → ✅ `EdgeInsets.all(AppSpacing.md)`
- ❌ `Duration(milliseconds: 300)` → ✅ `AppDurations.medium`

**Token Categories:**
- Colors (light/dark mode)
- Typography (scale + weights)
- Spacing (consistent scale)
- Animation durations
- Border radius
- Elevation/shadows

---

## 📱 Rule 8: Platform Support

**Build Validation:**
1. Test on iOS simulator (iPhone 14/15 recommended)
2. Test on Android emulator (Pixel 6+)
3. Run `flutter analyze` → zero warnings
4. Run `flutter test` → all passing
5. Check bundle size with `--analyze-size`

**Platform-Specific:**
- Update `AndroidManifest.xml` for permissions
- Update `Info.plist` for iOS capabilities
- Handle Material vs Cupertino appropriately

---

## 🔄 Rule 9: CI/CD Integration

**Required Setup:**
- GitHub Actions for automated testing
- Fastlane for deployment
- Codecov for coverage tracking (80% minimum)
- Sentry for error tracking
- Firebase Analytics for metrics

**Pre-commit Checks:**
```bash
flutter analyze
flutter test
flutter pub run build_runner build
```

---

## 📝 Rule 10: Documentation

**When to Update:**
- `CLAUDE.md` → Architectural changes
- `README.md` → Setup or usage changes
- Inline comments → Complex business logic
- API docs → Public methods/classes

**Agent Documentation:**
- Each agent has its own checklist
- Follow the specified output format
- Provide actionable fixes, not just issues

---

## 🧭 Rule 11: Navigation Standards

### React Native (Expo Router)

```yaml
Structure:
  Root Layout: app/_layout.tsx (Stack)
  Auth Group: app/(auth)/ (login, register)
  Main Group: app/(app)/ (tabs - home, profile, etc.)
  Dynamic Routes: app/[id].tsx or app/item/[id].tsx
  Modals: Separate files at root level

Naming Convention:
  - Groups: "(auth)", "(app)", "(dashboard)" - context-based
  - DO NOT hardcode "(tabs)" as group name
  - Group name should match project type

Hooks Required:
  - useRouter() for navigation
  - useLocalSearchParams() for dynamic params
  - useFocusEffect() for screen focus events
  - usePathname() for current route
```

### Flutter (go_router)

```yaml
Structure:
  Router Config: lib/navigation/app_router.dart
  Shell Routes: Bottom navigation tabs
  Nested Routes: Stack within tabs
  Dynamic Routes: /item/:id pattern

Features Required:
  - Deep linking support
  - Path parameters properly handled
  - Redirect guards for auth
  - GoRouterRefreshStream for auth state
```

---

## 🎨 Rule 12: Stitch Design Integration

> [!TIP]
> When using `/feature-flutter` or `/feature-reactnative`, Stitch detection happens automatically in **Phase 0**. You don't need to run `/stitch-*` separately.

### Folder Detection

```yaml
Pattern: stitch_*/
Location: Project root
Structure:
  stitch_project_name/
  ├── screen_name/
  │   ├── code.html    # HTML + TailwindCSS
  │   └── screen.png   # Visual reference
  └── another_screen/
      ├── code.html
      └── screen.png
```

### Phase 0 Workflow (Automatic in /feature-*)

| Step | Action | Agent |
|------|--------|-------|
| 0.1 | Scan `stitch_*` folders, list all screens | - |
| 0.2 | Create screen inventory table | `@grand-architect-*` |
| 0.3 | Extract design tokens (colors, typography, spacing) | `@stitch-converter-*` |
| 0.4 | Identify reusable components | `@stitch-converter-*` |
| 0.5 | Define navigation structure | `@grand-architect-*` |
| 0.6 | Create `task.md` & `implementation_plan.md` | **MANDATORY** |

### Screen Naming Convention

| Stitch Folder | Flutter Output | React Native Output |
|---------------|----------------|---------------------|
| `home/` | `lib/screens/home_screen.dart` | `app/(app)/index.tsx` |
| `login/` | `lib/screens/login_screen.dart` | `app/(auth)/login.tsx` |
| `profile/` | `lib/screens/profile_screen.dart` | `app/(app)/profile.tsx` |
| `detail_[id]/` | `lib/screens/detail_screen.dart` | `app/detail/[id].tsx` |

### When to Use Each Workflow

| Scenario | Command |
|----------|--------|
| New feature WITH stitch folder | `/feature-flutter` or `/feature-reactnative` |
| Convert stitch ONLY (no feature) | `/stitch-flutter` or `/stitch-reactnative` |
| Existing code (no stitch) | `/feature-flutter` or `/feature-reactnative` |

---

## 📋 Rule 13: Task Creation & Tracking (CRITICAL)

**Mandatory Workflow:**
1. **Create Task**: When starting a workflow (e.g., `/feature-flutter`), FIRST create/update `task.md` with detailed steps.
2. **Create Plan**: Create `implementation_plan.md` BEFORE writing code.
3. **Live Updates**: You MUST mark items as `[/]` (in-progress) and `[x]` (completed) immediately as you work.
   - ❌ **Forbidden**: Completing a task without checking it off in `task.md`.
   - ❌ **Forbidden**: Modifying code that contradicts `implementation_plan.md` without updating the plan first.
4. **Synchronization**: The agent is responsible for keeping these artifacts strictly synchronized with the actual state of the project.

---

## 🚀 Quick Reference

```
/plan-product       → Product discovery & PRD generation
/feature-flutter    → Implement Flutter feature with full QA
/feature-reactnative → Implement React Native feature with full QA
/review-flutter     → Comprehensive Flutter code review
/review-reactnative → Comprehensive React Native review
/test-flutter       → Generate Flutter test suite
/test-reactnative   → Generate React Native test suite
/stitch-flutter     → Convert HTML design to Flutter
/stitch-reactnative → Convert HTML design to React Native
```

---

*© 2025 SenaiVerse | Antigravity AI Agent System v2.3*
