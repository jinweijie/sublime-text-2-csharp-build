# Introduction

Sublimetext-2-csharp-build is a build system for Sublime Text 2. 

The build supports compiling C# codes in the project workspace recursively. Also supports multiple DLLs references.

# Installation

Copy the `CSharpBuild.sublime-build` and `sublimetext_csharp_builder.bat` to the Sublime Text 2 installation folder, under: `Data/Packages/User`.

If there's no Visual Studio installed on your machine, extra steps are needed to configure system variables.

# Usage

1. Create a project in Sublime Text 2.
2. Copy files under `sample_app` folder to the project folder.
3. Hit `Ctrl + B` to see the result.

# Customization

The default reference search path is `Lib` and the default output path is `Output`. You can modify the `CSharpBuild.sublime-build` file to change them.