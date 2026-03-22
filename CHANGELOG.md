# info_label

## Version 2.0.0

### Breaking Changes
- **Removed `activeOnHover` bool** — replaced by composable flag. Hover is now enabled via `activeOnHover: true` and uses `ValueNotifier` + `CustomPainter.repaint` for paint-only updates (no widget rebuild).
- **Removed `Widget? overlay`** — replaced by paintable overlay params (`overlayColor`, `overlayText`, `overlayBorderColor`, etc). Zero extra widgets.
- **Removed `InfoLabelType` enum** — features are now composable flags (`activeOnHover`, `compactSize`, `overlayColor`) that can be combined freely.
- **`_solid` distribution text color** — now auto-selects black/white based on background luminance instead of always defaulting to null.

### New Features
- **CustomPainter rendering** — all labels use `CustomPainter` as the base renderer. Background, border, and text (in compact mode) are painted directly on canvas for minimal RenderObject count.
  - `_InfoLabelBasePainter` — background + border for base/hover variants.
  - `_CompactTextPainter` — background + border + centered auto-scaled text for compact mode.
  - `_OverlayPainter` — positioned indicator painted as `foregroundPainter`.
- **Compact mode** (`compactSize`) — fixed-size square label with auto-scaled centered text via `TextPainter`. Replaces 6-widget tree with 1 `RenderCustomPaint`.
- **Overlay indicator** — 4 modes, all painted (zero widgets):
  - **Dot**: `overlayColor` only.
  - **Badge**: `overlayColor` + `overlayText` (auto-expands to pill for multi-char text like "99+").
  - **Text only**: `overlayText` without `overlayColor`.
  - **Bordered badge**: `overlayColor` + `overlayText` + `overlayBorderColor`.
- **iOS smooth corners** (`smoothCorners: true`) — superellipse/squircle corners using cubic bezier curves. Matches iOS/Figma continuous corner radius style.
- **Composable features** — `activeOnHover`, `compactSize`, and `overlayColor`/`overlayText` can be combined freely. Only the needed layers are instantiated.
- **Hover paint-only repaint** — `ValueNotifier<Color?>` passed to `CustomPainter.repaint`. Hover changes trigger only `paint()` — no `build()`, no layout, no widget tree diff.
- **Auto-contrast text** — `_solid`, `_solidBackgroundTextContrastBorder`, `_solidBackgroundBorderContrastText`, and `_fullContrast` distribution modes auto-select black/white text based on background luminance when `textColor` is not explicitly set.

### Architecture
- **`part of` file organization** — each widget variant and painter is in its own `part` file:
  - `_info_label_data.dart` — shared data object.
  - `_info_label_painters.dart` — 3 CustomPainters + squircle path.
  - `_base_info_label_widget.dart` — base variant + `_BaseContent`.
  - `_compact_info_label_widget.dart` — compact variant.
  - `_hover_info_label_widget.dart` — hover wrapper.
  - `_color_by_type_info_widget.dart` — color lookup mixin.
- **`_InfoLabelData`** — encapsulates 22+ shared params to avoid repetition across variants.
- **Switch on record pattern** — `InfoLabel.build()` uses `switch ((activeOnHover, compactSize != null))` for zero-overhead routing.

### Tests
- **38 tests** (up from 11) — 17 unit tests + 4 assertion tests + 17 golden test groups.
- **Golden tests restructured** — one file per concern:
  - `golden_type_colors_test.dart` — 13 TypeInfoLabel colors + globalColor override.
  - `golden_distribution_modes_test.dart` — 6 modes × 3 contrast levels.
  - `golden_rounded_corners_test.dart` — circular vs smooth (squircle) at 5 radii.
  - `golden_border_colors_test.dart` — border color and visibility.
  - `golden_custom_colors_test.dart` — text/bg/globalColor overrides.
  - `golden_layout_icons_test.dart` — icons, alignment, padding, msg.
  - `golden_compact_test.dart` — compact sizing and text scaling.
  - `golden_overlay_test.dart` — dots, badges, text-only, bordered, positions.
  - `golden_hover_test.dart` — normal vs hover state comparison.
- **Standardized golden config** — white background, 14px padding, Roboto font.

## Version 1.3.0
- Updated Dart SDK constraint to ^3.10.0.
- Fixed lint warning: added type annotation to `_onHoverAction` parameter.
- Fixed golden tests CI variant configuration.

## Version 1.2.4
- activeOnHover defaults to false.

## Version 1.2.3
- Improve validation, title, text, etc.

## Version 1.2.2
- Changelog format.
  
## Version 1.2.1

### Added
- Support for using either titleWidget or text in the InfoLabel's upper section
- New functionality that allows using message as title when no text is defined

### Changed
- Improved rendering logic to maintain consistent alignment
- Optimized handling of cases when only message is provided

### Notes
- Existing implementations using text and msg remain compatible
- This update enhances widget flexibility while maintaining backward compatibility

## Version 1.2.0

### New Features
- **Message Support**: Added `msg` property to display additional descriptive text below the main label
- **Message Padding**: Introduced `msgPadding` property for custom message spacing control
- **Adaptive Text**: Added `isTextAdaptive` property for improved text responsiveness

### Improvements
- **Layout Enhancement**:
    - Improved margin distribution for better visual consistency
    - Enhanced spacing between label elements
    - Optimized alignment of text and icons
- **Test Coverage**:
    - Added comprehensive test cases for new features
    - Expanded golden tests for layout variations
    - Included responsive layout testing scenarios

### Documentation
- Updated README with new property examples
- Added usage examples for message functionality
- Included layout best practices

### Internal Changes
- Refactored padding logic for better maintainability
- Enhanced test infrastructure for golden tests
- Improved type safety for new properties

## Version 1.1.2
- **Fix dev imports**

## Version 1.1.1
- **Update green color**

## Version 1.1.0
- **Remove global margin**
- **User margin for icons and content**

## Version 1.0.8
- **Improvement:** Improve widgets use.
- **Fix:** Now is text centered correctly.

## Version 1.0.7
- **Improvement:** Update `TypeDistributionColor`.

## Version 1.0.6
- **Improvement:** Solid background per default, etc.

## Version 1.0.5
## Version 1.0.4
### Minor Changes
- **Improvement:** README.

## Version 1.0.3
### Minor Changes
- **Improvement:** README.


## Version 1.0.2
### Minor Changes

- **Improvement:** LICENSE.
- **Improvement:** README.
- **Improvement:** InfoLabel widget validations.


## Version 1.0.1
### Minor Changes

- **Improvement:** LICENSE.


## Version 1.0.0
### Major Changes

- **Added:** Introduced the `InfoLabelWidget` component, allowing for customizable information labels in Flutter applications.
- **Added:** Introduced the `TypeDistributionColor` enum, defining different color distribution configurations for labels to optimize readability and visual appearance.
- **Added:** Introduced the `TypeInfoLabel` enum, representing different types of labels with associated colors and meanings for quick labeling of information.

### Other Changes

- **Improvement:** Enhanced documentation in classes and methods to improve understanding and usage of the library.
- **Improvement:** Optimized variable and method names to adhere to Dart naming conventions and improve code readability.
- **Improvement:** Effectively reused code to promote maintainability and scalability of the project.
- **Fix:** Addressed minor issues and improved code efficiency to ensure optimal performance.

### Final Notes

This marks the initial stable release of the `info_label` library! We hope you find the new components and improvements introduced in this version helpful. If you have any feedback, suggestions, or encounter any issues, please don't hesitate to let us know so we can continue improving the library in future releases.

