# GTM Timezone Match Checker Variable

A Google Tag Manager Custom Variable Template that allows you to determine whether a user's browser timezone matches one or more configured timezone values.

The template can evaluate the complete timezone string, the beginning portion, or the ending portion of the timezone and returns either `true` or `false`, making it easy to control tags, triggers, and variables based on timezone-based conditions.

---

# Features

* Returns a simple boolean result (`true` or `false`)
* Case-insensitive matching
* Supports multiple timezone values
* Supports exact matching
* Supports matching against:

  * Full timezone value
  * Beginning portion of timezone
  * Ending portion of timezone
* Works with all standard IANA timezone values

Examples:

```
America/New_York
America/Indiana/Vincennes
Europe/London
Africa/Lagos
Asia/Tokyo
Australia/Sydney
```

---

# Installation

## Import the Template

1. Open Google Tag Manager.
2. Navigate to **Templates**.
3. Under **Variable Templates**, click **New**.
4. Click the three-dot menu in the top-right corner.
5. Select **Import**.
6. Choose the downloaded template file.
7. Save the template.

---

# Creating the Browser Timezone Variable

Before using the Timezone Match Checker variable, create a Custom JavaScript Variable that returns the visitor's browser timezone.

### Variable Type

Custom JavaScript

### Code

```javascript
function() {
  return Intl.DateTimeFormat().resolvedOptions().timeZone;
}
```

### Example Outputs

```text
America/New_York
Europe/London
Africa/Lagos
Asia/Tokyo
America/Indiana/Vincennes
```

Save this variable and use it inside the Timezone Match Checker template.

Example:

```text
{{cjs - timezone}}
```

---

# Configuration

## Enter the Timezone Variable

Select or enter the variable that returns the user's timezone.

Example:

```text
{{cjs - timezone}}
```

---

## Which Part of the Timezone Value Would You Like to Check?

Choose how the template should evaluate the timezone value.

### Full Value

Uses the timezone exactly as returned.

Example:

```text
America/New_York
```

remains

```text
America/New_York
```

---

### Beginning

Uses the first portion before the first slash (`/`).

Example:

```text
America/New_York
```

becomes

```text
America
```

Example:

```text
America/Indiana/Vincennes
```

becomes

```text
America
```

---

### Ending

Uses the last portion after the final slash (`/`).

Example:

```text
America/New_York
```

becomes

```text
New_York
```

Example:

```text
America/Indiana/Vincennes
```

becomes

```text
Vincennes
```

---

## Add Rows of Values

Add one or more timezone values to compare against.

The variable returns `true` when a match is found.

The variable returns `false` when no match is found.

---

# Matching Examples

| Browser Timezone          | Match Type | Configured Value | Result  |
| ------------------------- | ---------- | ---------------- | ------- |
| America/New_York          | Full       | America/New_York | ✅ True  |
| America/New_York          | Full       | Europe/London    | ❌ False |
| America/New_York          | Beginning  | America          | ✅ True  |
| America/New_York          | Beginning  | Europe           | ❌ False |
| America/New_York          | End        | New_York         | ✅ True  |
| America/New_York          | End        | Chicago          | ❌ False |
| America/Indiana/Vincennes | Beginning  | America          | ✅ True  |
| America/Indiana/Vincennes | End        | Vincennes        | ✅ True  |
| America/Indiana/Vincennes | End        | Indiana          | ❌ False |
| Africa/Lagos              | Full       | Africa/Lagos     | ✅ True  |
| Africa/Lagos              | Beginning  | Africa           | ✅ True  |
| Africa/Lagos              | End        | Lagos            | ✅ True  |

---

# How Matching Works

The template performs exact matching after converting all values to lowercase.

This means:

```text
America/New_York
america/new_york
AMERICA/NEW_YORK
```

are all treated as identical values.

---

# Example Use Cases

## Prevent Advertising Tags from Firing in Certain Regions

Some organizations only run campaigns in specific markets.

You can create a trigger condition that checks whether a user's timezone belongs to a restricted region and prevent advertising pixels from firing.

Examples:

* Google Ads
* Meta Pixel
* LinkedIn Insight Tag
* TikTok Pixel
* Reddit Pixel
* X (Twitter) Pixel

---

## Restrict Conversion Tracking by Market

Only count conversions from specific timezone groups.

Examples:

```text
America
Europe
Asia
```

---

## Enable Regional Marketing Campaigns

Only fire campaign-specific tags for visitors in targeted regions.

Example:

```text
Europe/London
Europe/Berlin
Europe/Paris
```

---

## Control Personalization Logic

Show different experiences based on timezone groups.

Examples:

* Regional promotions
* Regional messaging
* Regional content recommendations
* Localized campaigns

---

## Exclude Internal Traffic

Organizations with globally distributed teams can use timezone matching as an additional signal for identifying and excluding internal traffic patterns.

---

## Region-Based Testing

Enable or disable testing tools, survey widgets, or experimentation platforms only for selected timezone groups.

---

# Example Trigger Configuration

Create a trigger condition such as:

```text
{{Timezone Match Checker}} equals true
```

or

```text
{{Timezone Match Checker}} equals false
```

and use it to control whether a tag should fire.

---
## Finding Valid Timezone Values

The Timezone Match Checker works with standard IANA timezone values returned by modern browsers.

If you're unsure which timezone values to use in your configuration, you can browse comprehensive timezone reference lists here:

### TimeZoneDB Timezone List

A searchable list of common timezone values used across countries and regions:

https://timezonedb.com/time-zones

### Thales Timezone Reference

An extensive reference of timezone identifiers and timezone naming conventions:

https://docs.sentinel.thalesgroup.com/softwareandservices/ems/EMSdocs/WSG/Content/TimeZone.htm

### Common Examples

| Region      | Timezone Value      |
| ----------- | ------------------- |
| Lagos       | Africa/Lagos        |
| London      | Europe/London       |
| New York    | America/New_York    |
| Chicago     | America/Chicago     |
| Los Angeles | America/Los_Angeles |
| Toronto     | America/Toronto     |
| Sydney      | Australia/Sydney    |
| Tokyo       | Asia/Tokyo          |
| Dubai       | Asia/Dubai          |
| Singapore   | Asia/Singapore      |

### Tip

The easiest way to identify the exact timezone value returned by a visitor's browser is to temporarily create a GTM Custom JavaScript Variable using:

```javascript
function() {
  return Intl.DateTimeFormat().resolvedOptions().timeZone;
}
```

Then preview your container and inspect the variable value in GTM Preview Mode. The returned value can be copied directly into the Timezone Match Checker configuration table.


# Resources

### GTM Custom Template Collection

https://dumbdata.co/gtm-custom-templates/

### Tools & Templates

https://dumbdata.co/tools-and-templates/

### Contact Us

https://dumbdata.co/contact-us/

---

# License

Licensed under the Apache License 2.0.

Copyright © DumbData

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this project except in compliance with the License.

You may obtain a copy of the License at:

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
