<h1 align="center">Bash Utilites</h1>

<p align="center">
<a href="https://github.com/labbots/bash-utility/blob/master/LICENSE"><img src="https://img.shields.io/github/license/labbots/bash-utility.svg?style=for-the-badge" alt="License"></a>
<a href="https://www.codacy.com/manual/labbots/bash-utility?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=labbots/bash-utility&amp;utm_campaign=Badge_Grade"><img src="https://img.shields.io/codacy/grade/99fbe8d389254b6ebb37899ce89658e3?style=for-the-badge"/></a>
</p>
Bash library which provides utility functions and helpers for functional programming in Bash.

<!-- START generate_readme.sh generated TOC please keep comment here to allow auto update -->
<!-- DO NOT EDIT THIS SECTION, INSTEAD RE-RUN generate_readme.sh TO UPDATE -->
## Table of Contents

- [Array](#array)
  - [array::contains()](#arraycontains)
  - [array::dedupe()](#arraydedupe)
  - [array::is_empty()](#arrayis_empty)
  - [array::join()](#arrayjoin)
  - [array::reverse()](#arrayreverse)
  - [array::random_element()](#arrayrandom_element)
- [File](#file)
  - [file::make_temp_file()](#filemake_temp_file)
  - [file::name()](#filename)
  - [file::basename()](#filebasename)
  - [file::extension()](#fileextension)
  - [file::dirname()](#filedirname)
  - [file::full_path()](#filefull_path)
- [Miscellaneous](#miscellaneous)
  - [misc::check_internet_connection()](#misccheck_internet_connection)
- [String](#string)
  - [string::trim()](#stringtrim)
  - [string::split()](#stringsplit)
  - [string::lstrip()](#stringlstrip)
  - [string::rstrip()](#stringrstrip)
  - [string::to_lower()](#stringto_lower)
  - [string::to_upper()](#stringto_upper)
  - [string::contains()](#stringcontains)
  - [string::starts_with()](#stringstarts_with)
  - [string::ends_with()](#stringends_with)
  - [string::regex()](#stringregex)
- [Variable](#variable)
  - [variable::is_array()](#variableis_array)
  - [variable::is_numeric()](#variableis_numeric)
  - [variable::is_int()](#variableis_int)
  - [variable::is_float()](#variableis_float)
  - [variable::is_bool()](#variableis_bool)
  - [variable::is_true()](#variableis_true)
  - [variable::is_false()](#variableis_false)
- [Inspired By](#inspired-by)
- [License](#license)

<!-- END generate_readme.sh generated TOC please keep comment here to allow auto update -->

<!-- START generate_readme.sh generated SHDOC please keep comment here to allow auto update -->
<!-- DO NOT EDIT THIS SECTION, INSTEAD RE-RUN generate_readme.sh TO UPDATE -->
## Array

Functions for array operations and manipulations.

### array::contains()

Check if item exists in the given array.

#### Example

```bash
array=("a" "b" "c")
array::contains "c" ${array[@]}
#Output
0
```

#### Arguments

- **$1** (mixed): Item to search (needle).
- **$2** (array): array to be searched (haystack).

#### Exit codes

- **0**:  If successful.
- **1**: If no match found in the array.
- **2**: Function missing arguments.

### array::dedupe()

Remove duplicate items from the array.

#### Example

```bash
array=("a" "b" "a" "c")
printf "%s" "$(array::dedupe ${array[@]})"
#Output
a b c
```

#### Arguments

- **$1** (array): Array to be deduped.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Deduplicated array.

### array::is_empty()

Check if a given array is empty.

#### Example

```bash
array=("a" "b" "c" "d")
array::is_empty "${array[@]}"
```

#### Arguments

- **$1** (array): Array to be checked.

#### Exit codes

- **0**: If the given array is empty.
- **2**: If the given array is not empty.

### array::join()

Join array elements with a string.

#### Example

```bash
array=("a" "b" "c" "d")
printf "%s" "$(array::join "," "${array[@]}")"
#Output
a,b,c,d
printf "%s" "$(array::join "" "${array[@]}")"
#Output
abcd
```

#### Arguments

- **$1** (string): String to join the array elements (glue).
- **$2** (array): array to be joined with glue string.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- String containing a string representation of all the array elements in the same order,with the glue string between each element.

### array::reverse()

Return an array with elements in reverse order.

#### Example

```bash
array=(1 2 3 4 5)
printf "%s" "$(array::reverse "${array[@]}")"
#Output
5 4 3 2 1
```

#### Arguments

- **$1** (array): The input array.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- The reversed array.

### array::random_element()

Returns a random item from the array.

#### Example

```bash
array=("a" "b" "c" "d")
printf "%s\n" "$(array::random_element "${array[@]}")"
#Output
c
```

#### Arguments

- **$1** (array): The input array.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Random item out of the array.

## File

Functions for handling files.

### file::make_temp_file()

Create temporary file.
Function creates temporary file with random name. The temporary file will be deleted when script finishes.

#### Example

```bash
echo "$(file::make_temp_file)"
#Output
tmp.vgftzy
```

*Function has no arguments.*

#### Exit codes

- **0**:  If successful.
- **1**: If failed to create temp file.

#### Output on stdout

- file name of temporary file created.

### file::name()

Get only the filename from string path.

#### Example

```bash
echo "$(file::name "/path/to/test.md")"
#Output
test.md
```

#### Arguments

- **$1** (string): path.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- name of the file with extension.

### file::basename()

Get the basename of file from file name.

#### Example

```bash
echo "$(file::basename "/path/to/test.md")"
#Output
test
```

#### Arguments

- **$1** (string): path.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- basename of the file.

### file::extension()

Get the extension of file from file name.

#### Example

```bash
echo "$(file::extension "/path/to/test.md")"
#Output
md
```

#### Arguments

- **$1** (string): path.

#### Exit codes

- **0**:  If successful.
- **1**: If no extension is found in the filename.
- **2**: Function missing arguments.

#### Output on stdout

- extension of the file.

### file::dirname()

Get directory name from file path.

#### Example

```bash
echo "$(file::dirname "/path/to/test.md")"
#Output
/path/to
```

#### Arguments

- **$1** (string): path.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- directory path.

### file::full_path()

Get absolute path of file or directory.

#### Example

```bash
file::full_path "../path/to/file.md"
#Output
/home/labbots/docs/path/to/file.md
```

#### Arguments

- **$1** (string): relative or absolute path to file/direcotry.

#### Exit codes

- **0**:  If successful.
- **1**:  If file/directory does not exist.
- **2**: Function missing arguments.

#### Output on stdout

- Absolute path to file/directory.

## Miscellaneous

Set of miscellaneous helper functions.

### misc::check_internet_connection()

Check if internet connection is available.

#### Example

```bash
misc::check_internet_connection
```

*Function has no arguments.*

#### Exit codes

- **0**:  If script can connect to internet.
- **1**: If script cannot access internet.

## String

Functions for string operations and manipulations.

### string::trim()

Strip whitespace from the beginning and end of a string.

#### Example

```bash
echo "$(string::trim "   Hello World!   ")"
#Output
Hello World!
```

#### Arguments

- **$1** (The): string that will be trimmed.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- The trimmed string.

### string::split()

Split a string to array by a delimiter.

#### Example

```bash
printf "%s" "$(string::split "Hello!World" "!")"
#Output
Hello
World
```

#### Arguments

- **$1** (string): The input string.
- **$2** (string): The delimiter string.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Returns an array of strings created by splitting the string parameter by the delimiter.

### string::lstrip()

Strip characters from the beginning of a string.

#### Example

```bash
echo "$(string::lstrip "Hello World!" "He")"
#Output
llo World!
```

#### Arguments

- **$1** (string): The input string.
- **$2** (string): The characters you want to strip.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Returns the modified string.

### string::rstrip()

Strip characters from the end of a string.

#### Example

```bash
echo "$(string::rstrip "Hello World!" "d!")"
#Output
Hello Worl
```

#### Arguments

- **$1** (string): The input string.
- **$2** (string): The characters you want to strip.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Returns the modified string.

### string::to_lower()

Make a string lowercase.

#### Example

```bash
echo "$(string::to_lower "HellO")"
#Output
hello
```

#### Arguments

- **$1** (string): The input string.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Returns the lowercased string.

### string::to_upper()

Make a string all uppercase.

#### Example

```bash
echo "$(string::to_upper "HellO")"
#Output
HELLO
```

#### Arguments

- **$1** (string): The input string.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Returns the uppercased string.

### string::contains()

Check whether the search string exists within the input string.

#### Example

```bash
string::contains "Hello World!" "lo"
```

#### Arguments

- **$1** (string): The input string.
- **$2** (string): The search key.

#### Exit codes

- **0**:  If match found.
- **1**:  If no match found.
- **2**: Function missing arguments.

### string::starts_with()

Check whether the input string starts with key string.

#### Example

```bash
string::starts_with "Hello World!" "He"
```

#### Arguments

- **$1** (string): The input string.
- **$2** (string): The search key.

#### Exit codes

- **0**:  If match found.
- **1**:  If no match found.
- **2**: Function missing arguments.

### string::ends_with()

Check whether the input string ends with key string.

#### Example

```bash
string::ends_with "Hello World!" "d!"
```

#### Arguments

- **$1** (string): The input string.
- **$2** (string): The search key.

#### Exit codes

- **0**:  If match found.
- **1**:  If no match found.
- **2**: Function missing arguments.

### string::regex()

Check whether the input string matches the given regex.

#### Example

```bash
string::regex "HELLO" "^[A-Z]*$"
```

#### Arguments

- **$1** (string): The input string.
- **$2** (string): The search key.

#### Exit codes

- **0**:  If match found.
- **1**:  If no match found.
- **2**: Function missing arguments.

## Variable

Functions for handling variables.

### variable::is_array()

Check if given variable is array.

#### Example

```bash
array=("a" "b" "c")
variable::is_array "${array[@]}"
#Output
0
```

#### Arguments

- **$1** (mixed): Value of variable to check.

#### Exit codes

- **0**:  If input is array.
- **1**: If input is not an array.

### variable::is_numeric()

Check if given variable is a number.

#### Example

```bash
variable::is_numeric "1234"
#Output
0
```

#### Arguments

- **$1** (mixed): Value of variable to check.

#### Exit codes

- **0**:  If input is number.
- **1**: If input is not a number.

### variable::is_int()

Check if given variable is an integer.

#### Example

```bash
variable::is_int "+1234"
#Output
0
```

#### Arguments

- **$1** (mixed): Value of variable to check.

#### Exit codes

- **0**:  If input is an integer.
- **1**: If input is not an integer.

### variable::is_float()

Check if given variable is a float.

#### Example

```bash
variable::is_float "+1234.0"
#Output
0
```

#### Arguments

- **$1** (mixed): Value of variable to check.

#### Exit codes

- **0**:  If input is a float.
- **1**: If input is not a float.

### variable::is_bool()

Check if given variable is a boolean.

#### Example

```bash
variable::is_bool "true"
#Output
0
```

#### Arguments

- **$1** (mixed): Value of variable to check.

#### Exit codes

- **0**:  If input is a boolean.
- **1**: If input is not a boolean.

### variable::is_true()

Check if given variable is a true.

#### Example

```bash
variable::is_true "true"
#Output
0
```

#### Arguments

- **$1** (mixed): Value of variable to check.

#### Exit codes

- **0**:  If input is true.
- **1**: If input is not true.

### variable::is_false()

Check if given variable is false.

#### Example

```bash
variable::is_false "false"
#Output
0
```

#### Arguments

- **$1** (mixed): Value of variable to check.

#### Exit codes

- **0**:  If input is false.
- **1**: If input is not false.

<!-- END generate_readme.sh generated SHDOC please keep comment here to allow auto update -->

## Inspired By

- [Bash Bible](https://github.com/dylanaraps/pure-bash-bible) - A collection of pure bash alternatives to external processes.
  
## License

[MIT](https://github.com/labbots/google-drive-upload/blob/master/LICENSE)
