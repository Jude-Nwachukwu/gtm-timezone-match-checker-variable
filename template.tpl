___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Timezone Match Checker",
  "description": "Checks whether a timezone value matches any entry in a list using the full value, the beginning of the value, or the end of the value.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "tmzVarSource",
    "displayName": "Enter the Timezone Variable",
    "simpleValueType": true,
    "help": "Enter the timezone variable to check. \u003cstrong\u003e\u003ca href\u003d\"https://github.com/Jude-Nwachukwu/gtm-timezone-match-checker-variable#code\"\u003eGet the code here\u003c/a\u003e\u003c/strong\u003e",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "valueHint": "For example, {{cjs - timezone}}"
  },
  {
    "type": "RADIO",
    "name": "timezoneValuePullType",
    "displayName": "Which part of the timezone value would you like to check?",
    "radioItems": [
      {
        "value": "timezoneValuePullTypeFull",
        "displayValue": "Full Value"
      },
      {
        "value": "timezoneValuePullTypeBegininnign",
        "displayValue": "Beginning"
      },
      {
        "value": "timezoneValuePullTypeEnd",
        "displayValue": "Ending"
      }
    ],
    "simpleValueType": true
  },
  {
    "type": "PARAM_TABLE",
    "name": "tiemzoneValueField",
    "displayName": "Add Rows of Values",
    "paramTableColumns": [
      {
        "param": {
          "type": "TEXT",
          "name": "timezonevaluestocheck",
          "displayName": "Timezone Values to Check",
          "simpleValueType": true,
          "valueHint": "e.g. America/New_York",
          "valueValidators": [
            {
              "type": "NON_EMPTY"
            }
          ]
        },
        "isUnique": true
      }
    ],
    "newRowButtonText": "Add Timezone"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const makeString = require('makeString');

// Get timezone value
let timezoneValue = makeString(data.tmzVarSource || '').trim();

if (!timezoneValue) {
  return false;
}

// Convert to lowercase for case-insensitive matching
timezoneValue = timezoneValue.toLowerCase();

// Apply transformation based on selected radio option
if (data.timezoneValuePullType === 'timezoneValuePullTypeBegininnign') {
  timezoneValue = timezoneValue.split('/')[0];
} else if (data.timezoneValuePullType === 'timezoneValuePullTypeEnd') {
  const parts = timezoneValue.split('/');
  timezoneValue = parts[parts.length - 1];
}

// Get table rows
const rows = data.tiemzoneValueField || [];

// Check for exact match
for (let i = 0; i < rows.length; i++) {
  const checkValue = makeString(
    rows[i].timezonevaluestocheck || ''
  ).trim().toLowerCase();

  if (timezoneValue === checkValue) {
    return true;
  }
}

return false;


___TESTS___

scenarios: []


___NOTES___

Created on 6/16/2026, 2:26:12 PM


