# ColdBox Keyword Tool Module

## Module Information

`coldbox-module-keywordtool` is a private DealStream ColdBox module that integrates an application with the Keyword Tool API. It provides access to Google keyword search volumes and keyword suggestions from CFML applications.

- **Module name:** `keywordtoolapi`
- **Package:** `coldbox-module-keywordtool`
- **Author:** DealStream
- **Service:** `KeywordTool@keywordtoolapi`
- **API endpoint:** `https://api.keywordtool.io/v2/search`
- **License:** Private and proprietary

## Features

- Retrieve Google search volume for one or more keywords.
- Retrieve Google keyword suggestions.
- Support country-specific keyword suggestions.
- Throw `KeywordToolAPI` exceptions for invalid responses and API errors.

## Configuration

Configure the module with a Keyword Tool API key in the application's module settings:

```cfml
moduleSettings = {
    keywordtoolapi = {
        apiKey = application.system.environment[ "KEYWORD_TOOL_API_KEY" ]
    }
};
```

Keep the API key in an environment variable or secure secrets store and do not commit it to source control.

## Requirements

- A ColdBox application
- Adobe ColdFusion or Lucee
- A valid Keyword Tool API key

## Patch Version

Current patch version: `1.0.0`.

This project follows semantic versioning in the `MAJOR.MINOR.PATCH` format. Future patch releases should increment the patch number, such as `1.0.1`, and use the same value as the Git release tag and the `version` property in `box.json`.
