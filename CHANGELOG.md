# info_label

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

