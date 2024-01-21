# Coding Standards

This document outlines the coding standards for CC-Vim. Adherence to these standards ensures readability and consistancy for the codebase.

## Variables

### Scope

- Variables should **always** be defined locally.

### Naming Conventions

- **Variables:** Use `snake_case`
- **Constants:** Use `snake_case`
- **Functions and Function Parameters:** Use `snake_case`
- **Objects:** Use `PascalCase`
  - Objects are simply defined as tables that contain hard-coded functions.
- **Files:** Files should be named using the same convention as their export
  - If a file exports a variable, function, or constant, use `snake_case`
  - If a file exports a table, use `PascalCase`
  - Otherwise, use `snake_case`

## Functions

### Scope

- Functions should **always** be defined locally.

### Imperative vs Object Oriented

- Object oriented defenitions of functions (e.g `object.function` or `object:function`) are reserved for functions which when executed only result in modifications to `self`. If there are any side effects outside of `self`, excluding `print()`, the function should be made imperative.

## Modularization

- All lua files should have an explicit **singular** purpose, written as a comment at the top of the file.
- If a singular purpose is provided, it should be in the form of a multiline comment on line 1
- The only exeption is the main `init.lua` file.
